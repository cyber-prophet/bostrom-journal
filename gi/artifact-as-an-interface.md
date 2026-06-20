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

Ok, my friend, let's talk now. The brief history of bostrom journal for you:

I created the first version of bj001 after the network's launch in 2022. It was mainly based on communications with founders and my own much poor at those times understanding of the technology.

Time has passed, I switched to other projects, ai agents appeared on the stage, I decided to write the bj002 to explain cybergraph operations concepts. Together with agents we wrote bj002 in russian. But the sharpness of concepts in agent's writing is very unsatisfactory: I describe concepts and goals, and agents just rewrite huge portions addressing my previous concerns and creating new ones.

With much of work and attempt of fixing this I decided to update the most important relevant information and definitions in the bj001, and to force agents to use them as a baseline.

After starting and implementing first changes I understood that rewriting the whole issue is a big work, and I just need to extract the relevant information as chapters into bj002 to make the new issue self contained, and just to use the extracted particles as an anchor.

Another caveat is that in bj002 (current tip beedfda5bf78 of 
science-examples) I switched to Russian language.

So there are parallel threads happening in different branches. 
