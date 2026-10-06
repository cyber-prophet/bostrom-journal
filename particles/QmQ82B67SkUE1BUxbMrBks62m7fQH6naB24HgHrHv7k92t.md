---
parent: QmPsyssbKWEdcRFoXjJCUwKKwjVJ3vHNuECsBVP94a4fza
---

# Appendix: Cybergraph format

A CID is always CID v0.
The content is wrapped into a standard IPFS block (UnixFS dag-pb) and hashed with sha2-256,
and the hash is encoded in base58.
The result is a string of the form Qm….
`ipfs add --cid-version=0` gives the same result.

The signer (the `signer` field in the record) is the CID of the public key of the signer.
Here the format is different from Bostrom on purpose.
Bostrom records the signer as a `bostrom1…` address (see "Fundamentals").
The format uses the CID of the key
so that the signer is addressable like any other CID.
There must be only one encoding of the signer.
If one signer can have different encodings (an address, a bare key),
the same act gets different derived CIDs of the cyberlink.
The addressing of the act breaks:
`deny_link`, the revocation of a signer's own cyberlink, the denial of the agreement of a specific signer.
Edges that are computed from different encodings of the signer target different CIDs,
and their repetitions do not match in aggregation.
The calculation of weights also suffers:
one signer under two encodings reads as two signers.
The address is a hash of the key, and the key cannot be computed from the address.
For the conversion, the key is taken from the transaction that carries the cyberlink.
The transaction publishes the key of the signer next to the signature.
Then the CID of the key is computed.
Without this step, the derived CID of a Bostrom cyberlink cannot be computed.

A derived CID is always the CID v0 of the canonical bytes of a record.
The record is flat, and all values are strings:
a nested record is first replaced by its CID.
Keys are sorted by the order of their UTF-8 bytes.
For the keys of this issue, the order is `about`, `cid_from`, `cid_to`, `op`, `signer`.
The JSON is compact: it has no whitespace outside strings,
and it ends with exactly one `\n`.
The command `printf '<record>\n' | ipfs add --only-hash --cid-version=0` reproduces any derived CID.
In the records of this issue, capital letters (A, B, X, Qm1…), `signer` and `hash("…")` stand for CIDs.
In the bytes, they are quoted strings.
There are two special cases:
the record of the edge address is `{"cid_from":A,"cid_to":B}`;
the record of the derived CID of the cyberlink is `{"cid_from":A,"cid_to":B,"signer":signer}`.
The encoding must be the same for everyone.
If it is not, the same act gets different derived CIDs, as with the two encodings of the signer above.
