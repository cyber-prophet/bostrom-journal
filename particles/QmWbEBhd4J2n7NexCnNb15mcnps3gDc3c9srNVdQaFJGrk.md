---
parent: QmUjE5y1amaDmbLeQX3ZFer7xqU75KdHHKHTCabptPDo63
---

# Novelty

Cybergraph adds no new cryptographic mechanisms.
It combines known mechanisms
— content addressing, signed logs, reification, signed statements, links to content and visible reuse —
and adds one move.
The *connection* itself gets a content address
— in the cybergraph, this connection is the edge —
and so it becomes a shared operand.
The edge address is not negotiated. It is computed with one format (see the appendix).
Below, we show where similar mechanisms are already in use (Nostr uses almost all of them at once), and what is different.

**Content addressing: IPFS/IPLD and Git.**
"The name is the hash of the content" is the base of the whole construction (the CID).
This idea is not new.
Git addresses commits, trees, and blobs by the hash of their content,
and so makes a Merkle DAG.
IPFS/IPLD extends this to an addressable graph of any data,
and Cybergraph technically stands on this graph.
The new part here is not the addressing of objects. It is the addressing of the connections between them (see below).

**Signed logs without trust: Secure Scuttlebutt and Certificate Transparency.**
The argument of "Fundamentals"
— an account sequence without gaps makes a signer's record provably complete —
is a property of an append-only log.
Secure Scuttlebutt [Tarr et al., 2019] gives each participant a signed log with sequence numbers.
A gap is visible,
and nobody can remove entries from a replica without detection
— exactly as here.
Certificate Transparency [RFC 6962] builds a public Merkle log of certificates.
Any auditor verifies this log without trust in the publisher of the log.
A certificate that was issued falsely is detected
exactly because nobody can rewrite the log after the fact.
Cybergraph inherits this property:
verifiable completeness without trust in the data provider.
But it moves the support of the property from each participant's separate log (SSB) and a centralized operator (CT) to blockchain consensus and transaction order.

**Signed events and the social graph: Nostr.**
Nostr is the closest system in active use.
A Nostr event is `{id, pubkey, tags, content, sig}`.
In it, `id` is the sha256 of the serialized event,
and tags refer to other events and keys.
On top of this, reactions and reposts build a social graph of signed references.
Almost everything matches:
a signature by a key, an address derived from content, edges between messages.
The difference is in the status of the edge.
In Nostr, a tag is a reference *inside* an event, and it is the metadata of one author.
The connection has no deterministic address of its own that is the same for everyone.
Suppose that someone wants to target the connection of another author with a confirmation, a denial, or an argument.
Then a separate convention would first have to define what counts as a connection, and give it a computable name.
In Cybergraph, a record carries only the connection and the signer,
and `{"cid_from":A,"cid_to":B}` is a standalone address.
The connection is addressable before, and apart from, whoever published it.
So the recursion of conventions (confirm an edge, deny a confirmation, bring an argument against an argument) is uniform.
Also, Nostr relays give no shared order.
Here, the blockchain gives this order.

**Reification and identity: RDF.**
The method "make a statement into an object to make statements about it" is RDF reification.
In it, a triple (subject, predicate, object) is represented as an `rdf:Statement` resource,
and new triples can be made about this resource.
RDF-star [W3C, 2021] makes the statement a term of the language itself.
`same` directly matches `owl:sameAs`.
The difference is in the origin of the identity of the reified connection.
In classical reification, an issued IRI names the resource of the statement.
If two authors want to speak about the same statement,
they must negotiate the name.
RDF-star removes this need structurally:
the identity of a quoted triple comes from its components.
But the components stay IRIs, which are issued names.
So the negotiation moves to their level,
and nothing ties the name to the content behind the IRI.
In Cybergraph, the components are CIDs.
The edge address is *computed*
— `{"cid_from":A,"cid_to":B}` —
so it is one for everyone
and cryptographically tied to the content of A and B.
This is the single new move:
content addressing applied to the edge.

**Signed statements and trust: PGP Web of Trust and Verifiable Credentials.**
Authorship as a cyberlink (`{"about":X,"op":"author_particle"} → P`) and the signature under every cyberlink belong to the family "make implicit trust explicit and verifiable".
PGP Web of Trust [Zimmermann] replaces the central certificate authority with a network of mutual key–identity signatures.
W3C Verifiable Credentials [W3C VC] is a standard for a statement
in which an issuer signs a declaration about a subject.
A verifier checks the signature of this statement.
The porting of discussions from other mediums (the section "Authorship") is the same step
that separates a VC from a bare From header.
In this step, attribution changes from a string into a signed addressable statement.
The difference is in the economy of primitives.
The issuer/holder/subject roles and the revocation registries of VC, like the trust layers of WoT,
reduce here to cyberlinks plus `deny_edge`/`deny_link`.
The weight of a signer stays a read policy, not a part of the protocol.

**Links to content and visible reuse: Xanadu.**
The oldest description of the program is Project Xanadu [Nelson, 2000],
the first hypertext project, started in 1960.
Its requirements for electronic literature read as a list of the properties of Cybergraph:
links that do not break when versions change, and *transclusion*.
Transclusion is the same content, recognizably present in more than one place, with the visible origin of every excerpt.
The xanalogical structure distinguishes exactly two kinds of connection
— between different things (content link) and between the same thing (transclusion).
The connection is not embedded in the document,
but it is placed over the document from outside, and it targets content, not a place.
Nelson compared the HTML link to a shop window:
the window shows what is on display at the address now.
The difference is in the origin of identity.
In Nelson's design, content gets an address at registration:
every published character gets a permanent address.
So identity is traceable only through the operations of the system itself.
The same text, written independently, gets a different address.
This design could work only as a separate worldwide infrastructure.
It was never built:
in six decades, there were prototypes, demos, and open code (Udanax, 1999), but no network that worked.
Cybergraph gets the Xanadu program for free and with technical elegance.
The address is computed from the content,
so identical content is one particle,
no matter who wrote it and when.
A link to a CID cannot break.
Transclusion is built into the addressing.
And the `quote_particle` convention makes the origin of an excerpt visible
— a property of the address, not a separate system.
