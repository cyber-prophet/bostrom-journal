---
parent: QmcAGvC8pC25dK5JtSJLeFWK39qK55PJQT6GGgMZigAoVt
---

# Цитаты

```
A - CID
B - CID, content(B) — подстрока content(A) (независимо проверяемо)

{"about":A,"op":"quote_particle"} → B       # "B — добросовестная выдержка из A"
```

Когда ребро-цитату повторяет другой подписант,
его повторение утверждает, что выдержка добросовестна;
`{"op":"deny_edge"} → {"cid_from":{"about":A,"op":"quote_particle"},"cid_to":B}` отрицает её как вводящую в заблуждение вне контекста.
