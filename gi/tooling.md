# Intention

Let's replace Claude Code's chat with this version-controlled file.
We invent rules along the way and just use common-sense logic to make our work convenient and effective.

## Rules

- Don't restate the diff. Be brief.
- Issue an instruction as a `!!` marker (on its own line or beside the target) or as the commit message; a direct edit is itself an instruction. Apply each marker, then delete it.
- A commit message explains a decision by default — honor and propagate it; if it reads as an imperative, execute it.
- Commit each logical change atomically and promptly: every commit is the reply and a rollback point. The body records the decision and why, not the diff; propagate it to any reference it makes stale.
- If a reply would be large, write it to a file and commit that, instead of pasting it here.

# Scratchpad

## Preface

Currently the project:

1. I believe has huge potential for real-world usefulness
2. Is a mess in this repo (initial tooling for producing the output is lost, there are several parallel branches with different types of work based on various ancestors).

Plus the current file (git intent/scratchpad) is a new mechanic.

But I believe we can have fun with it, and maybe even get something useful out of it. So let's jam.

## Big goal

I want to have tooling for working with BostromJournal-like projects in nushell. Among other things, we need commands to parse journals, propagate changes, calculate CIDs, and print them back into journals.

We should draw our inspiration from `git` whenever possible.

But I would like to go step by step and start with simple things that are needed at the current moment.

## Intermediate goal — regenerate edited particles

Nushell plumbing, git-style, that for each chapter edited on this branch (diff `BostromJournal001.md` against `main`) rebuilds its particle and rewires the link.

Per changed chapter:

1. Build the new particle = a YAML frontmatter header carrying **only** the previous particle's CID as a plain string in `parent` (drop author, epoch, similarity, cyberrank, cyberlink fields, and the old footer's markdown link), then the chapter body — the heading as a single `#` (h1) with its `[~](particles/<cid>.md)` link removed, the chapter text, and a single trailing newline:

   ```
   ---
   parent: <prev-cid>
   ---

   # <chapter heading>

   <chapter text>
   ```

2. Name it by its own CID, computed with `cid-v0.nu`.
3. Write the new CID back into that chapter's `[~](particles/<cid>.md)` link in `BostromJournal001.md`.

Leave unchanged chapters and their particles as-is. Chapters without `[~]` have no previous particle — out of scope.

Details — how a CID is computed and the generator pipeline, plus (as background, not needed for new particles) the analysis of reproducing the legacy CIDs: `cid-reproduction-research.md`.

## The `[~]()` genesis convention — new chapters

A heading marker `[~]` has three states, and `regenerate` handles each differently:

- `[~](particles/<cid>.md)` — an existing particle. Regenerate only if its body changed vs `main` (diff-driven).
- `[~]()` — genesis: a new chapter with no parent yet. Generate its particle now, regardless of `main` (marker-driven, not diff-driven), then fill the marker to `[~](particles/<new-cid>.md)`.
- no `[~]` marker — not a particle, ignored (e.g. `## Preface to version 1.1`).

A genesis particle is a **bare body** — no frontmatter at all: the `# <heading>` line, the chapter text, and one trailing newline. The rule: a `parent:` frontmatter means the particle has a previous version; its absence means genesis. (Bare bodies also match how the original cyber particles were stored.) When such a chapter is later edited, its next version picks up `parent: <genesis-cid>` through the normal edited-chapter path — no special handling.

The rewire of `[~]()` markers is positional, by heading line index. Multiple `[~]()` markers are byte-identical, so a document-wide string replace would mis-target; each marker is rewritten on its own line.
