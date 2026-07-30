---
parent: QmYcCP7x2kDQ466fmLMiPToDpUsXYDRDqF9hRvqQ5D4LUb
---

# Appendix: Cybergraph format

A CID is always CID v0: the content is wrapped into a standard IPFS block (UnixFS dag-pb), hashed with sha2-256, and the hash is encoded in base58 — the result is a string of the form Qm…. The same result is produced by `ipfs add --cid-version=0`.

The signer (the `signer` field in the record) is the CID of their public key. Here the format deliberately diverges from Bostrom, where the signer is recorded as a `bostrom1…` address (see "Fundamentals"): the format takes the key's CID so that the signer is addressable like any other CID. There must be one encoding of the signer: if one signer can be written in different ways (as an address, as a bare key), the same act gets different derived CIDs of the cyberlink. Addressing of the act breaks: `deny` of a cyberlink, revoking one's own cyberlink, disputing a specific signer's agreement — edges computed from different encodings of the signer target different CIDs, and their repetitions do not match in aggregation. Weighting suffers too: one signer under two encodings reads as two. The address is a hash of the key, and the key cannot be computed back; for conversion the key is taken from the transaction carrying the cyberlink — the transaction publishes the signer's key next to the signature — and its CID is computed; without this step a Bostrom cyberlink's derived CID cannot be computed.

`hash(x, y, …)` is always the CID of the string of arguments joined with commas; the result is a derived CID. Two special cases: the edge address — `hash(cid_from, cid_to)`; the cyberlink's derived CID — `hash(cid_from, cid_to, signer)`. Joining with commas is one particular choice of encoding, taken here for clarity: the arguments can be encoded otherwise — for example, by a canonical serialization of the record into JSON. What does not change: the encoding must be one and the same for everyone — otherwise, as with two encodings of the signer above, the same act gets different derived CIDs.
