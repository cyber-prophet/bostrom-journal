---
parent: QmWJyZ2MSSRNRHEpGM2zVBFZusx68taXaZDSshgGtA83wr
---

# Agreement and disagreement with content

```
B - the CID of the content being evaluated

{"op":"agree_particle"} → B       # "claim B is true"
{"op":"disagree_particle"} → B    # "claim B is false"
```

Repetition, `confirm_edge` and `deny_edge` work with edges:
repetition states the same edge, `confirm_edge` confirms it, and `deny_edge` denies it.
They do not apply to standalone content:
a bare CID B has no edge that a signer can repeat, confirm or deny.
With the `agree_particle`/`disagree_particle` pair, an opinion about content gets its own edges.
From there, these edges aggregate like all other edges.
The cyberlinks of different signers with one edge combine into a support level (see "Measurable consensus").

The `agree_particle`/`disagree_particle` pair and the `confirm_edge`/`deny_edge` and `confirm_link`/`deny_link` pairs are different axes,
and their subjects differ.
`agree_particle`/`disagree_particle` target the content:
claim B is true or false.
`confirm_edge`/`deny_edge` target the edge:
`A → B` is true or false;
`confirm_link`/`deny_link` target the record:
the cyberlink of a specific signer is valid or not valid.
"B is true" and "`A → B` is true" are different statements about different things.
So a signer does not express disagreement with content through `deny_link` of the agreement of another signer.
Otherwise, nobody could tell "I disagree with B" from "this agreement is invalid".
The axes combine:
`{"op":"deny_link"} → {"cid_from":{"op":"agree_particle"},"cid_to":B,"signer":signer}` denies the agreement of a specific signer
— for example, as spam —
and gives no opinion about B itself.
