---
parent: QmebmtoB69PdvHNXXuUCMf6NUg94uJLB7T4gPGNUrJJEq7
---

# Quotes

```
A - CID
B - CID, content(B) is a substring of content(A) (independently verifiable)

hash("quote_particle", A) → B       # "B is a faithful excerpt from A"
```

When a quote edge is repeated by another signer, the repetition states that the excerpt is faithful; `hash("deny_edge") → hash(hash("quote_particle", A), B)` disputes it as misleading out of context.
