---
parent: QmXco7C2R6yck6tPYHcGgosMk3vXD8wNj1rV3ikHXptXbN
---

# Quotes

```
A - CID
B - CID, content(B) is a substring of content(A) (independently verifiable)

{"about":A,"op":"quote_particle"} → B       # "B is a faithful excerpt from A"
```

When a quote edge is repeated by another signer,
the repetition states that the excerpt is faithful;
`{"op":"deny_edge"} → {"cid_from":{"about":A,"op":"quote_particle"},"cid_to":B}` disputes it as misleading out of context.
