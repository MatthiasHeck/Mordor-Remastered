extends RefCounted
## Recoverable multi-file save, for one writing application per directory.
## The rollback journal is removed only after all candidate files are installed.
const NAMES = ["MDATA4.MDR","MDATA8.MDR","MDATA9.MDR","MDATA10.MDR","combat-state.json"]
const JOURNAL = "campaign.pending.json"
var error = ""

func write_verified(path: String, bytes: PackedByteArray) -> bool:
	var file = FileAccess.open(path,FileAccess.WRITE)
	if file == null:
		error = "Cannot write " + path.get_file()
		return false
	file.store_buffer(bytes)
	file.flush()
	var result = file.get_error()
	file.close()
	if result != OK or FileAccess.get_file_as_bytes(path) != bytes:
		error = "Save verification failed: " + path.get_file()
		return false
	return true

func snapshot(path: String) -> Dictionary:
	if not FileAccess.file_exists(path): return {"exists":false}
	var file = FileAccess.open(path,FileAccess.READ)
	if file == null:
		error = "Cannot read " + path.get_file()
		return {}
	var bytes = file.get_buffer(file.get_length())
	file.close()
	return {"exists":true,"bytes":Marshalls.raw_to_base64(bytes),"sha256":digest(bytes)}

static func digest(bytes: PackedByteArray) -> String:
	var hash = HashingContext.new()
	hash.start(HashingContext.HASH_SHA256)
	hash.update(bytes)
	return hash.finish().hex_encode()

func checked_snapshot(value) -> bool:
	if not value is Dictionary or not value.get("exists") is bool: return false
	if not value.exists: return true
	if not value.get("bytes") is String or not value.get("sha256") is String: return false
	return digest(Marshalls.base64_to_raw(value.bytes)) == value.sha256

func restore(path: String, state: Dictionary) -> bool:
	if not state.exists:
		if FileAccess.file_exists(path) and DirAccess.remove_absolute(path) != OK:
			error = "Cannot roll back " + path.get_file()
			return false
		return true
	var temporary = path + ".recover"
	if not write_verified(temporary,Marshalls.base64_to_raw(state.bytes)): return false
	if FileAccess.file_exists(path) and DirAccess.remove_absolute(path) != OK:
		error = "Cannot replace " + path.get_file() + " during recovery"
		return false
	if DirAccess.rename_absolute(temporary,path) != OK:
		error = "Cannot restore " + path.get_file()
		return false
	return true

func recover(directory: String) -> bool:
	error = ""
	var path = directory.path_join(JOURNAL)
	if not FileAccess.file_exists(path): return true
	var journal = JSON.parse_string(FileAccess.get_file_as_string(path))
	if not journal is Dictionary or journal.get("format") != 1 or not journal.get("files") is Array or journal.files.is_empty():
		error = "Invalid save recovery journal; files were not changed."
		return false
	var seen = {}
	# Validate every entry before touching any path. Only our working MDR files qualify.
	for entry in journal.files:
		if not entry is Dictionary or not entry.get("name") in NAMES or seen.has(entry.get("name")) or not checked_snapshot(entry.get("before")) or not checked_snapshot(entry.get("backup")):
			error = "Invalid save recovery entry; files were not changed."
			return false
		seen[entry.name] = true
	for entry in journal.files:
		var target = directory.path_join(entry.name)
		if not restore(target,entry.before) or not restore(target + ".bak",entry.backup): return false
	if DirAccess.remove_absolute(path) != OK:
		error = "Recovery finished, but its journal could not be removed."
		return false
	return true

func install(path: String, existed: bool) -> bool:
	if existed:
		if FileAccess.file_exists(path + ".bak") and DirAccess.remove_absolute(path + ".bak") != OK:
			error = "Cannot rotate backup: " + path.get_file()
			return false
		if DirAccess.rename_absolute(path,path + ".bak") != OK:
			error = "Cannot back up " + path.get_file()
			return false
	if DirAccess.rename_absolute(path + ".tmp",path) != OK:
		error = "Cannot finalize " + path.get_file()
		return false
	return true

# changes: {name, bytes, baseline, existed}; bytes never go through JSON numbers.
func commit(directory: String, changes: Array) -> bool:
	error = ""
	if FileAccess.file_exists(directory.path_join(JOURNAL)):
		error = "Reopen the roster to recover the interrupted save before continuing."
		return false
	if DirAccess.make_dir_recursive_absolute(directory) != OK:
		error = "Cannot create save directory."
		return false
	var journal = {"format":1,"files":[]}
	var names = {}
	for change in changes:
		if not change.name in NAMES or names.has(change.name):
			error = "Invalid transaction file."
			return false
		names[change.name] = true
		var path = directory.path_join(change.name)
		if FileAccess.file_exists(path) != change.existed or (change.existed and FileAccess.get_file_as_bytes(path) != change.baseline):
			error = "This save changed in another window. Reopen the roster before saving."
			return false
		journal.files.append({"name":change.name,"before":snapshot(path),"backup":snapshot(path + ".bak")})
		if not error.is_empty(): return false
	for change in changes:
		if not write_verified(directory.path_join(change.name + ".tmp"),change.bytes): return false
	var journal_path = directory.path_join(JOURNAL)
	if not write_verified(journal_path + ".tmp",JSON.stringify(journal).to_utf8_buffer()): return false
	if DirAccess.rename_absolute(journal_path + ".tmp",journal_path) != OK:
		error = "Cannot prepare recovery journal."
		return false
	var success = true
	for change in changes:
		if not install(directory.path_join(change.name),change.existed):
			success = false
			break
	if success and DirAccess.remove_absolute(journal_path) == OK: return true
	var failure = error if not error.is_empty() else "Cannot complete save journal."
	if not recover(directory): failure += " Recovery pending: " + error
	error = failure
	return false
