---
parent: QmP1harj8XeRGbEzBPjo4T9EonjQsaTHFc597FK89zQeSE
---

# Conventions

A published edge `A → B` has an address
— `{"cid_from":A,"cid_to":B}`, the CID of a record of A and B.
A signer can refer to it as to any other CID.

This lets us make derived CIDs.
When an edge has an address,
we can refer to it and write it together with other CIDs into the fields of a record. We can also build structures that refer to edges
— and to edges about edges.

In particular, we use this to build, on top of the raw graph, instructions to process it.
To issue an instruction, a signer puts a special CID
— such as `{"op":"deny_edge"}` or `{"about":A,"op":"quote_particle"}` —
in the source of an ordinary edge.
In the record, `op` is the convention word
and `about` is the subject of the instruction.
If the subject is an edge, the address of the edge identifies it.
Each such use is itself an edge with an address,
so each instruction can in turn be confirmed or denied with the same conventions.
This recursion makes the set of conventions open.
The suffix of a convention word names the kind of its subject.
`_particle` names a file, `_edge` names an edge, `_link` names a cyberlink.
A bare word (`pro`, `con`, `question`, `same`) names any CID.
Thus a mistake such as `agree_particle` with an edge address is visible in the word itself.
An evaluation (`deny_edge`, `agree_particle`) has no `about`:
the source is fixed,
and the subject is in the target.

We build instructions from the elements of the graph itself. This is a kind of *homoiconicity*
(a property known from programming languages in which code and data have one representation).
Here, that representation is the CID:
an instruction is made of the same CIDs and cyberlinks as the graph that it processes.
Thus a program that processes the graph is inside it.
This is also true at any scale.
At any time, the whole cybergraph can be fixed as a file
whose address is a CID that is computed over it.

A content address is computed from the content itself:
the same content always gives the same CID.
Thus the same content is the same particle, no matter who writes it or when.
The address is a reference and an identity at the same time.
Identical content is not stored twice.
The graph does not separate these two properties
— one write operation gives both.

Cybergraph is a general-purpose data structure.
It is suitable for many kinds of tasks, and it is not tied to a blockchain (see the format in "Fundamentals").
In addition, the implementation in Bostrom is permissionless.
Anyone who has a key pair can write to it,
and anyone can read it and process it in their own way.
There is no gatekeeper here that decides who can write and what counts as valid.
The blockchain checks only the technical correctness of a transaction
— signature and order —
not the meaning or the validity of what is written.
Cryptography gives the protection.
Each signer keeps control of their own records,
and what is written is immutable.
Thus the raw graph contains only CIDs and cyberlinks
and has no built-in meaning.
Meaning is produced at read time
— an application follows the conventions that it chooses for itself.

Conventions also do not have to be universal.
Consumers of the graph come from different fields and invent mechanics for their own tasks.
For a mechanic to work in a collective,
the collective must agree on it.
Collaborative work on information is based on this:
a shared immutable foundation
— and freely chosen consensus mechanics on top of it, dynamic ones too.

The sections below give basic examples of such conventions
— how to *encode* and how to *interpret* instructions to process the cybergraph.
(`hash("text")` is the CID of the bytes of the text itself.)
