---
parent: QmfBqz3WRvo1n4W9r5XLQrgh3Lm9krXVW96vDX1RvYgoLm
---

# Updating a previously published edge

```
A - a CID from the original edge
B - the other CID from the original edge
C - a new CID replacing B

A → B                            # the original edge
A → C                            # auxiliary edge — C is reachable from A (optional)
hash("update_edge", hash(A, B)) → C   # authoritative — marks C as an update of the edge
```

Updates issue anew from the same CID `hash("update_edge", hash(A, B))`, so an update can itself be updated: the latest edge from this source is the current version. The source is the same for everyone, so anyone can publish an update; whose updates to accept — for example, only those of the original cyberlink's signer — is decided by the read policy. And like any edge, the update edge is itself addressable — `hash("update_edge", hash(A, B)) → C` can be confirmed with `confirm_edge` or denied with `deny_edge` by another signer.
