# Cybergraph

Cybergraph is a shared information space. Its elements are *particles*: units of data, each with its own address — a CID. Particles are connected by cyberlinks. Technically, Cybergraph is a data structure made of such cyberlinks, and each cyberlink is a record signed by a neuron, of the form:

```
{
    cid_from: Qm1
    cid_to: Qm2
    neuron: Qm3
}
```

cid_from and cid_to are the CIDs (content identifiers) of the two particles being connected: IPFS hashes that uniquely identify the content of files (regardless of their names). The pair cid_from → cid_to is an *edge* of the cybergraph, directed from cid_from to cid_to; the particles are its nodes. The neuron is the agent (for example, a human, an AI, a contract, or a sensor) that created and signed the cyberlink; it is addressed by its CID (Qm3), so a neuron can be referenced like any content. A neuron becomes a particle when its CID stands in an edge. The exact encoding is fixed in the appendix "Cybergraph format".

Because all three fields — cid_from, cid_to, and neuron — are plain text strings, we can join them into one string with commas and compute the IPFS hash of the resulting string — a derived CID. The hash of the pair "Qm1,Qm2" is the *edge address*: it contains no neuron and is therefore the same for everyone who connected the same particles — it addresses *what* is stated. The hash of the triple "Qm1,Qm2,Qm3" is the cyberlink's derived CID: it addresses the act of a specific neuron — *who* states it. Both addresses can be used to form other cyberlinks — this makes it possible to issue instructions for interpreting edges and specific cyberlinks by means of other cyberlinks. Until such use, a derived CID is only an address: like any CID, it becomes a particle when it stands in an edge.

In this issue of the journal we devise and make sense of possible approaches — open conventions for encoding and interpreting instructions for processing the cybergraph.
