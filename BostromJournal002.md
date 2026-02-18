```nu
{
    h1: 'Methods of publishing information into Cybergraph'
    h2: 'with examples by @cyber-prophet'
    nu_version: (version)
    timestamp: (date now)
    version: 0
    soul: {
        authors: ['@cyber-prophet aka @nushell-prophet']
        keys: []
        address: [
            {
                github: {
                    url: 'https://github.com/cyber-prophet/bostrom-journal/'
                    revision: (git log | lines | first 10 | to md)
                }
            }
        ]

    }
    cybergraph: {
        signers: []
    }
} 
 ```

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

As of now, there are direct API methods in `go-cyber 0.3.1` to interact with those three fields, which do not involve parsing transactions. Namely, (`cyber query rank search`, `cyber query rank backlinks`, `cyber query rank is-exist`).

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
A.B - a cid of cids A.B

C - the new document for the updated cyberlink

U - a cid of the word 'update'

A -> B          # original cyberlink
A.B -> A        # service cyberlink to make it discoverable from the original cyberlinks
A.B -> B        # --//--
A -> C          # updated version of the original cyberlink
U.A.B -> A.C    # cyberlink for instruction to update cyberlink
U.A.B -> A.B    # meta cyberlink to make it discoverable from the original cyberlinks
# or?
A.B -> U.A.B    # meta cyberlink to make it discoverable from the original cyberlinks
U -> U.A.B      # this is a classifier, how to read that cyberlink
```

Who can update the previous cyberlink?
// it should do the contract

The author.

### Denial of a cyberlink's validity

```
A - a cid of a document
B - a cid of a document
A.B - a cid of cids A.B
D - a cid of the word 'deny'

Ways it can be cyberlinked

A.B -> A
A.B -> B
D -> A.B
```

### Quotes

```
A - a cid of a document
B - a cid of a substring of document A (verifiable: content(B) ⊂ content(A))
Q - a cid of the word 'quote'
Q.A - a cid of cids Q.A

Q.A -> B        # "B is an excerpt of A"

R = Q.A.B       # the relationship is addressable, so others can:
                # confirm (same Q.A -> B from another signer) — "this quote is fair"
                # deny (D -> R) — "this quote is misleading out of context"
```

# Collaborating on information

# Collective decision making

```nu
```
