---
parent: QmTGEkQgeS9qZ3BGYU2CTsbbc1NgtVHRpJV1dPtqFiagfa
---

# Authorship: porting from other mediums

The signer of a cyberlink is the one who wrote the edge into the graph.
The signer does not have to be the author of the content.
This difference opens the graph to porting.
Discussions that lived in other mediums
— Usenet threads, correspondence, forums —
already have authors, dates and reply edges.
But their authorship depends on trust in servers and archives (a From header is a string, not a signature).
When an archivist ports such a discussion,
the archivist publishes the content and states the authorship with a separate edge:

```
P - the CID of the author's identifier (for example, hash("satoshin@gmx.com"))
X - the CID of the ported content

{"about":X,"op":"author_particle"} → P     # "the author of content X is P"
```

The subject is in the source, as with `pro`/`con` and `question`.
A reader of X computes one hash and reads the outgoing edges.
So the reader recognizes the attribution even if the author was not in the graph before.
Attributions that compete start at one address `{"about":X,"op":"author_particle"}`
and are visible side by side, like versions under `update_edge`.
(The mirror form `{"about":P,"op":"author_particle"} → X` would answer "all works of P" with one hash.
But the main query is the reverse one,
and with the mirror form, a reader of X cannot compute the address of an attribution from an unknown author.)

The signature under the cyberlink belongs to the archivist
and certifies the act of porting, not the authorship itself.
The trust that was implicit in the original medium
becomes an explicit addressable statement.
Then the common rules apply to it:
independent archivists who compared their own copies of the source repeat the edge.
So the attribution gets measurable consensus.
Signers deny a wrong attribution with `deny_edge`.
The ported content is immediately open to all the conventions above.
Today, a signer can extract the claims of an old thread with quote edges and sign them with `agree_particle`/`disagree_particle`.
So a dispute that started in another medium continues in the graph without loss of authorship.
The worked example below uses the same method:
"Thus have I heard" — Ananda signs the provenance of words that he did not speak.
