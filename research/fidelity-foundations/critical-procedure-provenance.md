# Critical-procedure provenance — R02

This map deliberately distinguishes four kinds of evidence: source line identity, generated-symbol call graph, long-string data anchors, and executable code-address mapping. Only the first three are established here.

The supplied DoDi names (`fn0DEE`, `sub155A`, and similar) are names in decompiler output. They are not symbols exported by `MORDOR.EXE`. The Reko project contains segmented disassembly and p-code, but does not preserve the DoDi procedure names. A string found in the executable proves that data exists in the binary; it does not prove which routine references that data.

For each selected routine, `critical-procedure-provenance.csv` records its source line range, generated calls and callers, conversion/error/timer markers, and any long-string match. The `machine_code_address` field remains `unresolved` until a relocation-aware p-code/xref mapping is established.

The highest-risk example is `Module4.fn0DEE`: its source body has no long string literal, so its current evidence is source identity plus callers (`Module4.fn0DCD`). The numerical expression is therefore not yet executable-address verified. The combat timer callback similarly has no direct string anchor; its static timing evidence comes from source and form bytes, not a mapped procedure address.

The segment-level portion of that operation is now complete in [`reko-segment-relocation-map.csv`](reko-segment-relocation-map.csv) and [`reko-segment-relocation-summary.json`](reko-segment-relocation-summary.json). All 50 saved Reko byte dumps map to the NE image; 48 are byte-verified and two are identified by unique declared allocation size because they contain only zero/BSS-style data. The saved project has a function listing for only one segment, so none of the 37 selected DoDi procedures can receive an executable address from the saved Reko output.

The remaining R02 operation is to obtain function-level Reko p-code/disassembly with entry ranges and relocation-aware call/global-reference xrefs. A successful result must include a segment:offset, a byte range, and the evidence used; a failed or ambiguous match must remain explicitly unresolved.
