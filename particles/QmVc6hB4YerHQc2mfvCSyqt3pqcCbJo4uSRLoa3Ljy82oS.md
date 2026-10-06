---
parent: QmZXD6LdYgbzd9kQL1s4EYr2f1ZSnVyWkTpE2fFP1HZeMP
---

# Quotes

```
A - CID
B - CID, content(B) is a substring of content(A) (independently verifiable)

{"about":A,"op":"quote_particle"} → B       # "B is a faithful excerpt from A"
```

When another signer repeats a quote edge,
the repetition states that the excerpt is faithful.
`{"op":"deny_edge"} → {"cid_from":{"about":A,"op":"quote_particle"},"cid_to":B}` denies the quote edge and states that the excerpt misleads out of context.
