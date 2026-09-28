---
parent: QmccDVkD1qxEjBtsMirZekMx8ttUP6YvBkJKhhHziY4KvB
---

# Цитаты

```
A - CID
B - CID, content(B) — подстрока content(A) (независимо проверяемо)

hash("quote_particle", A) → B       # "B — добросовестная выдержка из A"
```

Когда ребро-цитату повторяет другой подписант, его повторение утверждает, что выдержка добросовестна; `hash("deny_edge") → hash(hash("quote_particle", A), B)` оспаривает её как вводящую в заблуждение вне контекста.
