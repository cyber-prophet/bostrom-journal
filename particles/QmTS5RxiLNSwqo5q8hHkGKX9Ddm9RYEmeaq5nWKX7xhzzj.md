---
parent: QmPcc7xJSKZyPGQMsbkvc7jdgkvYmgR7VqkR2J723wz3qC
---

# Agreement and disagreement with content

```
B - the CID of the content being evaluated

hash("agree_particle") → B       # "claim B is true"
hash("disagree_particle") → B    # "claim B is false"
```

Repetition, `confirm_edge`, and `deny_edge` work with edges: repetition states the same edge, `confirm_edge` confirms it, `deny_edge` disputes it. They do not apply to standalone content: a bare CID B has no edge to repeat, confirm, or deny. With the `agree_particle`/`disagree_particle` pair, an opinion about content gets edges of its own — and from there they aggregate like any others: cyberlinks of different neurons with one edge add up into a support level (see "Measurable consensus").

The `agree_particle`/`disagree_particle` pair and the `confirm_edge`/`deny_edge` and `confirm_link`/`deny_link` pairs are different axes, and what tells them apart is the subject. `agree_particle`/`disagree_particle` target the content: claim B is true or false. `confirm_edge`/`deny_edge` target the edge — `A → B` is true or false — `confirm_link`/`deny_link` the record: a specific neuron's cyberlink is valid or not. "B is true" and "`A → B` is true" are different statements about different things. So disagreement with content is not expressed through `deny_link` of someone's agreement — otherwise "I disagree with B" and "this agreement is invalid" would become indistinguishable. The axes combine: `hash("deny_link") → hash(hash("agree_particle"), B, neuron)` disputes a specific neuron's agreement — for example, as spam — expressing no opinion about B itself.
