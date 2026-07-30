---
parent: QmREoSVgw34mG3NLUegsnvjaonVUq2UqSrznirACLLBKjz
---

# Measurable consensus

For any statement `A → B`:
- Count the cyberlinks of different signers with this edge → the support level: how many signers state the same thing
- Count the `confirm`s of this edge → support from those who do not make the statement their own
- Count the `deny`s of this edge → the dispute level
- Count the `confirm`s and `deny`s of specific cyberlinks → the validity of the records (a separate axis: it says nothing about the statement)
- Weight the signers by a read policy (for example, by reputation) → weighted consensus
- Track over time → the evolution of consensus

No central authority decides validity. Instead:
- Statements are made (cyberlinks are created)
- Others repeat, confirm, or deny (new cyberlinks)
- Aggregation reveals the consensus
- Minority opinions stay visible (not censored, simply in the minority)

```
Consensus(statement) = f(repeats, confirms, denies, signer_weights, time_decay)
```

The exact formula is a matter of read policy. Cybergraph provides the raw data.

A signer's opinion also lives in time: one can make a statement or confirm someone else's, and later deny it. A signer's cyberlinks are ordered (see "Fundamentals"), so the signer's current opinion is naturally read as the latest in time; earlier ones remain visible history. Changing one's mind about a statement is `hash("deny") → hash(A, B)`; revoking one's own record is `hash("deny") → hash(A, B, signer)`, where `signer` is the CID of the one revoking.
