---
parent: QmbLMNySTtFaKMTNnQEqGjq2XhoaGuM6RxUkeHAB88pjHa
---

# Denying an edge and a cyberlink

```
A - CID
B - CID
signer - the CID of the signer of the disputed cyberlink

{"op":"deny_edge"} → {"cid_from":A,"cid_to":B}                  # denying the edge
{"op":"deny_link"} → {"cid_from":A,"cid_to":B,"signer":signer}  # denying a specific cyberlink
```

Two targets of denial — two semantics,
each with its own word:
- `deny_edge` → `{"cid_from":A,"cid_to":B}` — disputes the statement `A → B` itself:
  it is false no matter who published it
- `deny_link` → `{"cid_from":A,"cid_to":B,"signer":signer}` — disputes a specific cyberlink of a specific signer:
  the record is invalid
  — for example, as spam —
  with no opinion about the statement itself

Unlike `update_edge` and `quote_particle`, whose operand stands in the `about` of the source,
`{"op":"deny_edge"}` and `{"op":"deny_link"}` are fixed CIDs;
what they point to is what is denied.
