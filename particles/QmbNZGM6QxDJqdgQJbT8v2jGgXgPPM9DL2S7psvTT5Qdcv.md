---
parent: QmX9fQGZcgtgEXJfGVGH1J6kYE3wuHBUqRNCFusuqsTRs1
---

# Цитаты

```
A - CID
B - CID, content(B) — подстрока content(A) (независимо проверяемо)

hash("quote_particle", A) → B       # "B — добросовестная выдержка из A"
```

Когда ребро-цитату повторяет другой подписант, его повторение утверждает, что выдержка добросовестна; `hash("deny_edge") → hash(hash("quote_particle", A), B)` оспаривает её как вводящую в заблуждение вне контекста.
