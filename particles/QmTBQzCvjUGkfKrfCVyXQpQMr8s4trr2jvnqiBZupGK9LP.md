---
parent: QmXT8vhyRShHiCDLrMaxsCe1TpRdAk27mHJUZc7wvCEuYg
---

# Collaborative work on information

Cyberlinks connect particles and, through them, signers:

```
Alice states:    A → B
Bob repeats:     A → B
Carol denies:    {"op":"deny_edge"} → {"cid_from":A,"cid_to":B}
Dave quotes:     {"about":A,"op":"quote_particle"} → B
Erin confirms:   {"op":"confirm_edge"} → {"cid_from":A,"cid_to":B}
```

The graph encodes not only "what is connected to what" but also "who believes what" — and this is open to querying and analysis.
