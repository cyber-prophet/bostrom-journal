# Draft

# Methods of publishing information into cybergraph

Cybergraph is a uniform data structure where content and conventions for processing that content are both expressed as cyberlinks. The set of conventions is open-ended. When implemented on blockchain, cybergraph inherits its properties: immutability, cryptographic authorship, and deterministic ordering.

A *particle* is an IPFS content hash. A *cyberlink* is a directed edge `A → B` between two particles, authored by a *neuron* — a private key holder or an autonomous contract.

## Acknowledgment

One of the first (if not the first) authors to publish ideas on this topic was @snedashkovsky in [semantic conventions](https://github.com/Snedashkovsky/cyber-semantic-conventions).

## Fundamentals

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

This makes it possible to prove that a neuron published specific information to cybergraph — or that it published nothing else at a given moment — with cryptographic verification independent of the blockchain.

## Conventions for applications that process cybergraphs

Each convention below is itself expressed as a cyberlink. That is what keeps the set open-ended — and what lets conventions themselves be confirmed, denied, or quoted by the same primitives.

### Confirmation of a cyberlink's validity

Just create the same cyberlink.

### Update to a previously published cyberlink

```
A - a particle from the original cyberlink
B - another particle from the original cyberlink
R = hash(A, B) - the relationship

C - the new particle for the updated cyberlink

A → B                       # original cyberlink
A → C                       # updated version of the original cyberlink
hash("update", R) → C      # instruction to update the relationship
```

### Denial of a cyberlink's validity

```
A - a particle
B - a particle

hash("deny") → hash(A, B)  # denial of the relationship
hash("deny") → hash(row)   # denial of a specific cyberlink
```

Two targets of denial:
- `hash(A, B)` — disputes any cyberlink between A and B, regardless of which neuron created it
- `hash(row)` — disputes a specific cyberlink by a specific neuron at a specific height

### Quotes

```
A - a particle
B - a particle, substring of content(A) (verifiable: content(B) ⊂ content(A))

hash("quote", A) → B       # "B is an excerpt of A"

R = hash(hash("quote", A), B)  # the relationship is addressable, so others can:
                                # confirm (same hash("quote", A) → B from another neuron) — "this quote is fair"
                                # deny (hash("deny") → R) — "this quote is misleading out of context"
```

## Collaborating on information

Cyberlinks connect not just content but neurons through content:

```
Alice asserts:  A → B
Bob confirms:   A → B
Carol denies:   hash("deny") → R    (where R = hash(A, B))
Dave quotes:    hash("quote", A) → B (B is substring of A)
```

The graph encodes not just "what is linked" but "who believes what" — and that's queryable and analyzable.

### Quantifiable consensus

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

### A worked example: what did the Buddha actually say?

The Buddha wrote nothing. He taught for some forty-five years, died, and for roughly four centuries his words were carried only in memory — recited, not written. There was no original manuscript to check a claim against, and no central authority empowered to certify one. The methods the tradition used to preserve and verify his words are the conventions defined above. (What follows describes the structure the tradition records; whether each event happened exactly as told is debated — the point is the shape.)

**Authorship — "Thus have I heard" is a signed cyberlink.** Nearly every discourse in the canon opens with the same words: *Evaṃ me sutaṃ*, "Thus have I heard." By tradition these are Ananda's words — the Buddha's attendant, reciting what he personally heard. The formula does not claim authorship of the content; it attests provenance: *I, this identity, heard this from that source.*

```
neuron = Ananda
A = hash("heard from the Buddha")     # the source / the act of hearing
B = hash(teaching)                    # the discourse, content-addressed

Ananda:  A → B                        # "Thus have I heard"
```

The signature carries Ananda's identity; `content(B)` remains the Buddha's word. The opening line of the entire canon is a provenance edge — exactly what a signed cyberlink is.

**No central authority — the Buddha's own verification convention.** Anticipating his death, the Buddha left a procedure for testing any teaching later attributed to him — the *Mahāpadesa*, "Four Great References" (DN 16; AN 4.180). Given a claim "I heard this from the Buddha," one is to

> "neither approve nor reject" it on the strength of who says it; instead, "having carefully memorized those words and phrases, you should make sure they fit in the discourse and are exhibited in the training. If they do not fit ... you should discard it." — AN 4.180

Validity is decided by consistency with the existing corpus (the Sutta and the Vinaya — the established graph), not by the authority of the claimant. Even "I heard it face to face from the Buddha" is checked the same way. This is `confirm`/`deny` adjudicated by consistency — and it is itself a convention the Buddha published into the system, just as each convention above is itself a cyberlink.

The *Kālāma Sutta* (AN 3.65) states the principle directly: do not go by oral tradition, by lineage, by hearsay, by scripture, by the seeming competence of a speaker, or by "the teacher is ours" — *know for yourselves.* Authority and reputation are an input to the weighting, never the arbiter.

The canon, then, is a graph of signed provenance edges, governed by a convention for confirming or denying them that the Buddha published into the graph itself. Cybergraph is the same arrangement with cryptographic signatures and content addressing — so that "what the Buddha actually said" becomes a queryable, cross-validated consensus rather than an article of faith.

### Applications

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

