# CLAUDE.md — bostrom-journal

Two documents carry the content:
- `BostromJournal001.md` — hand-written and precise. The reference for tone and accuracy.
- `BostromJournal002.md` — in active editing.

## Editing the documents

- **Prefer small atomic diffs over regeneration.** Do not rewrite a whole document. One logical change per commit, so any single change can be reverted on its own.
- **Name what is frozen.** In each task, say what may change and what may not — e.g. "grammar only, change no defined term" vs "you may restructure, but the definitions below are frozen; quote them back unchanged."
- **The author reviews every commit.** Commit after each change atomically. If in doubt, or something is missing — ask, do not guess.
- **Review for fidelity, not only polish.** A clarity/consistency pass can approve a document that has drifted from its model. Check edits against the invariants below.
- **Review the git log for the reasoning behind choices.**

## Invariants (frozen definitions — do not redefine)

In the author's words:

- A **cyberlink** is an edge of the cybergraph: a connection of exactly two particles, authored by a **neuron** (a private-key holder or an autonomous contract). Nothing else is a cyberlink.
- A **particle** is an IPFS content hash (a CID).
- **`hash(...)`** is always one operation: compute a particle's CID.
- **`hash(A, B)`** is a cyberlink reference —  it allows treating the edge as a particle you can point at.
- A **convention** is an agreement about how to **issue** an instruction for processing the cybergraph — and how to **interpret** it. A convention is the shared rule for encoding an instruction into the graph and reading it back; it is **not** an edge in the graph, and not the processing that consumes the instruction. Never write "a convention is a cyberlink."
- This is an instruction example: `hash("deny") → hash(A, B)`.
- The cybergraph is permissionless and general-purpose: anyone can write into it their own way, and anyone can read and process it their own way.

