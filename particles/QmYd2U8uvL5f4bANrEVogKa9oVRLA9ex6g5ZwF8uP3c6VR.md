---
parent: QmTWsvoQCBszqr9opMniy5VkcDqZMWE2Q2qvJVesdCC7Pv
---

# Collaborative work on information

Cyberlinks connect particles, and through the particles they also connect signers:

```
Alice states:    A → B
Bob repeats:     A → B
Carol denies:    {"op":"deny_edge"} → {"cid_from":A,"cid_to":B}
Dave quotes:     {"about":A,"op":"quote_particle"} → B
Erin confirms:   {"op":"confirm_edge"} → {"cid_from":A,"cid_to":B}
```

The graph encodes not only "what is connected to what" but also "who believes what"
— and queries and analysis can use this data.
