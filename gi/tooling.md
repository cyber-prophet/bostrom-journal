# Intention

Let's replace Claude Code's chat with this version-controlled file.
We invent rules along the way and just use common-sense logic to make our work convenient and effective.

## Rules

- Don't restate the diff. Be brief.
- Issue an instruction as a `!!` marker (on its own line or beside the target) or as the commit message; a direct edit is itself an instruction. Apply each marker, then delete it.
- A commit message explains a decision by default — honor and propagate it; if it reads as an imperative, execute it.
- Commit each logical change atomically and promptly: every commit is the reply and a rollback point. The body records the decision and why, not the diff; propagate it to any reference it makes stale.
- If a reply would be large, write it to a file and commit that, instead of pasting it here.

# Scratchpad
