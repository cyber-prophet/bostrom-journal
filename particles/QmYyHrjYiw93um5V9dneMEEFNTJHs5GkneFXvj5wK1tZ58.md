---
parent: QmeFUgw5dj4btMWeyJZwKJuTakXHCQKpVu9QLm4fUgXT9F
---

# Cyberlink and cybergraph

Any file's CID (content identifier) can be computed: an IPFS hash of its bytes. A file becomes a *particle* of the cybergraph when its CID is used in an edge of a cyberlink. A particle is one name for two things: a vertex of the graph and the bytes of the file under its CID; it is a carrier of meaning: the meaning arises in the reader when they read its content. For the purposes of this issue of the journal, particles are text only: human-readable text or machine-readable data structures serialized in JSON.

A cyberlink is a statement by a signer: "these two particles are connected". A signer is an agent (for example, a human, an AI) that created and signed the cyberlink. Cybergraph stores both the connection and the one who states it — but not the meaning: just as a book stores only text printed on paper, and the meaning arises in the reader, so here the meaning of the statement is produced at read time, by interpretation (see "Conventions").

Cybergraph is a data structure made of cyberlinks. Each cyberlink is a signed record of the form:

```
{
    cid_from: Qm1
    cid_to: Qm2
    signer: Qm3
}
```

`cid_from` and `cid_to` are the CIDs of the two particles being connected. The pair `cid_from → cid_to` is an *edge* of the cybergraph, directed from `cid_from` to `cid_to`; the particles are its vertices. The `signer` field is the CID of the signer's public key (Qm3), so the signer can be referenced like any CID; their key becomes a particle when this CID stands in an edge. The exact encoding is fixed in the appendix "Cybergraph format".

Because all three fields — `cid_from`, `cid_to`, and `signer` — are plain text strings, we can serialize them into a JSON record in canonical form and compute the IPFS hash of its bytes — a derived CID. Here and below, a record standing in place of a CID means the CID of its canonical bytes; the records in the text are not the bytes themselves, the appendix defines the bytes. The hash of the record `{"cid_from":Qm1,"cid_to":Qm2}` is the *edge address*: it contains no signer and is therefore the same for everyone who connected the same particles — it addresses *what* is stated. The hash of the record `{"cid_from":Qm1,"cid_to":Qm2,"signer":Qm3}` is the cyberlink's derived CID: it addresses the act of a specific signer — *who* states it. Both addresses can be used to form other cyberlinks — this makes it possible to issue instructions for interpreting edges and specific cyberlinks by means of other cyberlinks. Until such use, a derived CID is only an address; its preimage, a record such as `{"cid_from":Qm1,"cid_to":Qm2}`, becomes a particle like any file when this CID stands in an edge.

In this issue of the journal we devise and make sense of possible approaches — open conventions for encoding and interpreting instructions for processing the cybergraph. What is devised here is only the fruit of thought exercises, not yet tested by practice. Implementation will show what to change in the conventions. That, however, is a task for the future.
