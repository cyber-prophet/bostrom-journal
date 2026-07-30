---
parent: QmYfqXrGWhg2raNeiE74WCnL8pva1ndQN5UXcRsFtDpSnm
---

# Reading instructions

A CID is opaque: looking at an edge `X → Y`, one cannot see that X is, say, `hash("update", hash(A, B))`. A reader can recognize instructions in two ways. The first is to compute candidates in advance: compute the derived CIDs of everything already seen — edges and cyberlinks — and check the sources and targets of new edges against them. The second is to dereference the source and read its content; it works only if the preimage of the derived CID — the string `"update,Qm…"` itself — is published as a file. So, when issuing an instruction, publish the preimages of its derived CIDs as well. An edge whose parts do not parse by these rules is not an instruction but an ordinary edge: the content `"deny"` exists outside the convention too.

Both ways reflect the current stage of development of the cybergraph and applications and for now remain theory. What matters is that the cybergraph already provides verifiable proof of publication (see "Fundamentals"). Extensions may be used to help indexing — for example, a list of all raw CIDs that went into the derived CIDs at the ends of an edge, written into the transaction memo (today memo is functionally unused); the list eases recognition, while the instruction is still carried by the edge itself.

`hash("convention") → hash("deny")` — a convention declaration: the convention's special CID is published into the graph by an edge from a shared root, and the convention's description is an ordinary file, connected to the same special CID by another edge. Knowing the root, a reader computes one hash and reads the outgoing edges — the list of declared conventions; neither way above yields such a list. The first to document declaring conventions in the graph was @snedashkovsky — from the semantic convention root (see "Acknowledgement"). The root neither closes the set nor appoints a registry: a declaration is a convention like any other, and whoever needs their own list picks their own root and interprets it their own way. And like any edge, a declaration is repeated, confirmed with `confirm`, and disputed with `deny`.
