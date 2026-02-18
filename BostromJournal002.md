# Draft

# Methods of publishing information into cybergraph

Cybergraph is a uniform data structure where content and conventions for processing that content are both expressed as cyberlinks. The set of conventions is open-ended. When implemented on blockchain, cybergraph inherits its properties: immutability, cryptographic authorship, and deterministic ordering.

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

Four conventions on one primitive — confirm, deny, update, quote — are sufficient to express complex collaborative workflows. Since neurons can be both humans and contracts (progs), the same conventions apply to AI agent interactions without any additional infrastructure.

## Collective decision making

Instead of discrete votes:
- Proposals are statements (cyberlinks)
- Support/opposition accumulates continuously
- Consensus emerges from the graph
- Minority positions remain on record

```
Consensus(statement) = f(confirms, denies, neuron_weights, time_decay)
```

The exact formula is a policy choice. The cybergraph provides the raw data.
