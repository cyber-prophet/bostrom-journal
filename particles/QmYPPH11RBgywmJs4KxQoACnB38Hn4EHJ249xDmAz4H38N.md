---
parent: QmZs3oqjijfg1gbFFzQ7Yr7foVwfs4FJ5QbJrEePHeBJRS
---

# Updating a previously published edge

```
A - a CID from the original edge
B - the other CID from the original edge
C - a new CID replacing B

A → B                            # the original edge
A → C                            # auxiliary edge — C is reachable from A (optional)
hash("update", hash(A, B)) → C   # authoritative — marks C as an update of the edge
```

Updates issue anew from the same CID `hash("update", hash(A, B))`, so an update can itself be updated: the latest edge from this source is the current version. The source is the same for everyone, so anyone can publish an update; whose updates to accept — for example, only those of the original cyberlink's neuron — is decided by the read policy. And like any edge, the update edge is itself addressable — `hash("update", hash(A, B)) → C` can be confirmed with `confirm` or denied with `deny` by another neuron.
