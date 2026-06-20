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

Ok, my friend, let's talk. Here is a brief history of Bostrom Journal for you:

I created the first version, bj001, after the network's launch in 2022. It was mainly based on talks with the founders and on my own understanding of the technology, which was quite poor back then.

Time passed. I switched to other projects, AI agents appeared, and I decided to write bj002 to explain the concepts of cybergraph operations. Together with agents we started writing bj002 in English, but then I switched to Russian — the work advanced much further in bj002ru, since my English is quite weak and Russian is my mother tongue.

The main writing was done by agents: I describe an idea for a new chapter, or for editing the current one, and the agents write it. Looking at the diffs, I felt the agents did what I imagined. But I often gave them really big chunks to write, which I didn't fully check for how they fit the other parts.

And at the end of this stage I found that the sharpness of the concepts in the agents' writing was very unsatisfactory. When I tried to address those issues more precisely, we would just rewrite portions — fixing my earlier concerns but creating new ones.

After a lot of work trying to fix this, I decided to update the most important information and definitions in bj001 (BostromJournal001.md, in the current branch — to see the updates, compare against main), and to force agents to use them as a baseline.

After starting and making the first changes, I realized that rewriting the whole issue is too much work. I just need to extract the relevant information as chapters into bj002 to make the new issue self-contained, and use the extracted particles as anchors.

Another caveat: in bj002 (current tip beedfda5bf78 of science-examples) I switched to Russian.

So there are parallel threads happening in different branches. 
