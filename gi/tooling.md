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

## Intermediate goal

On the current branch I updated some chapters in `BostromJournal001.md` (see the diff against `main`).


