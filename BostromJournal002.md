# Draft

# Methods of publishing information into Cybergraph

Cybergraph is a new phenomenon. It's hard to predict which way of writing information to Cybergraph is the most convenient or effective. In this journal, I simply imagine and reflect on possible ways.

## Acknowledgment

One of the first (if not the first) authors to publish ideas on this topic was @snedashkovsky in [semantic conventions](https://github.com/Snedashkovsky/cyber-semantic-conventions).

## Fundamentals

Technically, Cybergraph is a data structure written in Blockchain with the following fields:

- particle_from
- particle_to
- neuron

As of now, there are direct API methods in `go-cyber 0.7.1` to interact with those three fields, which do not involve parsing transactions. Namely, (`cyber query rank search`, `cyber query rank backlinks`, `cyber query rank is-exist`).

Additionally, because Cybergraph is written into a Cosmos SDK-based blockchain, we can retrieve the following fields as a part of raw tranactions:

- height
- timestamp
- account sequence
- tx hash
- tx messages
- tx memo
- signatures of validators

This enables the comparatively easy technical ability to have proofs of publishing information to Cybergraph from a neuron (and even to have proofs that a neuron didn't publish any other information to Cybergraph at a specific moment in time), which can be cryptographically verified on its own without interaction with the blockchain.

## Types of instructions for applications that process cybergraphs

### Confirmation of a cyberlink's validity

Just create the same cyberlink.

### Update to a previously published cyberlink

```
A - a cid of a document from an original cyberlink
B - a cid of another document from the original cyberlink
R = hash(A, B) - the relationship

C - the new document for the updated cyberlink

A → B                       # original cyberlink
A → C                       # updated version of the original cyberlink
hash("update", R) → C      # instruction to update the relationship
```

Who can update the previous cyberlink?
// it should do the contract

The author.

### Denial of a cyberlink's validity

```
A - a cid of a document
B - a cid of a document

hash("deny") → hash(A, B)  # denial of the relationship
hash("deny") → hash(row)   # denial of a specific cyberlink
```

Two targets of denial:
- `hash(A, B)` — disputes any cyberlink between A and B, regardless of which neuron created it
- `hash(row)` — disputes a specific cyberlink by a specific neuron at a specific height

### Quotes

```
A - a cid of a document
B - a cid of a substring of document A (verifiable: content(B) ⊂ content(A))

hash("quote", A) → B       # "B is an excerpt of A"

R = hash(hash("quote", A), B)  # the relationship is addressable, so others can:
                                # confirm (same hash("quote", A) → B from another signer) — "this quote is fair"
                                # deny (hash("deny") → R) — "this quote is misleading out of context"
```

# Collaborating on information

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
- Count matching links from distinct neurons → support level
- Count deny links → dispute level
- Weight by neuron reputation → weighted consensus
- Track over time → consensus evolution

No central authority decides validity. Instead:
- Claims are made (cyberlinks created)
- Others confirm or deny (more cyberlinks)
- Aggregation reveals consensus
- Minority views remain visible (not censored, just outnumbered)

### Reputation

Neurons who consistently make links that others confirm gain implicit reputation. Neurons whose claims are frequently denied lose credibility. All traceable, all verifiable.

### Applications

| Domain | Application |
|--------|-------------|
| **Science** | Paper claims as cyberlinks; replication = confirm; failed replication = deny |
| **Journalism** | Source verification; multiple reporters confirming same fact |
| **Legal** | Contract terms; witness statements; evidence chains |
| **Standards** | Technical specs; community agreement on conventions |
| **Education** | Knowledge validation; peer review of explanations |
| **AI Alignment** | Human feedback as cyberlinks; quantifiable preference aggregation |
| **Supply Chain** | Product claims; certification; audit trails |

# Collective decision making

Instead of discrete votes:
- Proposals are statements (cyberlinks)
- Support/opposition accumulates continuously
- Consensus emerges from the graph
- Minority positions remain on record

```
Consensus(statement) = f(confirms, denies, neuron_weights, time_decay)
```

The exact formula is a policy choice. The cybergraph provides the raw data.
