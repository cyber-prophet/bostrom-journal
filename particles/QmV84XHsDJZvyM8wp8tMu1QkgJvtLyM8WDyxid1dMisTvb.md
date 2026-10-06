---
parent: QmQ4dmqtJnk5LUvjF1x55Ytf8Ld2gjxCmJx7JGThf3zFPq
---

# Reading instructions

A CID is opaque:
when a reader looks at an edge, the reader cannot see that the source of the edge is, for example, `{"about":{"cid_from":A,"cid_to":B},"op":"update_edge"}`.
A reader can recognize instructions in two ways.
The first way is to compute candidates in advance.
The reader computes the derived CIDs of everything that it already saw
— edges and cyberlinks.
Then the reader compares the sources and targets of new edges with these CIDs.
The second way is to dereference the source and read its content.
This way works only if the preimage of the derived CID
— the record itself, for example `{"about":"Qm…","op":"update_edge"}\n` —
is published as a file.
Thus, with each instruction, also publish the preimages of its derived CIDs.
The implementation of the format in Nushell, nu-cybergraph, publishes each such record itself.
If the parts of an edge do not parse by these rules, the edge is not an instruction but an ordinary edge.
The converse is not true:
a file with the bytes `{"op":"deny_edge"}\n` also exists outside the convention
— anyone can publish it.
Thus, a parse shows that an edge reads as an instruction,
but not that someone intended it as an instruction.

The two ways show the current stage of development of the cybergraph and of applications.
nu-cybergraph already implements the second way.
For the first way, a reader can compute a candidate by hand,
but there is no automatic comparison yet.
It is important that the cybergraph already gives verifiable proof of publication (see "Fundamentals").
Extensions can help to index the graph.
An example is a list of all raw CIDs that are used in the derived CIDs at the ends of an edge. In this example, the list is in the transaction memo (today the memo is functionally unused).
The list makes recognition easier,
but the edge itself still carries the instruction.

`{"op":"convention"} → {"op":"deny_edge"}` is a convention declaration.
This edge from a shared root publishes the special CID of the convention into the graph.
The description of the convention is ordinary content, and another edge connects it to the same special CID.
A reader who knows the root computes one hash and reads the outgoing edges
— the list of declared conventions.
Neither of the two ways above gives such a list.
The first person who documented the declaration of conventions in the graph was @snedashkovsky
— from the semantic convention root (see "Acknowledgement").
The root does not close the set, and it does not appoint a registry.
A declaration is a convention like any other.
Anyone who needs their own list
selects their own root and interprets it in their own way.
Like any edge, a declaration is repeated, confirmed with `confirm_edge`, and denied with `deny_edge`.
