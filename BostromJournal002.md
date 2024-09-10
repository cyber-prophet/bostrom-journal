# Methods of publishing information into Cybergraph

Cybergraph is a new phenomenon. It's hard to predict which way of writing information to Cybergraph is the most convenient or effective. In this journal, I simply imagine and reflect on possible ways.

## Aknowledgment

One of the first (if not the first) authors to publish ideas on this topic was @snedashkovsky in [semantic conventions](https://github.com/Snedashkovsky/cyber-semantic-conventions).

## Fundamentals

Technically Cybergraph is a data structure written in Blockchain with the next fields:

- particle_from
- particle_to
- neuron
- height

And because it is written into cosmos-sdk based blockchain, we can retrieve the following fields:

- tx hash
- tx messages
- tx memo
- date time
- account sequence
- signatures of validators

## Confirmation of a cyberlink validity

Just create the same cyberlink

## Update to previosly published cyberlink

```
A - a cid of a document from original cyberlink
B - a cid of another document from original cyberlink
A.B - a cid of cids A.B

C - the new document for updated cyberlink

U - a cid of the word 'update'

A -> B          # original cyberlink
A.B -> A        # service cyberlink to make it discoverable from the original cyberlinks
A.B -> B        # --//--
A -> C          # updated version of the original cyberlink
U.A.B -> A.C    # cyberlink for instruction to update cyberlink
U.A.B -> A.B    # meta cyberlink to make it discoverable from the original cyberlinks
# or?
A.B -> U.A.B    # meta cyberlink to make it discoverable from the original cyberlinks
U -> U.A.B      # this is classificator, how to read that cyberlink

```

## Denial of a cyberlink validity

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

## Excerpts

```
A - a cid of a document
B - a cid of an excerpt from the document A
B.A - a cid of cids B.A
E - a cid of the word 'excerpt'

Ways it can be cyberlinked

B -> A
B.A -> A
B.A -> B
E -> B.A

Document B might be a yaml file of a structre
"
text: some text
parent_cid: A
type: excerpt
"
```
