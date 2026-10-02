---
parent: QmZGdJd9GTGQQQhXXCWRpof4KJGBeDkyejPkKsDHp6NMQU
---

# Appendix: Cybergraph format

A CID is always CID v0:
the content is wrapped into a standard IPFS block (UnixFS dag-pb), hashed with sha2-256,
and the hash is encoded in base58
— the result is a string of the form Qm….
The same result is produced by `ipfs add --cid-version=0`.

The signer (the `signer` field in the record) is the CID of their public key.
Here the format deliberately diverges from Bostrom,
where the signer is recorded as a `bostrom1…` address (see "Fundamentals"):
the format takes the key's CID
so that the signer is addressable like any other CID.
There must be one encoding of the signer:
if one signer can be written in different ways (as an address, as a bare key),
the same act gets different derived CIDs of the cyberlink.
Addressing of the act breaks:
`deny_link`, revoking one's own cyberlink, disputing a specific signer's agreement
— edges computed from different encodings of the signer target different CIDs,
and their repetitions do not match in aggregation.
Weighting suffers too:
one signer under two encodings reads as two.
The address is a hash of the key, and the key cannot be computed back;
for conversion the key is taken from the transaction carrying the cyberlink
— the transaction publishes the signer's key next to the signature —
and its CID is computed;
without this step a Bostrom cyberlink's derived CID cannot be computed.

A derived CID is always the CID v0 of the canonical bytes of a record.
The record is flat, all values are strings:
a nested record is first replaced by its CID.
Keys are sorted by the order of their UTF-8 bytes
— for the keys of this issue that is `about`, `cid_from`, `cid_to`, `op`, `signer`.
The JSON is compact, with no whitespace outside strings,
and ends with exactly one `\n`.
Any derived CID is reproduced with `printf '<record>\n' | ipfs add --only-hash --cid-version=0`.
In the records of this issue, capital letters (A, B, X, Qm1…), `signer` and `hash("…")` stand for CIDs
— in the bytes they are quoted strings.
Two special cases:
the edge address — `{"cid_from":A,"cid_to":B}`;
the cyberlink's derived CID — `{"cid_from":A,"cid_to":B,"signer":signer}`.
The encoding must be one and the same for everyone
— otherwise, as with two encodings of the signer above, the same act gets different derived CIDs.
