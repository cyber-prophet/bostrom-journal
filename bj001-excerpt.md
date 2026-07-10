Блоки «У основателя» — вербатим из `../cyber` (draft-спеки cyber, 2026); [[двойные скобки]] — вики-синтаксис его графа.

### Bostrom — краткое определение [~](particles/QmXu22YpC93JCvm9RRYKttdr2Ge9W2aqvmdyNXKKitHhkt.md)

Bostrom — первый в мире блокчейн, реализовавший Киберграф.

У основателя:

> [[Bostrom]] — the [[bootloader]] chain — `../cyber/whitepaper.md:1006`

> The [[bootloader/bostrom|bostrom]] network has run 3+ years as the bootloader — ~70K [[cybics/crystal/neuron|neurons]], 2.9M [[cyberlinks]], 3.1M [[cybics/crystal/particle|particles]] — and is the migration source, not the soft3 network. — `../cyber/cyber/launch.md:51`

### Назначение сети Bostrom [~](particles/QmPfe2tQQ9pHEMe3Qb8Mnkh6wwwv7vNo1KMbRBTSEYwBFZ.md)

Bostrom позволяет публиковать киберлинки в киберграф доказуемо и проверяемо: устройство блокчейна создаёт доказательство — киберлинк лежит в транзакции, подписанной нейроном, а та включена в подписанный блок. Доказательство и делает факт проверяемым — любой может получить подписанную транзакцию и убедиться сам, не доверяя тому, кто дал данные, что конкретный нейрон добавил конкретное содержимое в известный момент времени.

У основателя:

> the determinism of hashing makes [[proof]] possible. a [[hash]] proves that specific [[data]] existed at the moment of measurement. linking a [[hash]] on-chain anchors that proof in [[consensus]] time. — `../cyber/hash.md:18`

> Unforgeability: every [[cyberlink]] requires a valid signature from the creating [[neuron]]. Every private transfer requires a ZK proof of ownership. Claims without cryptographic backing are rejected at the protocol level. — `../cyber/epistemology.md:33`

### Хеш

Хеш — строка фиксированной длины, полученная из произвольных данных детерминированной односторонней функцией. Один и тот же вход всегда даёт один и тот же хеш, разные входы — разные хеши.

У основателя:

> deterministic fingerprint of [[data]]. hashing is the act of measurement — it collapses bytes into a [[particle]], the moment [[information]] begins — `../cyber/hash.md:8`

> a [[hash]] is a fixed-length string derived from arbitrary [[data]] through a deterministic one-way function. the same input always yields the same output. different inputs yield different outputs. — `../cyber/hash.md:10`

### IPFS, механизм контентной адресации [~](particles/QmQQ9PSqb3rw67WGLQNSMeFiXQNVFn3u9ubkaYhh3enEsX.md)

IPFS (interplanetary file system) — это децентрализованная файловая система: файлы хранятся на компьютерах участников сети. Адрес файла — это его CID (content identifier): IPFS вычисляет его из самого содержимого. Поэтому одинаковое содержимое всегда даёт один и тот же CID, а изменённое — другой. По CID файл можно и получить, и проверить, что получил именно его.

IPFS не гарантирует получение файлов, даже если они есть в сети. Однако чем больше устройств имеют файл, тем выше шансы его скачать (и потенциально быстрее).

У основателя:

> [[CID]] (content identifier) is the hash format used across [[IPFS]] and [[cyber]]. it encodes the hash algorithm, the codec, and the digest into a single self-describing address. — `../cyber/hash.md:14`

> hashing enables [[content addressing]]. instead of asking where content lives, [[neurons]] ask for the content itself by its [[hash]]. any node holding the matching bytes can serve it. location dissolves. — `../cyber/hash.md:16`

### Частицы [~](particles/QmSxizUKhJhyVjzXQJfwiUabsdCdHSSWfkiMRAPcmVjqSY.md)

Частица киберграфа — это единица данных (в значении экземпляр, элемент массива). Файл становится частицей киберграфа когда его CID стоит в ребре.

У основателя:

> [[particle]] | Content-addressed node (IPFS hash) | Identity = hash. Same content, same node — `../cyber/whitepaper.md:129`

> Every [[particle]] is a cryptographic hash of its content. Identity is structure — same content produces the same hash regardless of who computes it or when. — `../cyber/whitepaper.md:139`

> in [[cyber]], hashing is the gateway act. raw [[data]] enters as unaddressed bytes and exits as a [[particle]] — a unique, permanent identity within the [[knowledge graph]]. — `../cyber/hash.md:12`

