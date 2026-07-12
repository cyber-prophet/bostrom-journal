---
parent: QmQQ9PSqb3rw67WGLQNSMeFiXQNVFn3u9ubkaYhh3enEsX
---

# IPFS, механизм контентной адресации

IPFS (interplanetary file system) — это децентрализованная файловая система: файлы хранятся на компьютерах участников сети. Адрес файла — это его CID (content identifier): IPFS вычисляет его из самого содержимого. Поэтому одинаковое содержимое всегда даёт один и тот же CID, а изменённое — другой. По CID файл можно и получить, и проверить, что получил именно его.

IPFS не гарантирует получение файлов, даже если они есть в сети. Однако чем больше устройств имеют файл, тем выше шансы его скачать (и потенциально быстрее).

У @mastercyb:

> [[CID]] (content identifier) is the hash format used across [[IPFS]] and [[cyber]]. it encodes the hash algorithm, the codec, and the digest into a single self-describing address. — `../cyber/hash.md:14`

> hashing enables [[content addressing]]. instead of asking where content lives, [[neurons]] ask for the content itself by its [[hash]]. any node holding the matching bytes can serve it. location dissolves. — `../cyber/hash.md:16`
