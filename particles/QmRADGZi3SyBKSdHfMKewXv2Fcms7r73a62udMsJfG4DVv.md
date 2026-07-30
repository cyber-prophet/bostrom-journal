---
parent: Qmdz6dcUPLbNxysMN634sgGc1zUKeHhWTWQCwwff7sZpJt
---

# Agreement and disagreement with content

```
B - the CID of the file being evaluated

hash("agree") → B       # "claim B is true"
hash("disagree") → B    # "claim B is false"
```

Repetition, `confirm`, and `deny` work with edges: repetition states the same edge, `confirm` confirms it, `deny` disputes it. They do not apply to a standalone file: a bare CID B has no edge to repeat, confirm, or deny. With the `agree`/`disagree` pair, an opinion about content gets edges of its own — and from there they aggregate like any others: cyberlinks of different signers with one edge add up into a support level (see "Measurable consensus").

The `agree`/`disagree` pair and the `confirm`/`deny` pair are different axes, and what tells them apart is the subject. `agree`/`disagree` target the content of a file: claim B is true or false. `confirm`/`deny` target the edge — `A → B` is true or false — or the record: a specific signer's cyberlink is valid or not. "B is true" and "`A → B` is true" are different statements about different things. So disagreement with content is not expressed through `deny` of someone's agreement — otherwise "I disagree with B" and "this agreement is invalid" would become indistinguishable. The axes combine: `hash("deny") → hash(hash("agree"), B, signer)` disputes a specific signer's agreement — for example, as spam — expressing no opinion about B itself.