### Киберлинки [~](particles/QmZ21tAfZ4Yu2XCWDzMEFUQJFrMTVk8bAgt9GfLMXiYQhH.md)

Киберлинк — это опубликованная в киберграфе запись (тип данных - record), с полями:

- cid_from
- cid_to
- neuron

У основателя:

> [[cyberlink]] | Signed, weighted, directed edge $(i \to j)$ | Timestamped, authenticated, costs [[focus]] — `../cyber/whitepaper.md:131`

> Five primitives, one graph. Every claim in the system is a [[cyberlink]] signed by a [[neuron]], connecting two [[particles]], weighted by the [[neuron]]'s [[token]] stake. — `../cyber/whitepaper.md:135`

??? «weighted» и «costs focus» — свойства новой архитектуры cyber; в киберлинке Bostrom поля веса нет. Оставить цитаты как есть или пометить расхождение в editing.md?

### Ребро

Ребро — это связь cid_from → cid_to: то, что утверждает киберлинк, безотносительно нейрона. Киберлинки разных нейронов с одинаковыми cid_from и cid_to несут одно ребро.

У основателя ближайший термин — «axon»:

> where many agents [[link]] the same two stones / [[axons]] form — the graph's collective bones / fused connections, stronger than a strand — `../cyber/concepts.md:40`

> [[staking on cyberlinks]] — direct economic weight to edges. same mechanics, applied to [[axon]]-level — `../cyber/nomics.md:64`

??? Axon у основателя — агрегат киберлинков над одной двойкой («fused connections»); наше «ребро» существует и при одном киберлинке. Считаем соответствием и заносим в editing.md?

### Нейроны [~](particles/QmeEJ3WcY2mft2YTxG4XXAjJ2W8GiKNqakUChR9tNHDeVh.md)

Нейрон — это публикатор киберлинка.

В Бостроме нейроном может быть:

- держатель приватного ключа;
- cosm-wasm-контракт (автономная программа).

В физиологии нейрон как функциональная единица — это **интегратор с порогом**: много аналоговых входов суммируются в пространстве и во времени, и если сумма перешла порог, нейрон выдаёт один дискретный всё-или-ничего разряд. Нейрон киберграфа работает так же: он взвешивает разнохарактерную информацию и, перейдя порог «связь стоит того», выдаёт один дискретный разряд — киберлинк. Киберлинк либо опубликован, либо нет.

У основателя:

> [[neuron]] | Agent identified by public key | Signs edges, holds [[tokens]], accumulates [[karma]] — `../cyber/whitepaper.md:130`

> Every participant in the [[cybergraph]] is a [[neuron]]: an authenticated agent that creates [[cyberlinks]] and accumulates [[karma]]. — `../cyber/whitepaper.md:1469`

> so [[neurons]] 🤪 arise — the ones who know / human, AI, sensor, swarm — they sign, they stake, they show — `../cyber/concepts.md:16`

### Производный CID

Производный CID — это CID, посчитанный от строки из других идентификаторов, объединённых через запятую.

Два частных случая: адрес ребра — строка «cid_from,cid_to»; производный CID киберлинка — строка «cid_from,cid_to,neuron».

Прямого термина у основателя нет; ближайшее — «cyberlink identity», хеш самого киберлинка:

> The same function hashes [[particle]] content, [[cyberlink]] identity, Merkle nodes, and polynomial commitments. — `../cyber/whitepaper.md:196`

### Киберграф [~](particles/QmcK8QgSmsYQsVskQtGPWFSeGHXPcaJ7Lh6X1hrZGKQsVs.md)

Киберграф — это совокупность всех опубликованных киберлинков. Киберграф можно представить в форме таблицы, где каждая строчка — это киберлинк, плюс доступная мета информация по транзакциям его включающим из блокчейна (с полями height, timestamp и т.д.).

Также киберграф можно представить как направленный граф, где каждый киберлинк формирует ребро, связывая частицы в качестве вершин графа.

У основателя:

> cyber is a protocol where [[neurons]] — humans, AIs, agents, sensors — link [[knowledge]] into a single [[cybergraph]] where every claim is authenticated, every decision is provable by [[zheng]] proofs, and [[intelligence]] emerges from the [[topology]] of links rather than from the parameters of a single model. — `../cyber/whitepaper.md:36`

> The [[cybergraph]] is multi-indexed from genesis. Every edge appears in multiple indexes: by creator ([[neuron]]), by source [[particle]], by target [[particle]]. — `../cyber/whitepaper.md:151`

> the [[cybergraph]] 🕸 remembers every thread / from every [[neuron]], living or long dead / [[memory]] — authenticated, whole / a history no hand can ever control — `../cyber/concepts.md:35`

