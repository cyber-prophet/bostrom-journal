---
parent: Qmd8C1vCR4KkfECE8SroHgtqJVmxvzbBbXtCMvm6n2AtYn
---

# Journal's standard formatting markup and tags

All the particles were formatted using [Prettier](https://prettier.io/), an opinionated code formatter.

- `[~]` - the tag that links a chapter to its particle. `[~](particles/<cid>.md)` points to the particle this chapter is based on; an empty `[~]()` marks a new chapter that has no particle yet (genesis).

The `particles/` folder is a local mirror of the current version of each particle, so you can read them without fetching from IPFS. Each file name is a particle's CID, and the file is exactly the content that CID addresses. When a chapter has been updated since its first publication, its particle starts with a YAML `parent` field — the CID of the previous version — and the versions form a chain through it. Particles not yet updated keep their metadata in a footer at the bottom instead.
