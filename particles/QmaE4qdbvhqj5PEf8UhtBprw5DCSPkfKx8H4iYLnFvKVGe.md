---
parent: QmfCqN1CF5xSHpbNWckboVZRWhciUWXQKicfKpJqeoTRr3
---

# Совместная работа над информацией

Киберлинки связывают частицы, а через них — и подписантов:

```
Alice утверждает:  A → B
Bob повторяет:     A → B
Carol отрицает:    {"op":"deny_edge"} → {"cid_from":A,"cid_to":B}
Dave цитирует:     {"about":A,"op":"quote_particle"} → B
Erin подтверждает: {"op":"confirm_edge"} → {"cid_from":A,"cid_to":B}
```

Граф кодирует не только «что с чем связано», но и «кто во что верит»
— и это поддаётся запросам и анализу.
