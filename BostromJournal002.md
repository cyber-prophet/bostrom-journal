# Methods of publishing information into Cybergraph

Cybergraph is a new phenomenon. It's hard to predict which way of writing information to Cybergraph is the most convenient or effective. In this journal, I simply imagine and reflect on possible ways.

## Aknowledgment

One of the first (if not the first) authors to publish ideas on this topic was @snedashkovsky in [semantic conventions](https://github.com/Snedashkovsky/cyber-semantic-conventions).

## Confirmation of a cyberlink validity

Just create the same cyberlink

## Denial of a cyberlink validity

A - a cid of a document
B - a cid of a document
A.B - a cid of cids A.B
D - a cid of the word 'deny'

Ways it can be cyberlinked

A.B -> A
A.B -> B
D -> A.B

## Excerpts

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
