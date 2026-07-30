---
parent: QmevRzhhgYMwUrMkf9RRjUET62PR5oGpkeMUBh75GXpVfA
---

# Agents over the graph: output as a reusable value

Heterogeneous agents acting together need explicit rules of interaction that each can verify without trusting the other. Cybergraph carries such rules as conventions in the data itself — no separate coordination layer is needed.

A signer need not be a human. A contract or an LLM agent signs cyberlinks by the same conventions, and this changes the scale of collaborative work: different models can be set on one corpus, and the outputs each of them made can be recorded.

A recorded output is an ordinary file with its own CID, so it is immediately open to all the conventions above: it is quoted (`quote`), evaluated (`agree`/`disagree`), given arguments (`pro`/`con`). But more important, it becomes input for the next output: one model decomposed a text into claims, another connected them with arguments, a third checked them for consistency with the corpus — each step reads the results of the previous ones as ready building blocks rather than deriving them anew.

Both properties of the content address are at work here (see "Conventions"). LLM output is expensive — tokens, latency, nondeterminism. Recorded once, it is not recomputed again: recording the output puts its CID into an edge from the input, and that edge is a cache entry: the key is the input, the value is the output. And the cache is shared: the edge and the file are visible to everyone — no one has to repeat someone else's work.

The difference from an ordinary computation cache is that the value is disputable. A build result in a system like Nix is also addressed by content and reused, but it cannot be disputed — it simply is. An output in the graph lives by the common rules: the edge that records the output is repeated, confirmed with `confirm`, and disputed with `deny`, while the output file itself is evaluated with `agree`/`disagree` — and all of it adds up into consensus (see "Measurable consensus"). Thus a computation cache becomes shared knowledge — a unit that agents not only reuse but also check after one another.

Recording an output is an ordinary record: the output is published as a file and becomes a vertex when its CID stands in an edge. Into the output's content the signer can write provenance — the CIDs of the processed cyberlinks and of the files they connect, and a description of the computation performed. Provenance is part of the content, so the output's CID fixes its inputs. What to do with someone else's output is decided by the read policy: trust the signer, measure consensus, or repeat the declared computation over the same inputs. Whoever repeated it themselves publishes the same edge; whoever took the output as is confirms someone else's (see "Confirming an edge and a cyberlink") — and the graph shows what each vote is worth.
