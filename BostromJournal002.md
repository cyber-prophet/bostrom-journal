# Bostrom Journal

## Issue 2: Methods of publishing information into cybergraph

Cybergraph is a uniform data structure where content and conventions for processing that content are both expressed as cyberlinks. The set of conventions is open-ended. When implemented on blockchain, cybergraph inherits its properties: immutability, cryptographic authorship, and deterministic ordering.

A *particle* is an IPFS content hash. A *cyberlink* is a directed edge `A → B` between two particles, authored by a *neuron* — a private key holder or an autonomous contract.

### Acknowledgment

One of the first (if not the first) authors to publish ideas on this topic was @snedashkovsky in [semantic conventions](https://github.com/Snedashkovsky/cyber-semantic-conventions).

### Fundamentals

On Bostrom blockchain, each cyberlink is recorded with the following fields:

- particle_from
- particle_to
- neuron

Additionally, because cybergraph is written into a Cosmos SDK-based blockchain, we can retrieve the following fields from raw transactions:

- height
- timestamp
- account sequence
- tx hash
- tx messages
- tx memo
- signatures of validators

This makes it possible to prove, with cryptographic verification independent of the blockchain, that a neuron published specific information to cybergraph. And because each of a neuron's transactions carries a strictly incrementing account sequence with no gaps, one can also prove it published nothing else between two of its own transactions.

### Conventions for applications that process cybergraphs

Each convention below is itself a cyberlink — most place a verb particle such as `hash("deny")` or `hash("quote", A)` at the source of an ordinary edge. Because the resulting relationship `hash(...)` is itself a particle, and therefore addressable, each *use* of a convention can in turn be confirmed, denied, or quoted by the same conventions. That is what keeps the set open-ended.

#### Confirmation of a cyberlink's validity

Just create the same cyberlink.

Unlike deny/update/quote, confirmation needs no verb particle — agreement is just the same edge re-created by another neuron, and the repetition itself is what aggregation counts (see Quantifiable consensus).

#### Update to a previously published cyberlink

```
A - a particle from the original cyberlink
B - another particle from the original cyberlink
R = hash(A, B) - the relationship (in general, hash(from, to) — this is what makes a cyberlink addressable)

C - the new particle for the updated cyberlink

A → B                       # original cyberlink
A → C                       # convenience edge — C reachable from A (optional, derived)
hash("update", R) → C      # authoritative — marks C as the update of R
```

#### Denial of a cyberlink's validity

```
A - a particle
B - a particle

hash("deny") → hash(A, B)                  # denial of the relationship
hash("deny") → hash(A, B, neuron, height)  # denial of a specific cyberlink
```

Two targets of denial:
- `hash(A, B)` — disputes any cyberlink between A and B, regardless of which neuron created it
- `hash(A, B, neuron, height)` — disputes a specific cyberlink by a specific neuron at a specific height

Unlike `update` and `quote`, which bind their operand into the source verb particle, `hash("deny")` is a fixed verb particle — what is denied is whatever it points at.

#### Quotes

```
A - a particle
B - a particle, substring of content(A) (independently verifiable)

hash("quote", A) → B       # "B is an excerpt of A"

R = hash(hash("quote", A), B)  # the relationship is addressable, so others can:
                                # confirm (same hash("quote", A) → B from another neuron) — "this quote is fair"
                                # deny (hash("deny") → R) — "this quote is misleading out of context"
```

### Collaborating on information

Cyberlinks connect not just content but neurons through content:

```
Alice asserts:  A → B
Bob confirms:   A → B
Carol denies:   hash("deny") → R    (where R = hash(A, B))
Dave quotes:    hash("quote", A) → B
```

The graph encodes not just "what is linked" but "who believes what" — and that's queryable and analyzable.

#### Quantifiable consensus

For any statement `A → B`:
- Count matching cyberlinks from distinct neurons → support level
- Count deny cyberlinks → dispute level
- Weight by neuron reputation → weighted consensus
- Track over time → consensus evolution

No central authority decides validity. Instead:
- Claims are made (cyberlinks created)
- Others confirm or deny (more cyberlinks)
- Aggregation reveals consensus
- Minority views remain visible (not censored, just outnumbered)

```
Consensus(statement) = f(confirms, denies, neuron_weights, time_decay)
```

The exact formula is a policy choice. The cybergraph provides the raw data.

#### Compound properties of cyberlinked particles

A particle need not be treated as a single unit. It can be decomposed into the basic claims it makes, and each claim verified separately by collectives of independent neurons.

Over the full set of particles, this enables analysis beyond counting confirmations: clustering related particles, identifying the central tendencies and the outliers worth researching, and detecting particles that contradict one another or assert the same claim in different words.

#### A worked example: what did the Buddha actually say?

The Buddha wrote nothing. He taught for some forty-five years, died, and for four to four-and-a-half centuries his words were carried by communal recitation — held in memory, not written. There was no original manuscript to check a claim against, and no central authority empowered to certify one. The methods the tradition used to preserve and verify his words are the conventions defined above. (What follows describes the structure the tradition records; whether each event happened exactly as told is debated — the point is the shape.)

**Authorship — "Thus have I heard" is a signed cyberlink.** Nearly every discourse in the canon opens with the same words: *Evaṃ me sutaṃ*, "Thus have I heard." By tradition these are Ananda's words — the Buddha's attendant, reciting what he personally heard. The formula does not claim authorship of the content; it attests provenance: *I, this identity, heard this from that source.*

```
neuron = Ananda
A = hash("heard from the Buddha")     # the source / the act of hearing
B = hash(teaching)                    # the discourse, content-addressed

Ananda:  A → B                        # "Thus have I heard"
```

The signature carries Ananda's identity; `content(B)` remains the Buddha's word. The opening formula of nearly every discourse is a provenance edge — exactly what a signed cyberlink is.

The edge carries more than identity. Each discourse opens not only with "Thus have I heard" but with its setting — *"at one time the Blessed One was dwelling near Sāvatthī, in Jeta's Grove"* — naming place, audience, and occasion: the conditions under which the words were heard. Ananda's standing is on record too, remembered as the one foremost in what he had heard. A reader who knew none of this could still read these dimensions off the account and weigh it accordingly. That is what gives a bare "A said B" its depth — not the edge alone, but who signed it, under what recorded conditions, and what the corpus already says about that signer. Cybergraph exposes the same for any neuron: the act's own declaration (its transaction memo), the particles in context when it acted (prior cyberlinks, gap-free by account sequence — see *Fundamentals*), and whatever cyberlinks others have made about it.

**No central authority — the Buddha's own verification convention.** Anticipating his death, the Buddha left a procedure for testing any teaching later attributed to him — the *Mahāpadesa*, "Four Great References" (DN 16; AN 4.180). Given a claim "I heard this from the Buddha," one is to

> "neither approve nor reject" it on the strength of who says it; instead, "having carefully memorized those words and phrases, you should make sure they fit in the discourse and are exhibited in the training. If they do not fit ... you should discard it." — AN 4.180

Validity is decided by consistency with the existing corpus (the Sutta and the Vinaya — the established graph), not by the authority of the claimant. Even "I heard it face to face from the Buddha" is checked the same way. This is validity-by-consistency — a different mechanism from the reputation-weighted head-count above, and notably resistant to it: a claim with many confirmations still fails if it contradicts the corpus. And it is itself a convention the Buddha published into the system, just as each convention above is itself a cyberlink.

The *Kālāma Sutta* (AN 3.65) states the principle directly: do not go by oral tradition, by lineage, by hearsay, by scripture, by the seeming competence of a speaker, or by "the teacher is ours" — *know for yourselves.* Here the claimant's standing is excluded from validity entirely — the results, not the speaker, decide.

The canon, then, is a graph of signed provenance edges, governed by a convention for confirming or denying them that the Buddha published into the graph itself. Cybergraph is the same arrangement with cryptographic signatures and content addressing — so that "what the Buddha actually said" becomes queryable and cross-validated against the corpus rather than an article of faith.

And the dimensions for reading a neuron are open-ended in the same way the conventions above are: claims about its experience, links to outside services and the metrics imported from them — each itself a cyberlink that specialized neurons can recheck, confirm, or deny. The dimensions grow by convention, not by new machinery.

#### Applications

| Domain | Application |
|--------|-------------|
| **Science** | Paper claims as cyberlinks; replication = confirm; failed replication = deny |
| **Journalism** | Source verification; multiple reporters confirming same fact |
| **Legal** | Contract terms; witness statements; evidence chains |
| **Standards** | Technical specs; community agreement on conventions |
| **Education** | Knowledge validation; peer review of explanations |
| **AI Alignment** | AI agents interact via cyberlinks; quantifiable preference aggregation |
| **Supply Chain** | Product claims; certification; audit trails |

Four conventions on one primitive — confirm, deny, update, quote — are sufficient to express complex collaborative workflows. Since neurons can be both humans and contracts, the same conventions apply to AI agent interactions without any additional infrastructure.

