---
parent: QmdycbrZa3xXZ5Gt35ZgqcUzhmyEAwTGzh1naVUJuHNGJR
---

# Authorship: porting from other mediums

The signer of a cyberlink is the one who wrote the edge into the graph, and they need not be the author of the content. This distinction opens the graph to porting: discussions that lived in other mediums — Usenet threads, correspondence, forums — already have authors, dates, and reply edges, but their authorship rests on trust in servers and archives (a From header is a string, not a signature). Porting such a discussion, an archivist publishes the content and states the authorship with a separate edge:

```
P - the CID of the author's identifier (for example, hash("satoshin@gmx.com"))
X - the CID of the ported content

{"about":X,"op":"author_particle"} → P     # "the author of content X is P"
```

The subject is in the source, as with `pro`/`con` and `question`: reading X, a reader computes one hash and reads the outgoing edges — the attribution is recognized even if the author has not appeared in the graph before. Competing attributions issue from one address `{"about":X,"op":"author_particle"}` and are visible side by side, like versions under `update_edge`. (The mirror form `{"about":P,"op":"author_particle"} → X` would answer "all works of P" with one hash, but the primary query is the reverse one, and it makes attribution from an unknown author uncomputable in advance.)

The signature under the cyberlink belongs to the archivist and certifies the act of porting, not the authorship itself: trust that was implicit in the original medium becomes an explicit addressable statement. From there it lives by the common rules: independent archivists who have checked their own copies of the source repeat the edge — the attribution gains measurable consensus; a mistaken attribution is disputed with `deny_edge`. And the ported content is immediately open to all the conventions above: the claims of an old thread can be laid out with quote edges and signed with `agree_particle`/`disagree_particle` today — a dispute begun in another medium continues in the graph without loss of authorship. The worked example below uses the same device: "Thus have I heard" — Ananda signs the provenance of words not spoken by him.
