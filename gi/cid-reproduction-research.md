# Research: reproducing particle CIDs

Scope: the intermediate goal in `tooling.md` — regenerate `particles/` from the edited `BostromJournal001.md`, give each new particle a slim `parent` frontmatter (only the previous-version CID), and check whether unchanged particles keep their old CID. All claims below are verified against the 66 files now in `particles/`, using both `ipfs` and the pure-Nushell `cid-v0.nu` module.

**Two separate problems — keep them apart.** Making *new* particles (the goal) is the easy one: you define the format, write clean bytes, hash them. The byte-exactness traps and the "can an unchanged particle keep its old CID" question below do **not** apply to new particles — a new or edited body simply gets a new CID, as it should. They are about *reproducing the legacy CIDs* of the existing 66 files, which is the harder problem this research mostly documents.

## What a particle CID is

A particle's filename is the IPFS CID v0 of the **exact bytes of the whole file** — article body, the `---` separator, and the footer, all included. Reproduced for all 66 files, zero mismatches:

```
ipfs add --only-hash --quieter --cid-version=0 --raw-leaves=false <file>   # == filename, 66/66
```

The pure-Nushell module gives the identical result, so no `ipfs` binary is needed at runtime:

```nu
use /Users/user/git/ai-sandbox-dev-container/nu-multiproof/nu-multiproof/cid-v0.nu
open --raw <file> | into binary | cid-v0      # == filename, 66/66 (incl. the 18 KB file)
```

The two are the same function: the module's header documents it as reproducing exactly those `ipfs add` flags. CID v0 = base58( 0x1220 ++ sha256( dag-pb( UnixFS-File( bytes ) ) ) ).

## The hash is easy; reproducing the input bytes is the hard part

The hash is a pure function of bytes, fully deterministic. "Tricky" is not the hash — it is feeding it the **exact** original bytes. Any of these silently changes the CID:

- Trailing two-space hard-break markers (`  `) on the h6 footer heading and the `cid:` line. The originals have them.
- The final-newline count. Files end with a blank line (trailing `\n\n`).
- Unicode. "article's" uses a curly apostrophe U+2019 (bytes `e2 80 99`), not ASCII `'`. Em-dashes likewise. Normalizing to ASCII breaks the CID.
- Line endings must stay LF, never CRLF.
- Size. The current `cid-v0.nu` only handles a single chunk (< 256 KB). Every current particle fits (largest is 18 KB). A future particle over 256 KB needs the chunked balanced-DAG algorithm — the module errors out instead of producing a wrong hash, which is the right failure.

## Old bodies are not uniformly normalized

There is **no single rule** that turns a document heading into its particle body, so old bytes cannot be regenerated from `BostromJournal001.md`:

- `### Publication Frequency` → particle body starts `# Publication Frequency` (kept as an h1, anchor stripped).
- `## Apps built on Bostrom, for Bostrom` → particle body starts `Apps built on Bostrom, for Bostrom` (no `#` at all).

The particles were made at different times by different steps. Treat the files in `particles/` as the **authoritative legacy bytes**; do not assume a regeneration step can reproduce them.

## Can unchanged particles keep their old CID? Not while slimming the footer.

The two wishes in `tooling.md` conflict:

1. "keep only the previous-version CID, drop the old fields" — changes the footer bytes.
2. "unchanged particles' CIDs should match their old versions" — needs the bytes to stay identical.

Because the CID hashes the **whole file**, changing the footer changes the CID — even when the article text did not change. So under the current scheme (particle = body + footer, named by whole-file CID), slimming the footer re-mints **every** CID. You cannot have both.

## The clean alternative: hash the body, keep the footer as a sidecar

If the hashed unit is the **article body only** and the footer/lineage lives outside the hashed bytes (a sidecar, or front-matter excluded from the hash), then unchanged text keeps a stable CID no matter how the footer format evolves. This is also how cyber originally stored these: the original particles were bare bodies. Evidence — for 21 of the 66 files the body-before-`---` still hashes exactly to the CID its own footer names as "previous version":

```
body CID == footer's previous-version CID:  21 / 66
```

Those 21 are the sections whose text never changed since the cyber era; the other 45 had edited text, so their body hashes to something new — which is the correct behavior for a content address. Adopting body-as-particle would not just "match old versions", it would recover the original cyber CIDs for unchanged sections.

This is the format change `tooling.md` already anticipates ("Later I guess we'll need to change the whole format"). Recommendation: when that change happens, hash the body and treat lineage as sidecar metadata. Until then, accept that slimming the footer gives new CIDs.

## Two classes of particle: carried in vs edited

Every one of the 66 particles carries a "previous version" pointer in its footer, so lineage metadata exists for all of them. Whether that previous version is a *different* text or the *same* one is recorded by the footer's own metrics — `levenshtein similarity` and `cosine similarity`:

- both `= 1` → the text is identical to the previous version; the particle entered the journal unchanged in this step. 30 of the 66.
- either `< 1` → the text differs from the previous version; a real earlier version was edited. 36 of the 66.

So the set splits into two classes, as suspected: about 30 particles were carried into the journal unchanged, and 36 were edited from a genuine prior version.

Two cautions on reading this:

- "Unchanged" means unchanged *relative to the recorded previous version*. It does not prove the particle was first written for the journal — only that this lineage step changed nothing. The footer attests "no change here", not origin.
- The 21 body-hash matches above are a stricter subset of these 30. Those 21 had a bare-body predecessor (the cyber original), so the body hashes to the previous CID. The other 9 unchanged-text particles had a predecessor that was itself footer-wrapped, so the bare body does not hash to it even though the text never changed — the lineage is just one generation deeper.

Reproduce the split by parsing each footer for `levenshtein similarity: (?<v>[0-9.]+)` and `cosine similarity: (?<v>[0-9.]+)`, then counting `v == 1` against `v < 1`.

## What the generator needs (once the format question is settled)

- Parse `BostromJournal001.md` into sections by the heading anchors `## Heading [~](particles/<CID>.md)`. The CID in the anchor is the section's current particle, and becomes the new particle's "previous version".
- Build each particle's bytes exactly (see the byte-exactness list above), prepend the `parent` frontmatter, hash with `cid-v0`, write `particles/<new-cid>.md`, and update the anchor in the document to the new CID.
- The metadata, as established, is a YAML frontmatter header carrying only the parent CID as a plain string (no markdown link):

```
---
parent: <prev-cid>
---
```

- This is plumbing, git-style: `cid-v0` is the equivalent of `git hash-object`; the generator is `write-tree`. Building these as small composable commands (parse → body → frontmatter → hash → place) matches the `tooling.md` goal.
