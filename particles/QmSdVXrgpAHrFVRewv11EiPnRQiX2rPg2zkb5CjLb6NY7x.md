---
parent: QmdtsE6M8stb5qGC99E8prYnfef17cpMEXX1yRffASmUNk
---

# Updating a previously published edge

```
A - a CID from the original edge
B - the other CID from the original edge
C - a new CID replacing B

A → B                                                        # the original edge
A → C                                                        # auxiliary edge — C is reachable from A (optional)
{"about":{"cid_from":A,"cid_to":B},"op":"update_edge"} → C   # authoritative — marks C as an update of the edge
```

Each new update comes from the same CID `{"about":{"cid_from":A,"cid_to":B},"op":"update_edge"}`,
so an update can itself be updated.
The latest edge from this source is the current version.
The source is the same for everyone,
so anyone can publish an update.
Whose updates to accept
— for example, only the updates of the signer of the original cyberlink —
is a decision of the read policy.
Like any edge, the update edge itself has an address
— another signer can confirm `{"about":{"cid_from":A,"cid_to":B},"op":"update_edge"} → C` with `confirm_edge` or deny it with `deny_edge`.
