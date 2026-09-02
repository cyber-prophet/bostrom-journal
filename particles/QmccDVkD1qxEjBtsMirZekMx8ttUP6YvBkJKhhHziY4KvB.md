---
parent: QmVZHd9MRbrbxm5uekEmD9Pgxs3XDwV5dauvv8aHSgAfMi
---

# Цитаты

```
A - CID
B - CID, content(B) — подстрока content(A) (независимо проверяемо)

hash("quote_particle", A) → B       # "B — добросовестная выдержка из A"
```

Когда ребро-цитату повторяет другой нейрон, его повторение утверждает, что выдержка добросовестна; `hash("deny_edge") → hash(hash("quote_particle", A), B)` оспаривает её как вводящую в заблуждение вне контекста.
