# Measurable consensus

For any statement `A → B`:
- Count the cyberlinks of different neurons with this edge → the support level
- Count the denial cyberlinks → the dispute level
- Weight the neurons by a read policy (for example, by reputation) → weighted consensus
- Track over time → the evolution of consensus

No central authority decides validity. Instead:
- Statements are made (cyberlinks are created)
- Others confirm or deny (new cyberlinks)
- Aggregation reveals the consensus
- Minority opinions stay visible (not censored, simply in the minority)

```
Consensus(statement) = f(confirms, denies, neuron_weights, time_decay)
```

The exact formula is a matter of read policy. Cybergraph provides the raw data.

A neuron's opinion also lives in time: one can confirm a statement and later deny it. A neuron's cyberlinks are ordered (see "Fundamentals"), so its current opinion is naturally read as the latest in time; earlier ones remain visible history. One's own cyberlink is revoked the same way: `hash("deny") → hash(A, B, neuron)`, where the neuron is the one revoking.
