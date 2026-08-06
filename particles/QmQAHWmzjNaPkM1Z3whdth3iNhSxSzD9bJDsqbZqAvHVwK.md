---
parent: QmTYLrSPHZnS57aqPiaDDKzzgveAC3juiarzyZ5iR35JmP
---

# Cyberlink and cybergraph

A *particle* of the cybergraph is a carrier of meaning: the meaning arises in the reader when they read its content. Its content is the bytes of a file; its name is a CID (content identifier), an IPFS hash computed from the content; its role is a vertex of the graph, which it becomes when its CID stands in an edge of the cybergraph. For the purposes of this issue of the journal, particles are text only: human-readable text or machine-readable data structures serialized in JSON.

A cyberlink is a statement by a *neuron*: "these two particles are connected". A neuron is an agent (for example, a human, an AI) that created and signed the cyberlink. Cybergraph stores both the connection and the one who states it — but not the meaning: just as a book stores only text printed on paper, and the meaning arises in the reader, so here the meaning of the statement is produced at read time, by interpretation (see "Conventions").

Cybergraph is a data structure made of cyberlinks. Each cyberlink is a record signed by a neuron, of the form:

```
{
    cid_from: Qm1
    cid_to: Qm2
    neuron: Qm3
}
```

`cid_from` and `cid_to` are the CIDs of the two particles being connected. The pair `cid_from → cid_to` is an *edge* of the cybergraph, directed from `cid_from` to `cid_to`; the particles are its vertices. The `neuron` field is the CID of the neuron (Qm3), so the neuron can be referenced like any particle, and becomes a vertex when its CID stands in an edge. The exact encoding is fixed in the appendix "Cybergraph format".

Because all three fields — `cid_from`, `cid_to`, and `neuron` — are plain text strings, we can, for example, join them into one string with commas and compute the IPFS hash of the resulting string — a derived CID. The hash of the pair `"Qm1,Qm2"` is the *edge address*: it contains no neuron and is therefore the same for everyone who connected the same particles — it addresses *what* is stated. The hash of the triple `"Qm1,Qm2,Qm3"` is the cyberlink's derived CID: it addresses the act of a specific neuron — *who* states it. Both addresses can be used to form other cyberlinks — this makes it possible to issue instructions for interpreting edges and specific cyberlinks by means of other cyberlinks. Until such use, a derived CID is only an address: like any CID, it becomes a vertex when it stands in an edge.

In this issue of the journal we devise and make sense of possible approaches — open conventions for encoding and interpreting instructions for processing the cybergraph. What is devised here is only the fruit of thought exercises, not yet tested by practice. Implementation will show what to change in the conventions. That, however, is a task for the future.
