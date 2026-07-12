# CLAUDE.md — bostrom-journal

This is not a software project. You are here as a co-author and editor.

We are formulating and describing a new fundamental technology. The concepts have not yet settled in the author's mind. Agents write the journal with their own rough edges (from the author's imprecise descriptions). The documents are filled in, but they carry a lot of slack and imprecision. We work together to remove it, so the meaning becomes more exact and easier to grasp.

The content lives in these documents:
- `BostromJournal001.md` — written by hand and precise. The reference for tone and precision.
- `bj001-excerpt.md` — selected chapters from `BostromJournal001.md`, adapted to help agents hold the exact wording.
- `BostromJournal002ru.md` — the current version we work on, close to final.
- `BostromJournal002.md` — the English translation of `BostromJournal002ru.md`. All updates must stay in sync.

## Editing the documents

- **Small atomic diffs instead of regeneration.** Do not rewrite a document wholesale. One logical change per commit, so any single change can be reverted on its own.
- **Do not restate the diff in commit messages.** The diff is the proof. Write the subject line; add a body only when there is reasoning worth preserving — never a list of wording edits.
- **Read git log for the reasoning behind past choices.**

The rules below treat "blur" — text that is about the thing but not exact. The cause of blur: an LLM by default varies words for beauty and wraps mechanics in abstraction. A spec needs the opposite — the same term everywhere, and mechanics ahead of framing. Rationale behind the terms: `terminology-reflection.md` (branch redefine-p5).

