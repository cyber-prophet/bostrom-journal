---
parent: QmdZW1sLPLNJXxpZBRHw4srjAcgeVSkqdaz7NfkVeXdpHF
---

# Reading instructions

A CID is opaque:
looking at an edge, one cannot see that its source is, say, `{"about":{"cid_from":A,"cid_to":B},"op":"update_edge"}`.
A reader can recognize instructions in two ways.
The first is to compute candidates in advance:
compute the derived CIDs of everything already seen
— edges and cyberlinks —
and check the sources and targets of new edges against them.
The second is to dereference the source and read its content;
it works only if the preimage of the derived CID
— the record itself, such as `{"about":"Qm…","op":"update_edge"}\n` —
is published as a file.
So, when issuing an instruction, publish the preimages of its derived CIDs as well;
nu-cybergraph, the implementation of the format in Nushell, publishes every such record itself.
An edge whose parts do not parse by these rules is not an instruction but an ordinary edge.
The converse does not hold:
a file with the bytes `{"op":"deny_edge"}\n` exists outside the convention too
— anyone can publish it,
so parsing tells that an edge reads as an instruction,
not that it was meant as one.

Both ways reflect the current stage of development of the cybergraph and applications:
the second is already implemented in nu-cybergraph;
in the first, a candidate can be computed by hand,
but there is no automatic matching yet.
What matters is that the cybergraph already provides verifiable proof of publication (see "Fundamentals").
Extensions may be used to help indexing
— for example, a list of all raw CIDs that went into the derived CIDs at the ends of an edge, written into the transaction memo (today memo is functionally unused);
the list eases recognition,
while the instruction is still carried by the edge itself.

`{"op":"convention"} → {"op":"deny_edge"}` — a convention declaration:
the convention's special CID is published into the graph by an edge from a shared root,
and the convention's description is ordinary content, connected to the same special CID by another edge.
Knowing the root, a reader computes one hash and reads the outgoing edges
— the list of declared conventions;
neither way above yields such a list.
The first to document declaring conventions in the graph was @snedashkovsky
— from the semantic convention root (see "Acknowledgement").
The root neither closes the set nor appoints a registry:
a declaration is a convention like any other,
and whoever needs their own list
picks their own root and interprets it their own way.
And like any edge, a declaration is repeated, confirmed with `confirm_edge`, and disputed with `deny_edge`.
