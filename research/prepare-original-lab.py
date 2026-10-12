"""Prepare one disposable, fingerprinted original-game copy; never launch it.

Usage: python research/prepare-original-lab.py --name baseline-001
Run audit-fidelity-foundations.py first. Existing experiments are never replaced.
The copied MDATA files include supplied mutable world state, not certified new-game defaults.
"""
from pathlib import Path
import argparse
import hashlib
import json
import re
import zipfile

ROOT = Path(__file__).resolve().parent
PROJECT = ROOT.parent


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--name", required=True)
    args = parser.parse_args()
    if not re.fullmatch(r"[a-z][a-z0-9-]{0,47}", args.name):
        parser.error("Use a lowercase letter followed by up to 47 letters/digits/hyphens.")
    audit = ROOT / "fidelity-foundations"
    manifest = json.loads((audit / "source-manifest.json").read_text())
    source = Path(manifest["source_root"]).resolve()
    inventory = json.loads((ROOT / "local-original/source-inventory.json").read_text())["files"]
    experiment = (PROJECT / ".tools/original-lab" / args.name).resolve()
    assert experiment.is_relative_to(PROJECT.resolve()) and not experiment.is_relative_to(source)
    if experiment.exists():
        parser.error(f"Refusing to replace existing experiment: {experiment}")
    payloads = {}

    def original(relative, destination):
        data = (source / relative).read_bytes()
        expected = inventory[relative.replace("/", "\\")]
        assert dict(size=len(data), sha256=digest(data)) == expected, relative
        payloads[destination] = (data, relative)

    for name in ["MORDOR.EXE", "MORDOR.HLP"]:
        original("_Original Game Files/" + name, name)
    for folder in ["DATA", "MUSIC"]:
        for path in sorted((source / "_Original Game Files" / folder).iterdir()):
            if path.is_file():
                original(path.relative_to(source).as_posix(), folder + "/" + path.name)
    deps = json.loads((audit / "runtime-dependencies.json").read_text())["dependencies"]
    assert all(d["available"] for d in deps)
    for dep in deps:
        data = (audit / "runtime-libraries" / dep["name"]).read_bytes()
        assert digest(data) == dep["staged_sha256"]
        payloads[dep["name"]] = (data, "fidelity-foundations/runtime-libraries/" + dep["name"])
    package_path = "Mordor/setup/MORDOR.WIP"
    package = source / package_path
    assert digest(package.read_bytes()) == manifest["files"][package_path]["sha256"]
    with zipfile.ZipFile(package) as archive:
        payloads["WAVEMIX.INI"] = (archive.read("WAVEMIX.INI"), package_path + "::WAVEMIX.INI")
    experiment.mkdir(parents=True)
    copied = []
    for relative, (data, origin) in payloads.items():
        destination = experiment / "game" / relative
        assert destination.resolve().is_relative_to(experiment)
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(data)
        assert destination.read_bytes() == data
        copied.append(dict(path="game/" + relative, source=origin, size=len(data), sha256=digest(data)))
    report = dict(name=args.name, status="prepared_not_executed", files=copied,
                  copied_world_is_canonical_new_game=False, runtime_runner=None,
                  note="No original program executed. Requires a verified Win16 environment; runner, configuration and RNG conditions must be recorded before comparison.")
    (experiment / "initial-manifest.json").write_text(json.dumps(report, indent=2) + "\n")
    (experiment / "observations.json").write_text(json.dumps(dict(case_id=None, status="not_run",
        runtime_environment=None, configuration=None, rng_initial_state=None, input_sequence=[], observations=[],
        recordings=[], conclusion=None), indent=2) + "\n")
    (experiment / "README.txt").write_text("Prepared original-game experiment; not executed.\n"
        "The game folder is a disposable copy. Initial hashes are outside it.\n"
        "Use a dedicated Win16 environment configured to keep game/configuration writes in this experiment.\n"
        "Do not launch the original source tree. Record the runtime and configuration in observations.json.\n"
        "Original-game timing and random behavior remain unverified.\n")
    save = audit / "lab-preparation.json"
    save.write_text(json.dumps(dict(experiment=str(experiment), status="prepared_not_executed", files=len(copied),
                                   manifest=str(experiment / "initial-manifest.json")), indent=2) + "\n")
    print(json.dumps(dict(experiment=str(experiment), files=len(copied), status="prepared_not_executed"), indent=2))


if __name__ == "__main__":
    main()
