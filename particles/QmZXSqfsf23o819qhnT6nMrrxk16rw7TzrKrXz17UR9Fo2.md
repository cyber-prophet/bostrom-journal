---
parent: QmNqBukNQhKTzTPkUik4fQpWobfu4XVXLc9M8x71BvmFCT
---

# Denying an edge and a cyberlink

```
A - CID
B - CID
neuron - the CID of the neuron of the disputed cyberlink

hash("deny_edge") → hash(A, B)          # denying the edge
hash("deny_link") → hash(A, B, neuron)  # denying a specific cyberlink
```

Two targets of denial — two semantics, each with its own word:
- `deny_edge` → `hash(A, B)` — disputes the statement `A → B` itself: it is false no matter who published it
- `deny_link` → `hash(A, B, neuron)` — disputes a specific cyberlink of a specific neuron: the record is invalid — for example, as spam — with no opinion about the statement itself

Unlike `update_edge` and `quote_particle`, which embed their operand into the source CID, `hash("deny_edge")` and `hash("deny_link")` are fixed CIDs; what they point to is what is denied.
