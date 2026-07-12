# Bostrom Journal

Editor-in-chief: maxim-uvarov aka cyber-prophet `bostrom1h29u0h2y98rkhdrwsx0ejk5eq8wvslygexr7p8`

[github](https://github.com/cyber-prophet/bostrom-journal/)

## Issue 2: Encoding and interpreting instructions for processing the cybergraph

Cybergraph is a shared information space. Its elements are *particles*: units of data, each with its own address — a CID. Particles are connected by cyberlinks. Technically, Cybergraph is a data structure made of such cyberlinks, and each cyberlink is a record signed by a neuron, of the form:

```
{
    cid_from: Qm1
    cid_to: Qm2
    neuron: Qm3
}
```

cid_from and cid_to are the CIDs (content identifiers) of the two particles being connected: IPFS hashes that uniquely identify the content of files (regardless of their names). The pair cid_from → cid_to is an *edge* of the cybergraph, directed from cid_from to cid_to; the particles are its nodes. The neuron is the agent (for example, a human, an AI, a contract, or a sensor) that created and signed the cyberlink; it is addressed by its CID (Qm3), so a neuron can be referenced like any content. A neuron becomes a particle when its CID stands in an edge. The exact encoding is fixed in the appendix "Cybergraph format".

Because all three fields — cid_from, cid_to, and neuron — are plain text strings, we can join them into one string with commas and compute the IPFS hash of the resulting string — a derived CID. The hash of the pair "Qm1,Qm2" is the *edge address*: it contains no neuron and is therefore the same for everyone who connected the same particles — it addresses *what* is stated. The hash of the triple "Qm1,Qm2,Qm3" is the cyberlink's derived CID: it addresses the act of a specific neuron — *who* states it. Both addresses can be used to form other cyberlinks — this makes it possible to issue instructions for interpreting edges and specific cyberlinks by means of other cyberlinks. Until such use, a derived CID is only an address: like any CID, it becomes a particle when it stands in an edge.

In this issue of the journal we devise and make sense of possible approaches — open conventions for encoding and interpreting instructions for processing the cybergraph.

### Acknowledgement

As far as I know, the first to document conventions of this kind was @snedashkovsky in [semantic conventions](https://github.com/Snedashkovsky/cyber-semantic-conventions) — in July 2021, months before the Bostrom launch; the examples ran on the test network. The form itself was likely born earlier, as an implementation of the ideas behind cyb.ai; whose ideas they were originally is not clear from today's vantage point — Sergey gave them a name and a description. His document encodes application objects — tweet, follow, avatar: the CID of a special string, such as tweet, is placed in the source of an edge and marks the target as an object of that type; the encoding of these CIDs matches the appendix "Cybergraph format". He also proposed a meta level: a convention is itself declared in the graph by cyberlinks from the semantic convention root, so the list of conventions can be read from the graph itself.

And, of course, the whole Cybergraph model with its many manifestations, some of which are described in this issue, was born — in far greater volume — and lives in the minds of the founders @mastercyb and @cyborgshead.

### Fundamentals

The definition at the start of the issue does not mention a blockchain: the triple and the derived CIDs are defined on top of IPFS hashing — this is the *format* of Cybergraph, fit for any medium where records are published signed. Cybergraph was first implemented on the Bostrom blockchain.

A Bostrom cyberlink carries the same triple as the format: cid_from and cid_to sit in the record, the neuron is given by the transaction signature. Only the encoding of the neuron diverges: in Bostrom it is a bostrom1… address (a chain-specific hash of the same key), in the format it is the CID of the public key (see the appendix "Cybergraph format").

Beyond the triple, the chain adds only publication metadata. Since Bostrom is a blockchain built on the Cosmos SDK, every cyberlink is contained in a transaction, so two more facts can be read from the raw chain:

- height and timestamp — when the cyberlink was published
- account sequence — the neuron's own transaction counter, running without gaps

Every transaction with cyberlinks is signed by its neuron, and the block that carries it is signed by validators. Anyone can verify these signatures and, without trusting whoever provided the data, make sure that a specific neuron published a specific cyberlink at a known moment in time. The proof extends to the content: a CID is deterministic from the content, so a cyberlink included in a block fixes that the content of both particles already existed at the moment of publication — anyone who has the file computes its CID and checks it against the one recorded in the cyberlink. Since the account sequence runs without gaps, every transaction of the neuron can be read, so none of its cyberlinks stays hidden.

### Novelty

Cybergraph introduces no new cryptographic mechanisms. It assembles known ones — content addressing, signed logs, reification, signed statements — and adds one move: the *connection* itself becomes content-addressed, and with that a shared operand — the edge address is not negotiated but computed by one format (see the appendix). Below: where similar mechanics are already in use (and in Nostr — almost all at once), and what differs.

**Content addressing: IPFS/IPLD and Git.** "The name is the hash of the content" is the foundation of the whole construction (the CID), and it is not new. Git addresses commits, trees, and blobs by the hash of their content, forming a Merkle DAG; IPFS/IPLD generalizes this to an addressable graph of arbitrary data, on which Cybergraph technically stands. What is new here is not the addressing of objects but the addressing of the connections between them (see below).

**Signed logs without trust: Secure Scuttlebutt and Certificate Transparency.** The argument of "Fundamentals" — an account sequence without gaps makes a neuron's record provably complete — is a property of an append-only log. Secure Scuttlebutt [Tarr et al., 2019] gives every participant a signed log with sequence numbers: a gap is visible, a replica cannot be thinned out unnoticed — exactly as here. Certificate Transparency [RFC 6962] builds a public Merkle log of certificates that any auditor verifies without trusting the log's publisher; a falsely issued certificate is detected precisely because the log cannot be rewritten after the fact. Cybergraph inherits this property — verifiable completeness without trust in the data provider — but moves its carrier from each participant's separate log (SSB) and a centralized operator (CT) to blockchain consensus and transaction order.

**Signed events and the social graph: Nostr.** The closest living system. A Nostr event is `{id, pubkey, tags, content, sig}`, where `id` is the sha256 of the serialized event, and tags reference other events and keys; reactions and reposts build a social graph of signed references on top of this. Almost everything matches: a signature by a key, an address derived from content, edges between messages. The difference is in the status of the edge. In Nostr a tag is a reference *inside* an event, one author's metadata; the connection has no deterministic address of its own, shared by everyone — to target someone else's connection with a confirmation, a denial, or an argument, a separate convention would first have to define what counts as a connection and give it a computable name. In Cybergraph, a record carries nothing but the connection and the neuron, and `hash(A, B)` is a standalone address: the connection is addressable before and apart from whoever published it, so the recursion of conventions (confirm an edge, dispute a confirmation, bring an argument against an argument) is uniform. Nostr relays, moreover, provide no shared order; here the chain provides it.

**Reification and identity: RDF.** The device "make a statement an object in order to make statements about it" is RDF reification: a triple (subject, predicate, object) is represented as an `rdf:Statement` resource about which new triples can be made; RDF-star [W3C, 2021] makes the statement a term of the language itself. `same` directly mirrors `owl:sameAs`. The difference is in the origin of the reified connection's identity. In classical reification the statement's resource is named by an issued IRI: for two authors to speak about the same statement, they must negotiate the name. RDF-star removes this structurally — a quoted triple is identical by its components — but the components remain IRIs, issued names: the negotiation descends to their level, and the name is in no way tied to the content behind the IRI. In Cybergraph the components are CIDs: the edge address is *computed* — `hash(A, B)` — so it is one for everyone and cryptographically tied to the content of A and B. This is the single new move: content addressing applied to the edge.

**Signed statements and trust: PGP Web of Trust and Verifiable Credentials.** Authorship as a cyberlink (`hash("author", B) → P`) and the signature under every cyberlink belong to the family "make implicit trust explicit and verifiable". PGP Web of Trust [Zimmermann] replaces the central certificate authority with a network of mutual key–identity signatures; W3C Verifiable Credentials [W3C VC] standardizes a statement in which an issuer signs a declaration about a subject and a verifier checks the signature. Porting discussions from other mediums (the section "Authorship") is the same step that separates a VC from a bare From header: attribution turns from a string into a signed addressable statement. The difference is in the economy of primitives: the issuer/holder/subject roles and revocation registries of VC, like the trust layers of WoT, collapse here into cyberlinks plus `deny`, while a neuron's weight remains a read policy, not part of the protocol.

### Conventions

A published edge `A → B` has an address — `hash(A, B)`, the CID of A and B taken together; it can be referenced like any other CID.

This lets us form derived CIDs: once an edge is addressable, we can reference it, hash it together with other CIDs, and build structures that reference edges — and edges about edges.

We use this, in particular, to build, on top of the raw graph, instructions for processing it. An instruction is issued by placing a special CID — such as `hash("deny")` or `hash("quote", A)` — in the source of an ordinary edge. Since every such use is itself an addressable edge, every instruction can in turn be confirmed, denied, or quoted by the same conventions. This recursion makes the set of conventions open.

Building instructions from the graph's own elements is a kind of *homoiconicity* (a property familiar from programming languages where code and data share one representation). Here that representation is the CID: an instruction consists of the same CIDs and cyberlinks as the graph it processes, so a program that processes the graph lives inside it. And this holds at any scale: the whole cybergraph can at any moment be fixed as a file addressed by a CID computed over it.

A content address is derived from the content itself: the same content always yields the same CID. So the same content, whoever records it and whenever, is the same particle: the address is at once a reference and an identity; the identical is not stored twice. The graph does not separate these two properties — one act of recording gives both.

Cybergraph is a general-purpose data structure: fit for a wide range of tasks and not tied to a blockchain (see the format in "Fundamentals"); Bostrom's implementation is, on top of that, permissionless. Anyone holding a key pair can write to it, and anyone can read and process it in their own way: there is no gatekeeper here to decide who may write and what counts as valid. The blockchain checks only the technical correctness of a transaction — signature and order — not the meaning or the validity of what is recorded; cryptography provides the protection, control over one's own records stays with each neuron, and what is recorded is immutable. So the raw graph contains only CIDs and cyberlinks and carries no built-in meaning: meaning is produced at read time — an application follows conventions it chooses for itself.

And conventions need not be universal. Consumers of the graph come from different fields and invent mechanics for their own tasks; for a mechanic to work within a collective, the collective must agree on it. This is what collaborative work on information stands on: a shared immutable foundation — and freely chosen consensus mechanics on top of it, including dynamic ones.

The sections below give basic examples of such conventions — how to *encode* and how to *interpret* instructions for processing the cybergraph. (`hash()` is always the same operation: compute the CID of the string of arguments joined with commas; see the appendix.)

#### Confirming an edge

Simply repeat the edge.

Unlike deny/update/quote, confirmation requires no special CID in the source — confirmation is simply the same edge published again by another neuron, and it is exactly this repetition that aggregation counts (see "Measurable consensus").

#### Denying an edge and a cyberlink

```
A - CID
B - CID
neuron - the neuron of the disputed cyberlink

hash("deny") → hash(A, B)          # denying the edge
hash("deny") → hash(A, B, neuron)  # denying a specific cyberlink
```

Two targets of denial — two semantics:
- `hash(A, B)` — disputes the statement A → B itself: it is false no matter who published it
- `hash(A, B, neuron)` — disputes a specific cyberlink of a specific neuron: the record is invalid — for example, as spam — with no opinion about the statement itself

Unlike `update` and `quote`, which embed their operand into the source CID, `hash("deny")` is a fixed CID; what it points to is what is denied.

#### Updating a previously published edge

```
A - a CID from the original edge
B - the other CID from the original edge
C - a new CID replacing B

A → B                            # the original edge
A → C                            # auxiliary edge — C is reachable from A (optional)
hash("update", hash(A, B)) → C   # authoritative — marks C as an update of the edge
```

Updates issue anew from the same CID `hash("update", hash(A, B))`, so an update can itself be updated: the latest edge from this source is the current version. The source is the same for everyone, so anyone can publish an update; whose updates to accept — for example, only those of the original cyberlink's neuron — is decided by the read policy. And like any edge, the update edge is itself addressable — `hash("update", hash(A, B)) → C` can be confirmed or denied by another neuron.

#### Quotes

```
A - CID
B - CID, content(B) is a substring of content(A) (independently verifiable)

hash("quote", A) → B       # "B is a faithful excerpt from A"
```

Confirmation of a quote edge by another neuron states that the excerpt is faithful; `hash("deny") → hash(hash("quote", A), B)` disputes it as misleading out of context.

#### Agreement and disagreement with content

```
B - the CID of the content being evaluated

hash("agree") → B       # "claim B is true"
hash("disagree") → B    # "claim B is false"
```

Confirmation and deny evaluate edges: confirmation repeats an edge, deny disputes it. They do not apply to standalone content: a bare CID B has no edge to repeat or deny. With the agree/disagree pair, an opinion about content gets edges of its own — and from there they aggregate like any others: cyberlinks of different neurons with one edge add up into a support level (see "Measurable consensus").

Agree/disagree and deny are different axes. Agree/disagree speak about content: B is true or false. Deny of an edge speaks about the statement: A → B is false; deny of a cyberlink speaks about the record: a specific neuron's cyberlink is invalid. So disagreement with content is not expressed through deny of someone's agreement — otherwise "I disagree with B" and "this agreement is invalid" would become indistinguishable. The axes combine: `hash("deny") → hash(hash("agree"), B, neuron)` disputes a specific neuron's agreement — for example, as spam — expressing no opinion about B itself.

#### Argument for and against

```
C - any CID: content, an edge, or a cyberlink
B - the CID of the argument content

hash("pro", C) → B      # "B is an argument for C"
hash("con", C) → B      # "B is an argument against C"
```

Agree/disagree record a position, but in a live dispute the bulk of utterances is not "true/false" but *why*: an argument, evidence, a reference to a source. This is a relation between two pieces of content — "B supports C" — and it states the truth of neither B nor C: a neuron may consider an argument relevant to the matter while agreeing with neither the argument nor the statement. The operand C is any CID: arguments are brought both to content and to an edge or a cyberlink — for example, against someone's attribution.

The form repeats the logic of update: the operand is embedded in the source, so `hash("pro", C)` — the "for" side of C — is one address for all neurons. Knowing C, a reader computes one hash and reads the outgoing edges — that is the whole query; the level of argumentation is the out-degree. Symmetrically, `hash("con", C)` is the "against" side. (The alternative `hash("pro", B) → C` would direct the edges into the operand itself, but the query "all arguments for C" would then require parsing the source of every incoming edge.) And like any edge, an argument is itself addressable: it is repeated, disputed with deny, and agree/disagree apply to its content B — the dispute over an argument's quality is conducted by the same conventions.

#### Question and answer

```
B - any CID: content, an edge, or a cyberlink
Q - the CID of the question content
A - the CID of the answer content

hash("question", B) → Q                            # "Q is a question about B"
hash("answer", hash(hash("question", B), Q)) → A   # "A is an answer to question Q about B"
```

That Q is a question is visible from its content; there is no need to mark it with a separate edge. The convention carries what the content does not: the address — what is asked about. The operand B is any CID: content, an edge, or a cyberlink. `hash("question", B)` is one computable address for "questions about B": knowing B, a reader computes one hash and reads the outgoing edges — the open questions; a repetition of the edge by another neuron means "I have the same question". Agree/disagree do not apply to Q: the content of a question states nothing. A question edge — like any edge — is disputed with deny, for example as spam.

An answer attaches not to the bare Q but to the question-in-context — the address of the question edge (the same device as deny of a quote). Question texts are often not self-contained ("Is there a consensus on this?"), and one Q asked about different Bs would glue the answers into one shared node. The edge address contains no neuron, so one answer serves everyone who repeated the question. The answer itself is ordinary content: it is evaluated with agree/disagree, arguments are brought to it with pro/con, and the best answer is revealed by aggregation, not by appointment.

#### Authorship: porting from other mediums

The neuron of a cyberlink is the one who wrote the edge into the graph, and it need not be the author of the content. This distinction opens the graph to porting: discussions that lived in other mediums — Usenet threads, correspondence, forums — already have authors, dates, and reply edges, but their authorship rests on trust in servers and archives (a From header is a string, not a signature). Porting such a discussion, an archivist publishes the content and states the authorship with a separate edge:

```
P - the CID of the author's identifier (for example, hash("ast@cs.vu.nl"))
B - the CID of the ported content

hash("author", B) → P     # "the author of content B is P"
```

The subject is in the source, as with pro/con and question: reading B, a reader computes one hash and reads the outgoing edges — the attribution is recognized even if the author has not appeared in the graph before. Competing attributions issue from one address `hash("author", B)` and are visible side by side, like versions under update. (The mirror form `hash("author", P) → B` would answer "all works of P" with one hash, but the primary query is the reverse one, and it makes attribution from an unknown author uncomputable in advance.)

The signature under the cyberlink belongs to the archivist and certifies the act of porting, not the authorship itself: trust that was implicit in the original medium becomes an explicit addressable statement. From there it lives by the common rules: independent archivists who have checked their own copies of the source repeat the edge — the attribution gains measurable consensus; a mistaken attribution is disputed with deny. And the ported content is immediately open to all the conventions above: the claims of an old thread can be laid out with quote edges and signed with agree/disagree today — a dispute begun in another medium continues in the graph without loss of authorship. The worked example below uses the same device: "Thus have I heard" — Ananda signs the provenance of words not spoken by him.

#### Identity: another name for the same entity

```
P1, P2 - CIDs naming one entity

hash("same", P1) → P2     # "P1 and P2 are names of one entity"
```

One entity lives in the graph under many names: `hash("ast@cs.vu.nl")` and `hash("Andrew S. Tanenbaum")` are different CIDs, and attributions gathered under different names do not add up in aggregation. A same edge states identity (the analogue of owl:sameAs from the semantic web): the entity reads as a cluster — a connected component over same edges; which edges to accept into the cluster is decided by the read policy.

Identity is symmetric in meaning, but the edge is directed: the mirror edge is a different pair, and aggregation counts its support separately; whether to read connectivity ignoring direction, and whether to fold both directions into one statement, is decided by the read policy — as is the composition of the cluster. A false identity is disputed with deny. The operand is any CID, including a neuron: the edge `hash("same", hash("ast@cs.vu.nl")) → neuron`, published by that neuron itself, is the assertion "this is me", and ported authors (see above) connect with living participants of the graph, who confirm or dispute the assertion. One caveat: same acts at read time and does not override the format (see the appendix) — the name is baked into derived CIDs by the hash, and they are not recomputed after the fact.

### Collaborative work on information

Cyberlinks connect not only content but also neurons through content:

```
Alice states:    A → B
Bob confirms:    A → B
Carol denies:    hash("deny") → hash(A, B)
Dave quotes:     hash("quote", A) → B
```

The graph encodes not only "what is connected to what" but also "who believes what" — and this is open to querying and analysis.

#### Measurable consensus

For any statement `A → B`:
- Count the cyberlinks of different neurons with this edge → the support level
- Count the denial cyberlinks → the dispute level
- Weight the neurons by a read policy (for example, by reputation) → weighted consensus
- Track over time → the evolution of consensus

No central authority decides validity. Instead:
- Statements are made (cyberlinks are created)
- Others confirm or deny (new cyberlinks)
- Aggregation reveals the consensus
- Minority opinions stay visible (not censored, simply in the minority)

```
Consensus(statement) = f(confirms, denies, neuron_weights, time_decay)
```

The exact formula is a matter of read policy. Cybergraph provides the raw data.

A neuron's opinion also lives in time: one can confirm a statement and later deny it. A neuron's cyberlinks are ordered (see "Fundamentals"), so its current opinion is naturally read as the latest in time; earlier ones remain visible history. One's own cyberlink is revoked the same way: `hash("deny") → hash(A, B, neuron)`, where the neuron is the one revoking.

#### Changing scale: claim, file, corpus

A text file A need not be treated as a single whole. It can be decomposed into the basic claims it makes: each claim — a verbatim excerpt — is published as a separate file B and connected to the original with a quote edge `hash("quote", A) → B` (see "Quotes"). The decomposition is limited to the verbatim: anyone can verify a substring; a normalized paraphrase is built from the excerpt as a separate step and is not part of this convention. Now every claim has its own CID and is individually open to evaluative cyberlinks — agree and disagree (see "Agreement and disagreement with content").

As evaluations from different neurons accumulate, each claim builds up its own statistics, and file A as a whole receives their aggregate. And since a claim is addressed by content, its evaluations are not tied to file A: the author of another text can include an already evaluated claim in their file, and the evaluation statistics come with it automatically — the claim's CID is the same.

Across the whole set of files this opens analysis beyond counting confirmations: clustering related files, revealing central tendencies and outliers worth investigating, and detecting files that contradict each other or state the same thing in different words.

Together this gives work on information a change of scale: one can zoom in — from the corpus to a file, from the file to an individual claim — evaluate the detail and zoom back out, and the evaluations assemble into properties of the whole. The levels require no different mechanisms: claim, file, and corpus are addressed by CIDs, and the same conventions act at every scale (see "Conventions").

#### Agents over the graph: output as a reusable value

Heterogeneous agents acting together need explicit rules of interaction that each can verify without trusting the other. Cybergraph carries such rules as conventions in the data itself — no separate coordination layer is needed.

A neuron need not be a human. A contract or an LLM agent signs cyberlinks by the same conventions, and this changes the scale of collaborative work: different models can be set on one corpus, and the outputs each of them made can be recorded.

A recorded output is ordinary content with its own CID, so it is immediately open to all the conventions above: it is quoted (`quote`), evaluated (`agree`/`disagree`), given arguments (`pro`/`con`), disputed (`deny`). But more important, it becomes input for the next output: one model decomposed a text into claims, another connected them with arguments, a third checked them for consistency with the corpus — each step reads the results of the previous ones as ready building blocks rather than deriving them anew.

Both properties of the content address are at work here (see "Conventions"). LLM output is expensive — tokens, latency, nondeterminism. Recorded once, it is not recomputed again: recording the output puts its CID into an edge from the input, and that edge is a cache entry: the key is the input, the value is the output. And the cache is shared: the edge and the particle are visible to everyone — no one has to repeat someone else's work.

The difference from an ordinary computation cache is that the value is disputable. A build result in a system like Nix is also addressed by content and reused, but it cannot be disputed — it simply is. An output in the graph lives by the common rules: it is confirmed by repetition, disputed with `deny`, measured by consensus (see "Measurable consensus"). Thus a computation cache becomes shared knowledge — a unit that agents not only reuse but also check after one another.

Recording an output is an ordinary record: the output is published as a file and becomes a particle when its CID stands in an edge. Into the output's content the neuron can write provenance — the CIDs of the processed cyberlinks and of the particles in them, and a description of the computation performed. Provenance is part of the content, so the output's CID fixes its inputs. What to do with someone else's output is decided by the read policy: trust the neuron, measure consensus, or repeat the declared computation over the same inputs.

#### Information quality

The reference in written culture is not new. A book has it, but behind it there is neither verification nor an index: no way to confirm it, no way to gather all references to one source. The scientific journal added both — a reviewer responsible for verification, and a citation index — but expensively and slowly: review and publication are costly, and issues are bound to time. Cybergraph strengthens each of these capabilities and, on top of that, democratizes the very act of writing into the shared space.

Reuse happens at the level of an individual claim, not a file (see "Changing scale"). Verification becomes collective, measurable, and continuous, with a number of participants unreachable for manual review (see "Measurable consensus"). And a corpus stops being locked in its medium: discussions from letters, forums, and oral traditions are ported into the graph and verified in it anew (see "Authorship").

Together this opens reprocessing of the accumulated corpus. Say, one can quantitatively evaluate what Buddhism and Advaita have in common — where they call the same phenomenon by different names (`same`) and where they diverge — and do it without the bottleneck of a single expert: the evaluation builds up from many neurons. Once recorded, such knowledge stays addressable and therefore available for further processing; when new facts appear, the corpus is reprocessed from the start — now by agents (see "Agents over the graph"). Concepts turn out connected to quantitative metrics, and this raises discovery (finding relevant information): "the same thing said differently" is not computed by the graph as similarity but carried as a judgment — the same `same` edge; someone states the equivalence, and so, like any edge, it can be disputed (`deny`) and measured by consensus.

### A worked example: what did the Buddha actually say?

The Buddha wrote nothing. He taught for about forty-five years, died, and for four to four and a half centuries his words were passed on by communal recitation aloud — kept in memory, not in writing. There was no original manuscript against which a statement could be verified, and no central authority empowered to certify anything. The methods by which the tradition preserved and verified his words are the tradition's own conventions, built like those defined above. (What follows describes the structure the tradition records; whether every event happened exactly as told is a matter of dispute; the point is the form.)

**Authorship — "Thus have I heard" is a signed cyberlink.** Almost every discourse in the canon opens with the same words: *Evaṃ me sutaṃ*, "Thus have I heard". By tradition these are the words of Ananda — the Buddha's attendant, retelling what he personally heard. The formula does not claim authorship of the content; it certifies provenance: *I, this person, heard this from that source.*

```
neuron = Ananda
A = hash("heard from the Buddha")     # the source / the act of hearing
B = hash(teaching)                    # the discourse, addressed by content

Ananda:  A → B                        # "Thus have I heard"
```

The signature carries Ananda's identity; `content(B)` is the Buddha's words in his retelling. The opening formula of almost every discourse is the provenance edge plus the identity of the hearer: exactly the triple a cyberlink carries. The special CID `hash("heard from the Buddha")` is not in the list above — it is the tradition's own convention: the set of conventions is open (see "Conventions").

The content carries more than the edge. Every discourse opens not only with "Thus have I heard" but also with its setting. One example: *"On one occasion the Blessed One was dwelling near Sāvatthī, in Jeta's Grove"*. The setting names the place, the audience, and the occasion. Together these are the conditions under which the words were heard; the setting is part of content(B) and is recorded in Ananda's words, not the Buddha's. Ananda's standing is recorded too. He is remembered as the foremost of those who had heard much. A reader who knew none of this could still read these dimensions out of the account itself and weigh it accordingly.

The depth of a plain "P said B" comes not from one edge but from who signed it, when it was done, and what the corpus already says about that neuron. Cybergraph exposes the same for any neuron. Its declaration is the signed cyberlink itself. The context at the moment of the act is the neuron's earlier cyberlinks. They run without gaps by account sequence, so the record is provably complete: no cyberlink hides between two of its transactions (see "Fundamentals"). And others have made their own cyberlinks about the neuron.

**No central authority — the Buddha's own convention for verification.** Foreseeing his death, the Buddha left a procedure for verifying any teaching later attributed to him — the *Mahāpadesa*, the "Four Great References" (DN 16; AN 4.180). On receiving the statement "I heard this from the Buddha", one should

> "neither approve nor reject" it on the ground of who says it; instead, "having carefully memorized those words and phrases, you should check whether they fit in the discourses (suttas) and are manifested in the discipline (vinaya). If they do not fit... you should reject them". — AN 4.180

Validity is decided by consistency with the existing corpus (the Sutta and the Vinaya — the established graph), not by the authority of the one making the statement. Even "I heard this face to face from the Buddha" is verified the same way. This is validity-through-consistency — a read policy different from the reputation-weighted vote counting above, and robust to it: a statement with many confirmations still fails if it contradicts the corpus. There is no new mechanism here — the verification reads the existing corpus, and the procedure itself is one more convention of the same kind, whose defining teaching is published into the graph as an ordinary cyberlink.

The *Kālāma Sutta* (AN 3.65) states the principle directly: do not go by oral tradition, by lineage, by hearsay, by scripture, by the seeming competence of the speaker, or by "the teacher is ours" — *know for yourselves.* Here the standing of the one making the statement is excluded from validity entirely — results decide, not the speaker.

The canon, then, is a graph of provenance cyberlinks governed by a convention of confirmation and denial that the Buddha himself published into the graph. Cybergraph is the same design with cryptographic signatures and content addressing — so "what did the Buddha actually say" becomes queryable and cross-checkable against the corpus, rather than a matter of faith.

Preservation is a concern separate from verification. The chain stores only CIDs; the files themselves live outside it, and any verification — of a quote, of consistency with the corpus — reads content. The canon survived until writing not by verification but by replication: for four centuries communal recitation kept the text in thousands of memories. In Cybergraph this role is played by content storage (pinning): a cyberlink is indestructible, but it is meaningful only as long as someone stores the files it points to.

And the dimensions for reading a neuron are open in the same way the conventions above are open: statements about its experience, references to external services and metrics imported from them — each is itself a cyberlink that specialized neurons can recheck, confirm, or deny. Dimensions grow through conventions, not through a new mechanism.

### Applications

| Domain | Application |
|--------|-------------|
| **Science** | A paper's claims as particles; replication = agree; failed replication = disagree |
| **Journalism** | Source verification; several reporters confirming one fact |
| **Law** | Contract terms; witness testimony; chains of evidence |
| **Standards** | Technical specifications; community agreement on conventions |
| **Education** | Knowledge testing; review of explanations |
| **AI alignment** | AI agents interact through cyberlinks; measurable preference aggregation |
| **Supply chains** | Statements about a product; certification; audit logs |

Twelve conventions on one primitive — edge confirmation, deny, update, quote, agree, disagree, pro, con, question, answer, author, same — are enough to express complex collaborative workflows. Since both humans and contracts can be neurons, the same conventions apply to AI-agent interactions without additional infrastructure.

### Reading instructions

A CID is opaque: looking at an edge `X → Y`, one cannot see that X is, say, `hash("update", hash(A, B))`. A reader can recognize instructions in two ways. The first is to compute candidates in advance: compute the derived CIDs of everything already seen — edges and cyberlinks — and check the sources and targets of new edges against them. The second is to dereference the source as content; it works only if the preimage of the derived CID — the string `"update,Qm…"` itself — is published as a file. So, when issuing an instruction, publish the preimages of its derived CIDs as well. An edge whose parts do not parse by these rules is not an instruction but an ordinary edge: the content `"deny"` exists outside the convention too.

Both ways reflect the current stage of development of the cybergraph and applications and for now remain theory. What matters is that the cybergraph already provides verifiable proof of publication (see "Fundamentals"). Extensions may be used to help indexing — for example, a list of all raw CIDs that went into the derived CIDs at the ends of an edge, written into the transaction memo (today memo is functionally unused); the list eases recognition, while the instruction is still carried by the edge itself.

`hash("convention") → hash("deny")` — a convention declaration: the convention's special CID is published into the graph by an edge from a shared root, and the convention's description is ordinary content, connected to the same special CID by another edge. Knowing the root, a reader computes one hash and reads the outgoing edges — the list of declared conventions; neither way above yields such a list. The first to document declaring conventions in the graph was @snedashkovsky — from the semantic convention root (see "Acknowledgement"). The root neither closes the set nor appoints a registry: a declaration is a convention like any other, and whoever needs their own list picks their own root and interprets it their own way. And like any edge, a declaration is confirmed by repetition and disputed with deny.

### Appendix: Cybergraph format

A CID is always CID v0: the content is wrapped into a standard IPFS block (UnixFS dag-pb), hashed with sha2-256, and the hash is encoded in base58 — the result is a string of the form Qm…. The same result is produced by `ipfs add --cid-version=0`.

A neuron is the CID of its public key. Here the format deliberately diverges from Bostrom, where a neuron is recorded as a `bostrom1…` address (see "Fundamentals"): the format takes the key's CID so that a neuron is addressable like any other CID. There must be one encoding of the neuron: if one neuron can be written in different ways (as an address, as a bare key), the same act gets different derived CIDs of the cyberlink. Addressing of the act breaks: deny of a cyberlink, revoking one's own cyberlink, disputing a specific neuron's agreement — edges computed from different encodings of the neuron target different CIDs, and their repetitions do not match in aggregation. Weighting suffers too: one neuron under two encodings reads as two. The address is a hash of the key, and the key cannot be computed back; for conversion the key is taken from the transaction carrying the cyberlink — the transaction publishes the neuron's key next to the signature — and its CID is computed; without this step a Bostrom cyberlink's derived CID cannot be computed.

`hash(x, y, …)` is always the CID of the string of arguments joined with commas; the result is a derived CID. Two special cases: the edge address — `hash(cid_from, cid_to)`; the cyberlink's derived CID — `hash(cid_from, cid_to, neuron)`.
