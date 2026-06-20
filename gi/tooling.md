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

So, using plumbing commands, we should be able to receive the new particles in `particles/` with only one part from the old format, of this kind:

<selected-text file="/Users/user/git/cy-container/bostrom-journal/particles/QmNSBAUQG5M5L233D8M9w3J5CV76Kwub4PKNSYs7EAHa1T.md" lines="5-9">---

###### Information on the article’s previous version  

cid: [QmeXv3wAdqXEanK12cPp24RTqV4a4AsWCHAPUX2rQ7sovN](https://cyb.ai/ipfs/QmeXv3wAdqXEanK12cPp24RTqV4a4AsWCHAPUX2rQ7sovN)  
</selected-text>

i.e. the h6 heading and the CID of the previous version.

Later I guess we'll need to change the whole format, but for now let's keep it as it was established (minus the old fields that I don't want to support now).

Calculating CIDs is tricky, but the unchanged particles' CIDs should match their old versions (if it is possible — research this).

We have IPFS to check against, but import the algorithm to use i n general from /Users/user/git/ai-sandbox-dev-container/nu-multi proof/nu-multiproof/cid-v0.nu 55

!! spin an agent or do research yourself on achieving what I want. Write the most important findings back to this file, and the whole research into different artifact
