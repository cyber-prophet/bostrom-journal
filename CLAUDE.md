# CLAUDE.md — bostrom-journal

This is not a software project. You are here as a co-author and editor.

We are formulating and describing a new fundamental technology. The concepts have not yet settled in the author's mind. Agents write the journal with their own rough edges (from the author's imprecise descriptions). The documents are filled in, but they carry a lot of slack and imprecision. We work together to remove it, so the meaning becomes more exact and easier to grasp.

The content lives in these documents:
- `bj001.md` — written by hand and precise. The reference for tone and precision.
- `bj001-excerpt.md` — selected chapters from `bj001.md`, adapted to help agents hold the exact wording.
- `bj002ru.md` — the finished, important 2026 version, with the core mechanics described. Written/generated in the editor's native Russian. Kept in the coined vocabulary; content synced with `bj002stdru.md` (see the terminology section below).
- `bj002.md` — the English translation of `bj002ru.md`.
- `bj002stdru.md` — the same issue 2 reissued in the standard terms (see the section below). A parallel document, not a replacement: `bj002ru.md` keeps the coined vocabulary so the two readings can be compared.
- `bj002std.md` — the English translation of `bj002stdru.md`.
- `bj003ru.md` — the issue we are working on now. It may contain Claude's `@` file mentions and other work artifacts. We keep them until the document is finished.

The user commits his edits himself, unless he explicitly asks you to commit them. His terminology might be imprecise, but it must at least align with his real intent. The edits that agents generate might sound correct, yet differ from the user's intent. I'm not sure how to use this information, or what rules we can derive from it, but I would like to keep it here.

One rule follows from it. When I show you `git log -p`, my edits are already committed and my intent is preserved in history, so you may commit your own edits freely. When I show you `git diff`, the change is not committed yet — leave it uncommitted until I ask. These two are examples, not the whole rule: derive the same logic from whatever I say.

## Terminology: two coined terms, everything else standard

Decision by the author, 2026-07-26: the coined vocabulary makes the cybergraph look more exotic than it is and costs the reader effort before they reach the mechanics. Only two coined terms stay — **киберграф** and **киберлинк** (cybergraph, cyberlink). Everything else uses the ordinary words of graph theory and files.

**Applied — in parallel files.** The standard-terms reissue of issue 2 lives in `bj002stdru.md` / `bj002std.md`. The original `bj002ru.md` / `bj002.md` stay as the parallel coined-vocabulary edition. Decided 2026-08-06: the editions are kept in sync by content — a substantive change made in one (the `confirm` convention was born in the std reissue) is ported to the other in that edition's vocabulary, as paired ru+en changes — so at any moment the editions differ only in terminology. The coined vocabulary therefore stays in `bj001.md` / `bj001-excerpt.md`, in `bj002ru.md` / `bj002.md`, and — even in the standard-terms files — in the «Основы» / "Fundamentals" line that gives the reader Bostrom's own names (*нейрон*, *частица*). New text uses the standard terms; the table below is the mapping for reading the older texts.

| было | стало | note |
|---|---|---|
| киберчастица, частица | **файл** — когда речь о содержимом; **вершина** — когда речь о положении в графе | файл становится вершиной, когда его CID стоит в ребре |
| кибернейрон, нейрон | **подписант** | тот, чей ключ подписал киберлинк; identity = CID публичного ключа |
| содержимое (как самостоятельная сущность) | **файл** / **содержимое файла** | «содержимое» остаётся обычным словом, но сущность — файл |
| ребро, вершина, CID, тезис | без изменений | уже стандартные |

Rules that follow:

- **Всё опубликованное — обычный текстовый файл** (или JSON — для структур данных). CID можно посчитать от любых байтов, но журнал говорит только о файлах: тезис — файл, вывод агента — файл, прообраз производного CID — файл.
- **Киберлинк** — утверждение подписанта о ребре между двумя файлами. Тройка остаётся прежней; меняются только слова, которыми мы её описываем.
- Author-of-content vs signer-of-cyberlink: соглашение `hash("author", B) → P` называет **автора файла**; подпись под киберлинком принадлежит **подписанту**. Раньше эту разницу приходилось объяснять («нейрон киберлинка не обязан быть автором содержимого») — теперь она видна из слов.
- The English issues follow the same mapping: particle → **file** / **vertex**, neuron → **signer**.
- Не «упрощать» дальше самого механизма: CID, производный CID, адрес ребра, политика чтения, гомоиконичность — остаются, с глоссой при первом появлении.

**The record field is `signer`.** Decided 2026-07-27: the journal is primary and `../nu-cybergraph` follows it, so the field was renamed in the format too — `{cid_from, cid_to, signer}` and `hash(cid_from, cid_to, signer)`. The name `neuron` survives in the coined-vocabulary edition (`bj002ru.md` / `bj002.md`) and where the journal quotes Bostrom's own vocabulary («Основы»). The code migration is parked in `../nu-cybergraph/todo/`.

## Editing the documents

- **Small atomic diffs instead of regeneration.** Do not rewrite a document wholesale. One logical change per commit, so any single change can be reverted on its own.
- **Do not restate the diff in commit messages.** The diff is the proof. Write the subject line; add a body only when there is reasoning worth preserving — never a list of wording edits.
- **Read git log for the reasoning behind past choices.**

The rules below treat "blur" — text that is about the thing but not exact. The cause of blur: an LLM by default varies words for beauty and wraps mechanics in abstraction. A spec needs the opposite — the same term everywhere, and mechanics ahead of framing. Use the terminology fixed in the section above, applied the same way across all issues. If you find that the changes we are working on now are sound and should be propagated to the previous issues, let the user know.
