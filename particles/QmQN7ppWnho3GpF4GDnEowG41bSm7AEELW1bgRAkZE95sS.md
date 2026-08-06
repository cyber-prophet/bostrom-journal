---
parent: QmbpHoy3CbAj2nzQmikQPFQD1AxT6Rgoh4MRA6LE6w2mTr
---

# Question and answer

```
B - any CID: content, an edge, or a cyberlink
Q - the CID of the question content
A - the CID of the answer content

hash("question", B) → Q                            # "Q is a question about B"
hash("answer", hash(hash("question", B), Q)) → A   # "A is an answer to question Q about B"
```

That Q is a question is visible from its content; there is no need to mark it with a separate edge. The convention carries what the content does not: the address — what is asked about. The operand B is any CID: content, an edge, or a cyberlink. `hash("question", B)` is one computable address for "questions about B": knowing B, a reader computes one hash and reads the outgoing edges — the open questions; a repetition of the edge by another neuron means "I have the same question". The `agree`/`disagree` pair does not apply to Q: the content of a question states nothing. A question edge — like any edge — is disputed with `deny`, for example as spam.

An answer attaches not to the bare Q but to the question-in-context — the address of the question edge (the same device as `deny` of a quote). Question texts are often not self-contained ("Is there a consensus on this?"), and one Q asked about different Bs would glue the answers into one shared vertex. The edge address contains no neuron, so one answer serves everyone who repeated the question. The answer itself is ordinary content: it is evaluated with `agree`/`disagree`, arguments are brought to it with `pro`/`con`, and the best answer is revealed by aggregation, not by appointment.
