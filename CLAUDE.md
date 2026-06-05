# CLAUDE.md — bostrom-journal

Reference documentation for blockchain-based cybergraph patterns; predecessor to `open-knowledge-pack/`.

Two documents carry the content:
- `BostromJournal001.md` — hand-written and precise. The reference for tone and accuracy.
- `BostromJournal002.md` — in active editing.

## Editing the documents

These documents encode a precise model. Wording that looks ordinary is often deliberate and load-bearing. Open-ended edits ("revise", "make it perfect", "anything subject for rewrite?") have repeatedly overwritten that wording and lost the author's point — the same correction then had to be repeated across several sessions.

- **Prefer small atomic diffs over regeneration.** Do not rewrite a whole document. One logical change per commit, so any single change can be reverted on its own.
- **Name what is frozen.** In each task, say what may change and what may not — e.g. "grammar only, change no defined term" vs "you may restructure, but the definitions below are frozen; quote them back unchanged."
- **The author reviews every commit.** Commit after each change. If in doubt, or something is missing — ask, do not guess.
- **Review for fidelity, not only polish.** A clarity/consistency pass can approve a document that has drifted from its model. Check edits against the invariants below.

## Invariants (frozen definitions — do not redefine)

In the author's words:

- A **cyberlink** is an edge of the cybergraph: a connection of exactly two particles, authored by a **neuron** (a private-key holder or an autonomous contract). Nothing else is a cyberlink.
- A **particle** is an IPFS content hash (a CID).
- **`hash(...)`** is always one operation: compute a particle's CID.
- **`hash(A, B)`** is a convention for *referencing* a cyberlink — treating the edge as a particle you can point at. An addressable edge can then be hashed together with others into a **composite particle**.
- **Conventions** are rules for *processing* the raw cybergraph (building an interpretation of it). They are **not** edges in the graph. Never write "a convention is a cyberlink."
- An instruction is issued by placing a **verb particle** — e.g. `hash("deny")` or `hash("quote", A)` — at the source of an ordinary edge. Example: `hash("deny") → hash(A, B)`.
- The cybergraph is permissionless and general-purpose: anyone can write into it their own way, and anyone can read and process it their own way.

## Terminology locks

- **"verb particle"**, not "marker".
- **"convention"** for confirm / deny / update / quote. **"primitive"** is reserved for the cyberlink itself ("four conventions on one primitive").
- **Provenance markers**: `[~](cid)` inline in link content points to the source IPFS hash (used throughout BJ001).
