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

## Findings (CID reproduction)

Full research: `cid-reproduction-research.md`.

- A particle's CID is the IPFS CID v0 of the **whole file's exact bytes** (body + `---` + footer). Verified on all 66 particles, with both `ipfs add --only-hash --quieter --cid-version=0 --raw-leaves=false` and the pure-Nushell `cid-v0.nu`. The two agree exactly, so we don't need the `ipfs` binary at runtime.
- The hash is the easy part. The hard part is feeding it the **exact** original bytes: trailing two-space line breaks, the final blank line, the curly apostrophe `’` (U+2019, not ASCII), and LF endings all change the CID. The module only handles files under 256 KB (all current particles fit; largest is 18 KB).
- **The two goals conflict.** Because the CID hashes the whole file, slimming the footer changes the CID — even for chapters whose text didn't change. So "unchanged particles keep their old CID" is **not** possible while we also drop the old footer fields. We can have one or the other, not both.
- The clean fix is the format change already anticipated above: hash the **body only**, keep the footer/lineage as a sidecar outside the hashed bytes. Then unchanged text keeps a stable CID. This is also cyber's original model — 21 of the 66 current bodies already hash exactly to the CID their own footer names as "previous version".
- Old particle bodies are **not** uniformly normalized (one keeps `# Heading`, another drops the `#`), so old bytes can't be regenerated from the document by one rule. Treat `particles/` as the authoritative legacy bytes.
- The 66 existing particles split two ways, recorded by each footer's `levenshtein`/`cosine similarity`: 30 entered the journal with text unchanged (similarity = 1), 36 were edited from a real previous version (similarity < 1). The 21 body-equals-previous-CID matches are the subset whose predecessor was a bare cyber body.


Users thoughts:

once again, we checked that: 
1. In the titile of chapters in BostromJournal001.md there are links on markdown files.
2. Each markdown file is named by its own CID and contains CID of the previous particle.
3. We can just assume that metadata footer in the previous particles is correct, but it is irrelevant to our task
4. for our task we can produce the similiar kind output with only updated particles and put into metadata footer the field with the previous version of the particle cid, and put back into bj001 newly generated cids where relevant.
 
