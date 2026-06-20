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

1. Build the new particle = chapter body + a slim footer carrying **only** the previous particle's CID (drop author, epoch, similarity, cyberrank, cyberlink fields):

   ```
   ---

   ###### Information on the article’s previous version  

   cid: [<prev-cid>](https://cyb.ai/ipfs/<prev-cid>)  
   ```

2. Name it by its own CID, computed with `cid-v0.nu`.
3. Write the new CID back into that chapter's `[~](particles/<cid>.md)` link in `BostromJournal001.md`.

Leave unchanged chapters and their particles as-is. Chapters without `[~]` have no previous particle — out of scope.

Details — CID reproduction, the byte-exactness traps, why slimming the footer re-mints the CID even for unchanged text, and the generator pipeline: `cid-reproduction-research.md`.
