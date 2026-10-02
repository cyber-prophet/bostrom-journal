---
parent: QmV3eYiSwYGS6pswsFRMeKbQeVPaxbvKvKPeXu59gQ4Xfg
---

# Question and answer

```
X - any CID: content, an edge, or a cyberlink
Q - the CID of the question content
R - the CID of the answer content

{"about":X,"op":"question"} → Q                                                         # "Q is a question about X"
{"about":{"cid_from":{"about":X,"op":"question"},"cid_to":Q},"op":"answer_edge"} → R    # "R is an answer to question Q about X"
```

That Q is a question is visible from its content; there is no need to mark it with a separate edge. The convention carries what the content does not: the address — what is asked about. The operand X is any CID: content, an edge, or a cyberlink. `{"about":X,"op":"question"}` is one computable address for "questions about X": knowing X, a reader computes one hash and reads the outgoing edges — the open questions; a repetition of the edge by another signer means "I have the same question". The `agree_particle`/`disagree_particle` pair does not apply to Q: the content of a question states nothing. A question edge — like any edge — is disputed with `deny_edge`, and as spam with `deny_link`.

An answer attaches not to the bare Q but to the question-in-context — the question edge (its address is in the `about` of the source, as with `update_edge`). Question texts are often not self-contained ("Is there a consensus on this?"), and one Q asked about different Xs would glue the answers into one shared vertex. The edge contains no signer, so one answer serves everyone who repeated the question. The answer itself is ordinary content: it is evaluated with `agree_particle`/`disagree_particle`, arguments are brought to it with `pro`/`con`, and the best answer is revealed by aggregation, not by appointment.
