---
parent: QmaFSQWT5RG2ZKgRmjaJUGCwVmVGHza4Uja3BPZMxKhMp5
---

# Identity: another name for the same entity

```
P1, P2 - CIDs naming one entity

hash("same", P1) → P2     # "P1 and P2 are names of one entity"
```

One entity lives in the graph under many names: `hash("satoshin@gmx.com")`, `hash("satoshi@vistomail.com")` and `hash("Satoshi Nakamoto")` are different CIDs, and attributions gathered under different names do not add up in aggregation. A `same` edge states identity (the analogue of owl:sameAs from the semantic web): the entity reads as a cluster — a connected component over `same` edges; which edges to accept into the cluster is decided by the read policy.

Identity is symmetric in meaning, but the edge is directed: the mirror edge is a different pair, and aggregation counts its support separately; whether to read connectivity ignoring direction, and whether to fold both directions into one statement, is decided by the read policy — as is the composition of the cluster. A false identity is disputed with `deny`. The operand is any CID, including the CID of a neuron: the edge `hash("same", hash("Satoshi Nakamoto")) → neuron`, published by that neuron itself, is the assertion "this is me", and ported authors (see above) connect with living participants of the graph, who confirm or dispute the assertion. One caveat: `same` acts at read time and does not override the format (see the appendix) — the name is baked into derived CIDs by the hash, and they are not recomputed after the fact.
