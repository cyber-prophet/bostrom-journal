# Agreement and disagreement with content

```
B - the CID of the content being evaluated

hash("agree") → B       # "claim B is true"
hash("disagree") → B    # "claim B is false"
```

Confirmation and deny evaluate edges: confirmation repeats an edge, deny disputes it. They do not apply to standalone content: a bare CID B has no edge to repeat or deny. With the agree/disagree pair, an opinion about content gets edges of its own — and from there they aggregate like any others: cyberlinks of different neurons with one edge add up into a support level (see "Measurable consensus").

Agree/disagree and deny are different axes. Agree/disagree speak about content: B is true or false. Deny of an edge speaks about the statement: A → B is false; deny of a cyberlink speaks about the record: a specific neuron's cyberlink is invalid. So disagreement with content is not expressed through deny of someone's agreement — otherwise "I disagree with B" and "this agreement is invalid" would become indistinguishable. The axes combine: `hash("deny") → hash(hash("agree"), B, neuron)` disputes a specific neuron's agreement — for example, as spam — expressing no opinion about B itself.
