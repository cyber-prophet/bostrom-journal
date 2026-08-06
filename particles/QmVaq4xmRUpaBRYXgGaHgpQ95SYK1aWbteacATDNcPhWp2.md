---
parent: QmV9ZMRrARH3avjbGvSzFEhTCJuChtbrThXK1quhgybzmo
---

# Quotes

```
A - CID
B - CID, content(B) is a substring of content(A) (independently verifiable)

hash("quote", A) → B       # "B is a faithful excerpt from A"
```

When a quote edge is repeated by another neuron, the repetition states that the excerpt is faithful; `hash("deny") → hash(hash("quote", A), B)` disputes it as misleading out of context.
