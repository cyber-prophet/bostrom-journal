---
parent: QmcggMNb1vk7G1PBBmTKS33idxHp2sWhPqJ2nJ9tDecAgY
---

# Agents over the graph: output as a reusable value

Agents of different types that act together need explicit rules of interaction
that each agent can verify without trust in the other agent.
Cybergraph carries such rules as conventions in the data itself
— a separate coordination layer is not necessary.

A signer does not have to be a human.
A contract or an LLM agent signs cyberlinks by the same conventions.
This changes the scale of collaborative work:
one can run different models on one corpus
and record the outputs that each model made.

A recorded output is ordinary content with its own CID,
so all the conventions above apply to it immediately.
Signers quote it (`quote_particle`), evaluate it (`agree_particle`/`disagree_particle`), and add arguments for or against it (`pro`/`con`).
But more important, it becomes input for the next output.
One model decomposed a text into claims,
another model connected them with arguments,
and a third model checked them for consistency with the corpus.
Each step reads the results of the previous steps as ready parts and does not derive them again.

Both properties of the content address work here (see "Conventions").
LLM output is expensive — tokens, latency, nondeterminism.
After an output is recorded once, it is not computed again.
To record an output, a signer puts the CID of the output into an edge from the input,
and that edge is a cache entry.
The key is the input, and the value is the output.
And the cache is shared:
the edge and the particle are visible to everyone
— no one has to repeat the work of someone else.

The difference from an ordinary computation cache is that the value can be disputed.
In a system like Nix, a build result is also addressed by content and reused,
but nobody can dispute it
— it simply is.
An output in the graph follows the common rules.
The edge that records the output is repeated, confirmed with `confirm_edge`, and denied with `deny_edge`.
The output content itself is evaluated with `agree_particle`/`disagree_particle`
— and all these cyberlinks combine into consensus (see "Measurable consensus").
Thus a computation cache becomes shared knowledge
— a unit that agents not only reuse but also check after one another.

An output is recorded with an ordinary record:
it is published as a file
and becomes a particle when its CID stands in an edge.
The signer can write provenance into the content of the output.
This provenance contains the CIDs of the processed cyberlinks and of the particles that they connect, and a description of the computation that was done.
Provenance is part of the content,
so the CID of the output fixes its inputs.
The read policy decides what to do with another signer's output:
trust the signer, measure consensus, or repeat the declared computation over the same inputs.
A signer who repeated the computation themselves publishes the same edge.
A signer who took the output as it is confirms the edge that someone else published (see "Confirming an edge and a cyberlink").
The graph shows what each vote is worth.
