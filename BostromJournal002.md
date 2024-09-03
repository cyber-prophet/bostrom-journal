# Methods of publishing information into Cybergraph

## Confirmation of cyberlink validity

Just create the same cyberlink

## Denial of cyberlink validity

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