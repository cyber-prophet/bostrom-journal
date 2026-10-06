---
parent: QmWccUU2HjFH3HJ2RBRJeU9wurayxRZE6D7TBNK9D2PpkB
---

# Identity: another name for the same entity

```
P1, P2 - CIDs naming one entity

{"about":P1,"op":"same"} → P2     # "P1 and P2 are names of one entity"
```

One entity has many names in the graph:
`hash("satoshin@gmx.com")`, `hash("satoshi@vistomail.com")` and `hash("Satoshi Nakamoto")` are different CIDs.
Aggregation counts attributions under different names separately.
A `same` edge states identity (the analogue of owl:sameAs from the semantic web).
The entity is read as a cluster
— a connected component over `same` edges.
The read policy decides which edges to accept into the cluster.

Identity is symmetric in meaning,
but the edge is directed:
the mirror edge is a different pair,
and aggregation counts its support separately.
Whether to read connectivity without regard to direction, and whether to merge both directions into one statement:
the read policy decides both.
The read policy also decides the composition of the cluster.
Signers deny a false identity with `deny_edge`.
The operand is any CID, and this includes the CID of a signer.
When that signer publishes the edge `{"about":hash("Satoshi Nakamoto"),"op":"same"} → signer`, the edge is the assertion "this is me".
And ported authors (see above) connect with live participants of the graph,
who confirm or deny the assertion.
One caveat:
`same` acts at read time and does not override the format (see the appendix).
The hash puts the name into derived CIDs,
and they are not recomputed after the fact.
