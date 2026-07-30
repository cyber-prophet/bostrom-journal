---
parent: QmRNZNB4gKuVQ7eX7axZZiwxuzw1eV9UcjRjRyJZ8odHkT
---

# Argument for and against

```
C - any CID: a file, an edge, or a cyberlink
B - the CID of the argument file

hash("pro", C) → B      # "B is an argument for C"
hash("con", C) → B      # "B is an argument against C"
```

The `agree`/`disagree` pair records a position, but in a live dispute the bulk of utterances is not "true/false" but *why*: an argument, evidence, a reference to a source. An argument is the relation "B supports C", and it states the truth of neither B nor C: a signer may consider an argument relevant to the matter while agreeing with neither the argument nor the statement. The operand C is any CID: arguments are brought both to a file and to an edge or a cyberlink — for example, against someone's attribution.

The form repeats the logic of `update`: the operand is embedded in the source, so `hash("pro", C)` — the "for" side of C — is one address for all signers. Knowing C, a reader computes one hash and reads the outgoing edges — that is the whole query; the level of argumentation is the out-degree. Symmetrically, `hash("con", C)` is the "against" side. (The alternative `hash("pro", B) → C` would direct the edges into the operand itself, but the query "all arguments for C" would then require parsing the source of every incoming edge.) And like any edge, an argument is itself addressable: it is repeated, disputed with `deny`, and `agree`/`disagree` apply to the file B — the dispute over an argument's quality is conducted by the same conventions.
