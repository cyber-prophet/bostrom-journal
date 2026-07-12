# Quotes

```
A - CID
B - CID, content(B) is a substring of content(A) (independently verifiable)

hash("quote", A) → B       # "B is a faithful excerpt from A"
```

Confirmation of a quote edge by another neuron states that the excerpt is faithful; `hash("deny") → hash(hash("quote", A), B)` disputes it as misleading out of context.
