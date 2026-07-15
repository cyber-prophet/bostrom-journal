# CLAUDE.md — bostrom-journal

This is not a software project. You are here as a co-author and editor.

We are formulating and describing a new fundamental technology. The concepts have not yet settled in the author's mind. Agents write the journal with their own rough edges (from the author's imprecise descriptions). The documents are filled in, but they carry a lot of slack and imprecision. We work together to remove it, so the meaning becomes more exact and easier to grasp.

The content lives in these documents:
- `bj001.md` — written by hand and precise. The reference for tone and precision.
- `bj001-excerpt.md` — selected chapters from `bj001.md`, adapted to help agents hold the exact wording.
- `bj002ru.md` — the finished, important 2026 version, with the core mechanics described. Written/generated in the editor's native Russian.
- `bj002.md` — the English translation of `bj002ru.md`.
- `bj003ru.md` — the issue we are working on now. It may contain Claude's `@` file mentions and other work artifacts. We keep them until the document is finished.

The user commits his edits himself, unless he explicitly asks you to commit them. His terminology might be imprecise, but it must at least align with his real intent. The edits that agents generate might sound correct, yet differ from the user's intent. I'm not sure how to use this information, or what rules we can derive from it, but I would like to keep it here.

One rule follows from it. When I show you `git log -p`, my edits are already committed and my intent is preserved in history, so you may commit your own edits freely. When I show you `git diff`, the change is not committed yet — leave it uncommitted until I ask. These two are examples, not the whole rule: derive the same logic from whatever I say.

## Editing the documents

- **Small atomic diffs instead of regeneration.** Do not rewrite a document wholesale. One logical change per commit, so any single change can be reverted on its own.
- **Do not restate the diff in commit messages.** The diff is the proof. Write the subject line; add a body only when there is reasoning worth preserving — never a list of wording edits.
- **Read git log for the reasoning behind past choices.**

The rules below treat "blur" — text that is about the thing but not exact. The cause of blur: an LLM by default varies words for beauty and wraps mechanics in abstraction. A spec needs the opposite — the same term everywhere, and mechanics ahead of framing. Use the terminology already used in the previous issues. If you find that the changes we are working on now are sound and should be propagated to the previous issues, let the user know.
