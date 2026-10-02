---
parent: QmTBiqaSQdh4T3wmBR8DMFeMJX9zh4Y2Y4FpNejhkSLhqt
---

# Цитаты

```
A - CID
B - CID, content(B) — подстрока content(A) (независимо проверяемо)

{"about":A,"op":"quote_particle"} → B       # "B — добросовестная выдержка из A"
```

Когда ребро-цитату повторяет другой подписант,
его повторение утверждает, что выдержка добросовестна;
`{"op":"deny_edge"} → {"cid_from":{"about":A,"op":"quote_particle"},"cid_to":B}` оспаривает её как вводящую в заблуждение вне контекста.
