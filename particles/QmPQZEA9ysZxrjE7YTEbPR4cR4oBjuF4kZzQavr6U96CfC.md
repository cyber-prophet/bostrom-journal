# Conventions

A published edge `A → B` has an address — `hash(A, B)`, the CID of A and B taken together; it can be referenced like any other CID.

This lets us form derived CIDs: once an edge is addressable, we can reference it, hash it together with other CIDs, and build structures that reference edges — and edges about edges.

We use this, in particular, to build, on top of the raw graph, instructions for processing it. An instruction is issued by placing a special CID — such as `hash("deny")` or `hash("quote", A)` — in the source of an ordinary edge. Since every such use is itself an addressable edge, every instruction can in turn be confirmed, denied, or quoted by the same conventions. This recursion makes the set of conventions open.

Building instructions from the graph's own elements is a kind of *homoiconicity* (a property familiar from programming languages where code and data share one representation). Here that representation is the CID: an instruction consists of the same CIDs and cyberlinks as the graph it processes, so a program that processes the graph lives inside it. And this holds at any scale: the whole cybergraph can at any moment be fixed as a file addressed by a CID computed over it.

A content address is derived from the content itself: the same content always yields the same CID. So the same content, whoever records it and whenever, is the same particle: the address is at once a reference and an identity; the identical is not stored twice. The graph does not separate these two properties — one act of recording gives both.

Cybergraph is a general-purpose data structure: fit for a wide range of tasks and not tied to a blockchain (see the format in "Fundamentals"); Bostrom's implementation is, on top of that, permissionless. Anyone holding a key pair can write to it, and anyone can read and process it in their own way: there is no gatekeeper here to decide who may write and what counts as valid. The blockchain checks only the technical correctness of a transaction — signature and order — not the meaning or the validity of what is recorded; cryptography provides the protection, control over one's own records stays with each neuron, and what is recorded is immutable. So the raw graph contains only CIDs and cyberlinks and carries no built-in meaning: meaning is produced at read time — an application follows conventions it chooses for itself.

And conventions need not be universal. Consumers of the graph come from different fields and invent mechanics for their own tasks; for a mechanic to work within a collective, the collective must agree on it. This is what collaborative work on information stands on: a shared immutable foundation — and freely chosen consensus mechanics on top of it, including dynamic ones.

The sections below give basic examples of such conventions — how to *encode* and how to *interpret* instructions for processing the cybergraph. (`hash()` is always the same operation: compute the CID of the string of arguments joined with commas; see the appendix.)
