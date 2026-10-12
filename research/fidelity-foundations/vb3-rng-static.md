# VB3 Rnd static candidate — October 11, 2026

The campaign RNG candidate is derived from bytes in the supplied `VBRUN300.DLL`, rather than Godot's RNG. [The verification report](vb3-rng-static.json) records the DLL hash, exact instruction bytes, file offsets, data constants, and sixteen controlled-seed results. `node Godot/tools/verify-vb-rng.mjs` verifies the bytes and compares 10,000 updates computed independently with halfword arithmetic and BigInt.

The block starting at file offset 228026 loads seed halves at DS:0E16/0E18. It multiplies the low seed half by the word at DS:1490, keeps the low result in DI and its carry in BX, and adds the two cross-products. Both cross-products use the same low word `43FD`; the second load also addresses DS:1490. It adds `9EC3` to DI, then adds the byte at DS:1494 (`C3`) plus carry to BL. Clearing BH keeps only 24 bits. The stored seed is converted with FILD and divided by the Single at DS:1498 (`16777216`). The initial seed bytes at file offset 294646 are `00 00 05 00`.

This gives the recurrence `state = (state × 0xFD43FD + 0xC39EC3) & 0xFFFFFF` and result `state / 2^24`. The first result from the controlled initial seed is `0.7055475115776062`.

This is static inference, not an observed original-runtime trace. The original game and runtime have not been executed. Startup `Randomize` seed derivation, timer ordering, ambient and music draws, shared-stream behavior, and differences caused by damaged recovered control flow remain unresolved. The Godot campaign deliberately uses a controlled seed, saves the stream with character and encounter changes, and pauses without offline catch-up. These choices establish repeatable campaign behavior; they do not establish original-game sequence parity.
