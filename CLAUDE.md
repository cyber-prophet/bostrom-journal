# CLAUDE.md — bostrom-journal

This is not a software project.
You are here as a co-author and editor.

We are formulating and describing a new fundamental technology.
The concepts have not yet settled in the author's mind.
Agents write the journal with their own rough edges (from the author's imprecise descriptions).
The documents are filled in,
but they carry a lot of slack and imprecision.
We work together to remove it,
so the meaning becomes more exact and easier to grasp.

The content lives in these documents:
- `bj001.md` — written by hand and precise.
  The reference for tone and precision.
- `bj001-excerpt.md` — selected chapters from `bj001.md`,
  adapted to help agents hold the exact wording.
- `bj002ru.md` — the finished, important 2026 version, with the core mechanics described.
  Written/generated in the editor's native Russian,
  in the vocabulary fixed in the terminology section below.
- `bj002.md` — the English translation of `bj002ru.md`.
  Every change to issue 2 is a paired ru+en change.
- `bj003ru.md` / `bj003stdru.md` — the issue in progress.
  They live on the journal's bj003 branches in the recipient repo,
  not on the `master` line this monorepo mirrors,
  so they are absent from this tree.
  They may contain Claude's `@` file mentions and other work artifacts;
  we keep those until the document is finished.

The user commits his edits himself,
unless he explicitly asks you to commit them.
His terminology might be imprecise,
but it must at least align with his real intent.
The edits that agents generate might sound correct,
yet differ from the user's intent.
I'm not sure how to use this information, or what rules we can derive from it,
but I would like to keep it here.

One rule follows from it.
When I show you `git log -p`,
my edits are already committed and my intent is preserved in history,
so you may commit your own edits freely.
When I show you `git diff`,
the change is not committed yet
— leave it uncommitted until I ask.
These two are examples, not the whole rule:
derive the same logic from whatever I say.

## Terminology: three coined terms, everything else standard

Decision by the author, 2026-07-26:
the coined vocabulary makes the cybergraph look more exotic than it is
and costs the reader effort before they reach the mechanics,
so only **киберграф** and **киберлинк** were to stay,
and everything else uses the ordinary words of graph theory and files.
On 2026-09-02 a third term stayed with them (see "How it got here").
The words that stay:

- **киберграф** / cybergraph — the data structure made of cyberlinks.
- **частица** / particle — one name for two things, the vertex of the graph and the bytes of the file under its CID;
  a file becomes a particle when its CID stands in an edge (`bj001-excerpt.md`, «Частицы»).
  Kept because the format's own words carry it:
  `agree_particle`, `disagree_particle`, `quote_particle`, `author_particle` are hashed as written,
  and `../nu-cybergraph` says *particle* and stores under `particles/`.
- **киберлинк** / cyberlink — a signer's statement of an edge between two particles;
  the triple `{cid_from, cid_to, signer}`.

The signer is **подписант** / signer
— the one whose key signed the cyberlink;
identity = CID of the public key —
and the record field is `signer`.
Decided 2026-07-27:
the journal is primary for vocabulary and `../nu-cybergraph` follows it,
so the field was renamed in the format too
— `{cid_from, cid_to, signer}` and `hash(cid_from, cid_to, signer)`.
The content of a particle is a **файл** / file, an ordinary word.

How it got here.
The 2026-07-26 decision was first applied as a parallel standard-terms reissue, `bj002stdru.md` / `bj002std.md`,
with *particle* → file / vertex and *neuron* → signer,
while `bj002ru.md` / `bj002.md` kept the coined vocabulary
so the two readings could be compared;
the `confirm` convention was born in that reissue.
Decision by the author, 2026-09-02:
the pair goes.
The op words carry `_particle` in every edition and the code keeps *particle*,
so the reissue could not remove the word it was made to remove;
meanwhile the code's record field is `signer`,
which only the reissue said,
so neither edition matched the code.
The coined editions took the code's vocabulary instead
— *signer* / подписант for the field, *particle* / частица for the file in the graph —
and the reissue was deleted;
`git log` holds it.
Its particles stay in `particles/`:
published content is not withdrawn.

Bostrom's own names for these things
— *нейрон* (neuron) for the signer, and *частица* as it was coined there —
appear in `bj001.md` / `bj001-excerpt.md`
and in the one line of «Основы» / "Fundamentals" that tells the reader what the signer is called in Bostrom, on cyb.ai and in issue 1.
Nowhere else.

Rules that follow:

- **Всё опубликованное — обычный текстовый файл** (или JSON — для структур данных).
  CID можно посчитать от любых байтов,
  но журнал говорит только о файлах:
  тезис — файл, вывод агента — файл, прообраз производного CID — файл.
  Частицей файл становится, когда его CID стоит в ребре;
  «вершина» — слово теории графов для той же частицы, когда речь только о её месте в графе.
- **Киберлинк** — утверждение подписанта о ребре между двумя частицами.
  Тройка остаётся прежней;
  меняются только слова, которыми мы её описываем.
- Author-of-content vs signer-of-cyberlink:
  соглашение `hash("author_particle", B) → P` называет **автора файла**;
  подпись под киберлинком принадлежит **подписанту**.
  Раньше эту разницу приходилось объяснять («нейрон киберлинка не обязан быть автором содержимого»)
  — теперь она видна из слов.
- **The op words are nu-cybergraph's, letter for letter** (decided 2026-09-02):
  every convention word names its subject — `_particle`, `_edge`, `_link` —
  and a bare word (`pro`, `con`, `question`, `same`) means the operand is any CID.
  The code moves first, the editions follow as a paired ru+en change;
  only the addresses still differ, because bj002 hashes a comma-join where the format derives from a record.
- Не «упрощать» дальше самого механизма:
  CID, производный CID, адрес ребра, политика чтения, гомоиконичность — остаются, с глоссой при первом появлении.

## Editing the documents

- **Small atomic diffs instead of regeneration.**
  Do not rewrite a document wholesale.
  One logical change per commit,
  so any single change can be reverted on its own.
- **Do not restate the diff in commit messages.**
  The diff is the proof.
  Write the subject line;
  add a body only when there is reasoning worth preserving
  — never a list of wording edits.
- **Read git log for the reasoning behind past choices.**
- **Particles are regenerated only at merge.**
  An edit to a chapter leaves its `[~]` marker and `particles/` alone;
  the reissue runs once, when the branch lands on master
  (`nu-cyjournal regenerate ./bj002ru.md --ref master`, the same for `./bj002.md`)
  — so the history does not fill with intermediate versions.

The rules below treat "blur" — text that is about the thing but not exact.
The cause of blur:
an LLM by default varies words for beauty
and wraps mechanics in abstraction.
A spec needs the opposite
— the same term everywhere, and mechanics ahead of framing.
Use the terminology fixed in the section above,
applied the same way across all issues.
If you find that the changes we are working on now are sound and should be propagated to the previous issues,
let the user know.
