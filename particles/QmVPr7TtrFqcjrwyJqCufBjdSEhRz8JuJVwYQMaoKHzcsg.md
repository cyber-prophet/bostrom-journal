---
parent: QmQedANAbeZxeRuFZfodJgXNVocV5A7WzQT9kfqa19vX2r
---

# Measurable consensus

For any statement `A → B`:
- Count the cyberlinks of different signers with this edge → the support level:
  how many signers state the same thing
- Count the `confirm_edge`s of this edge → the support from signers who do not make the statement their own
- Count the `deny_edge`s of this edge → the dispute level
- Count the `confirm_link`s and `deny_link`s → the validity of the records (a separate axis: it says nothing about the statement)
- Weight the signers by a read policy (for example, by reputation) → the weighted consensus
- Track these results over time → the change of consensus

No central authority decides validity.
Instead:
- Signers make statements (they create cyberlinks)
- Other signers repeat, confirm, or deny them (with new cyberlinks)
- Aggregation shows the consensus
- Minority opinions stay visible (they are not censored; they are only in the minority)

```
Consensus(statement) = f(repeats, confirms, denies, signer_weights, time_decay)
```

The exact formula is a matter of read policy.
Cybergraph gives the raw data.

A signer's opinion can also change over time:
a signer can make a statement or confirm the statement of someone else,
and later deny it.
The cyberlinks of a signer have an order (see "Fundamentals").
So a reader naturally takes the latest opinion in time as the current opinion of the signer.
The earlier opinions stay visible as history.
A signer changes their opinion about a statement with `{"op":"deny_edge"} → {"cid_from":A,"cid_to":B}`.
A signer revokes their own record with `{"op":"deny_link"} → {"cid_from":A,"cid_to":B,"signer":signer}`,
where `signer` is the CID of the signer that revokes the record.
