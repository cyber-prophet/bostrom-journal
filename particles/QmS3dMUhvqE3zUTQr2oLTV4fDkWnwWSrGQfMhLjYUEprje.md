---
parent: QmbRFQjCp248s4kVHtMSrrnKa3Lnyso53CXwpD7PPL4FPV
---

# Cyberlink and cybergraph

A file, in the most common understanding, is a named collection of data: a text document, a picture, a video, an archive, and so on. For the purposes of this issue of the journal we:

1. will take a file to be only its content — the name plays no part.
2. will keep only text files (human-readable text or machine-readable data structures serialized in JSON).

A file is a carrier of meaning: the meaning arises in the reader when they read its content.

A cyberlink is a statement by a signer: "these two files are connected". A signer is an agent (for example, a human, an AI) that created and signed the cyberlink. Cybergraph stores both the connection and the one who states it — but not the meaning: just as a book stores only text printed on paper, and the meaning arises in the reader, so here the meaning of the statement is produced at read time, by interpretation (see "Conventions").

Cybergraph is a data structure made of cyberlinks. Each cyberlink is a signed record of the form:

```
{
    cid_from: Qm1
    cid_to: Qm2
    signer: Qm3
}
```

`cid_from` and `cid_to` are the CIDs of the two files being connected. A CID (content identifier) is a file's address: an IPFS hash that uniquely identifies the content. The pair `cid_from → cid_to` is an *edge* of the cybergraph, directed from `cid_from` to `cid_to`; a file becomes a vertex when its CID stands in an edge. The `signer` field is the CID of the signer (Qm3), so the signer can be referenced like any file, and becomes a vertex by the same rule — when their CID stands in an edge. The exact encoding is fixed in the appendix "Cybergraph format".

Because all three fields — `cid_from`, `cid_to`, and `signer` — are plain text strings, we can, for example, join them into one string with commas and compute the IPFS hash of the resulting string — a derived CID. The hash of the pair `"Qm1,Qm2"` is the *edge address*: it contains no signer and is therefore the same for everyone who connected the same files — it addresses *what* is stated. The hash of the triple `"Qm1,Qm2,Qm3"` is the cyberlink's derived CID: it addresses the act of a specific signer — *who* states it. Both addresses can be used to form other cyberlinks — this makes it possible to issue instructions for interpreting edges and specific cyberlinks by means of other cyberlinks. Until such use, a derived CID is only an address: like any CID, it becomes a vertex when it stands in an edge.

In this issue of the journal we devise and make sense of possible approaches — open conventions for encoding and interpreting instructions for processing the cybergraph. What is devised here is only the fruit of thought exercises, not yet tested by practice. Implementation will show what to change in the conventions. That, however, is a task for the future.
