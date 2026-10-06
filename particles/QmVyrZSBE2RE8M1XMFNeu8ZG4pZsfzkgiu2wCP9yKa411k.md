---
parent: QmULwNgvhiFe8F67guseYXprT3WZKv2bRS9gKJjBDvRvPo
---

# Denying an edge and a cyberlink

```
A - CID
B - CID
signer - the CID of the signer of the denied cyberlink

{"op":"deny_edge"} → {"cid_from":A,"cid_to":B}                  # denying the edge
{"op":"deny_link"} → {"cid_from":A,"cid_to":B,"signer":signer}  # denying a specific cyberlink
```

Denial has two targets, and thus two semantics.
Each of them has its own word:
- `deny_edge` → `{"cid_from":A,"cid_to":B}` — denies the statement `A → B` itself:
  the statement is false, no matter who published it
- `deny_link` → `{"cid_from":A,"cid_to":B,"signer":signer}` — denies a specific cyberlink of a specific signer:
  the record is invalid
  — for example, as spam —
  with no opinion about the statement itself

Unlike `update_edge` and `quote_particle`, which have their operand in the `about` of the source,
`{"op":"deny_edge"}` and `{"op":"deny_link"}` are fixed CIDs.
What they point to is what is denied.
