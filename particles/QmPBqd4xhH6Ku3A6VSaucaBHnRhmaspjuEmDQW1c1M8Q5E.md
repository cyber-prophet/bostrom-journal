---
parent: QmWDEik7F2eAcHTmn3PhFwdp2YMFNZFAgLbYWepNgVXWxf
---

# Denying an edge and a cyberlink

```
A - CID
B - CID
signer - the CID of the signer of the disputed cyberlink

hash("deny") → hash(A, B)          # denying the edge
hash("deny") → hash(A, B, signer)  # denying a specific cyberlink
```

Two targets of denial — two semantics:
- `hash(A, B)` — disputes the statement `A → B` itself: it is false no matter who published it
- `hash(A, B, signer)` — disputes a specific cyberlink of a specific signer: the record is invalid — for example, as spam — with no opinion about the statement itself

Unlike `update` and `quote`, which embed their operand into the source CID, `hash("deny")` is a fixed CID; what it points to is what is denied.
