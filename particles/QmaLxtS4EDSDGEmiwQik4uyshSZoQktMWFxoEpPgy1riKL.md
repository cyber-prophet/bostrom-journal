---
parent: QmdQJDHNirYT7NMv7uCej8ha3X3eCmsZa86LVF8QprDRUS
---

# Argument for and against

```
X - any CID: content, an edge, or a cyberlink
B - the CID of the argument content

{"about":X,"op":"pro"} → B      # "B is an argument for X"
{"about":X,"op":"con"} → B      # "B is an argument against X"
```

The `agree_particle`/`disagree_particle` pair records a position.
But in a live dispute, most of what the participants say is not "true/false" but *why*:
an argument, evidence, a reference to a source.
An argument is the relation "B supports X",
and it states neither that B is true nor that X is true.
A signer can think that an argument is relevant to the matter
and agree with neither the argument nor the statement.
The operand X is any CID.
Signers bring arguments to content, and also to an edge or a cyberlink
— for example, against an attribution that someone else made.

The form is the same as with `update_edge`:
the operand is in the `about` of the source.
So `{"about":X,"op":"pro"}` — the "for" side of X — is one address for all signers.
From X, a reader computes one hash and reads the outgoing edges
— that is the whole query;
the out-degree is the level of argumentation.
In the same way, `{"about":X,"op":"con"}` is the "against" side.
(The alternative `{"about":B,"op":"pro"} → X` would point the edges into the operand itself.
But the query "all arguments for X" would have to parse the source of each incoming edge.)
Like all edges, an argument is itself addressable.
Signers repeat it, deny it with `deny_edge`,
and apply `agree_particle`/`disagree_particle` to the content B
— the dispute about argument quality uses the same conventions.
