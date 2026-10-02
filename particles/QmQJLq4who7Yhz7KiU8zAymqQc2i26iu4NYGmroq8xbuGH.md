---
parent: QmX2Qy9V2NYNoeUKXP5c5xRoPEfRvbBwv5kL5q3r4EPpLR
---

# Argument for and against

```
X - any CID: content, an edge, or a cyberlink
B - the CID of the argument content

{"about":X,"op":"pro"} → B      # "B is an argument for X"
{"about":X,"op":"con"} → B      # "B is an argument against X"
```

The `agree_particle`/`disagree_particle` pair records a position, but in a live dispute the bulk of utterances is not "true/false" but *why*: an argument, evidence, a reference to a source. An argument is the relation "B supports X", and it states the truth of neither B nor X: a signer may consider an argument relevant to the matter while agreeing with neither the argument nor the statement. The operand X is any CID: arguments are brought both to content and to an edge or a cyberlink — for example, against someone's attribution.

The form is the same as with `update_edge`: the operand is in the `about` of the source, so `{"about":X,"op":"pro"}` — the "for" side of X — is one address for all signers. Knowing X, a reader computes one hash and reads the outgoing edges — that is the whole query; the level of argumentation is the out-degree. Symmetrically, `{"about":X,"op":"con"}` is the "against" side. (The alternative `{"about":B,"op":"pro"} → X` would direct the edges into the operand itself, but the query "all arguments for X" would then require parsing the source of every incoming edge.) And like any edge, an argument is itself addressable: it is repeated, disputed with `deny_edge`, and `agree_particle`/`disagree_particle` apply to the content B — the dispute over an argument's quality is conducted by the same conventions.
