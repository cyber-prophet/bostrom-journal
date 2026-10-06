---
parent: QmaNm9ngUPE8HnFVvaDTSv2XCjSo5yozkYBS1qvJ1MVkWu
---

# Question and answer

```
X - any CID: content, an edge, or a cyberlink
Q - the CID of the question content
R - the CID of the answer content

{"about":X,"op":"question"} → Q                                                         # "Q is a question about X"
{"about":{"cid_from":{"about":X,"op":"question"},"cid_to":Q},"op":"answer_edge"} → R    # "R is an answer to question Q about X"
```

The content of Q shows that Q is a question;
a separate edge to mark this is not necessary.
The convention carries what the content does not carry:
the address — what the question is about.
The operand X is any CID:
content, an edge, or a cyberlink.
`{"about":X,"op":"question"}` is one computable address for "questions about X":
from X, a reader computes one hash and reads the outgoing edges
— the open questions.
A repetition of the edge by another signer means "I have the same question".
The `agree_particle`/`disagree_particle` pair does not apply to Q:
the content of a question states nothing.
A question edge
— like all edges —
is denied with `deny_edge`,
and as spam with `deny_link`.

An answer attaches not to the bare Q but to the question in its context.
This is the question edge (its address is in the `about` of the source, as with `update_edge`).
The text of a question is often not complete without its context ("Is there a consensus on this?").
And one Q that signers ask about different Xs would join the answers into one shared vertex.
The edge contains no signer,
so one answer serves all who repeated the question.
The answer itself is ordinary content:
signers evaluate it with `agree_particle`/`disagree_particle`
and bring arguments to it with `pro`/`con`.
Aggregation, not an appointment, shows the best answer.
