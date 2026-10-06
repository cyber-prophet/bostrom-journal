---
parent: QmSgk8Byw9hBYzvFKq6SkmK66yB7htjtQucqmifRoipvAJ
---

# Cyberlink and cybergraph

The CID (content identifier) of any file can be computed:
it is an IPFS hash of the bytes of the file.
A file becomes a *particle* of the cybergraph
when its CID is used in an edge of a cyberlink.
A particle is one name for two things:
a vertex of the graph and the bytes of the file under its CID.
A particle carries meaning:
the meaning occurs in the reader when the reader reads the content of the particle.
For this issue of the journal, particles are text only:
human-readable text or machine-readable data structures that are serialized in JSON.

A cyberlink is a statement by a signer:
"these two particles are connected".
A signer is an agent (for example, a human, an AI) that created and signed the cyberlink.
Cybergraph stores the connection and also the signer that states it,
but it does not store the meaning.
A book stores only the text that is printed on paper,
and the meaning occurs in the reader.
In the same way, here interpretation produces the meaning of the statement at read time (see "Conventions").

Cybergraph is a data structure that is made of cyberlinks.
Each cyberlink is a signed record of this form:

```
{
    cid_from: Qm1
    cid_to: Qm2
    signer: Qm3
}
```

`cid_from` and `cid_to` are the CIDs of the two particles that are connected.
The pair `cid_from → cid_to` is an *edge* of the cybergraph, directed from `cid_from` to `cid_to`.
The particles are its vertices.
The `signer` field is the CID of the public key of the signer (Qm3),
so the signer can be referenced like any CID.
The key of the signer becomes a particle
when this CID stands in an edge.
The appendix "Cybergraph format" defines the exact encoding.

All three fields
— `cid_from`, `cid_to`, and `signer` —
are plain text strings.
Thus, we can serialize them into a JSON record in canonical form and compute the IPFS hash of the bytes of this record.
This hash is a derived CID.
Here and below, a record in the place of a CID means the CID of the canonical bytes of the record.
The records in the text are not the bytes themselves:
the appendix defines the bytes.
The hash of the record `{"cid_from":Qm1,"cid_to":Qm2}` is the *edge address*.
It contains no signer,
so it is the same for everyone who connected the same particles.
It addresses *what* is stated.
The hash of the record `{"cid_from":Qm1,"cid_to":Qm2,"signer":Qm3}` is the derived CID of the cyberlink.
It addresses the act of a specific signer
— *who* states it.
A signer can use both addresses in other cyberlinks.
Thus, a signer can use other cyberlinks to issue instructions about how to interpret edges and specific cyberlinks.
Before such use, a derived CID is only an address.
Its preimage, a record such as `{"cid_from":Qm1,"cid_to":Qm2}`, becomes a particle like any file
when this CID stands in an edge.

In this issue of the journal, we design and consider possible approaches.
These approaches are open conventions to encode and interpret instructions to process the cybergraph.
What we design here is only the result of thought exercises, and it is not tested in practice yet.
Implementation will show what to change in the conventions.
But that is a task for the future.
