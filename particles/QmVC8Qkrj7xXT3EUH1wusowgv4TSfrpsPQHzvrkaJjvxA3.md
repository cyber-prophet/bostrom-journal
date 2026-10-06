---
parent: QmWWB9vKdPK2Qo43Das9VxBUtecBRBpBdwQ4WUs89sAHk9
---

# Changing scale: claim, file, corpus

It is not necessary to treat a text file A as one whole.
The file can be decomposed into the basic claims that it makes.
Each claim
(a verbatim excerpt)
is published as a separate file B, and a quote edge `{"about":A,"op":"quote_particle"} → B` connects it to the original (see "Quotes").
The decomposition is limited to verbatim text:
anyone can verify a substring.
A normalized paraphrase is built from the excerpt in a separate step
and is not part of this convention.
Now each claim has its own CID,
and it is separately open to evaluative cyberlinks
— `agree_particle` and `disagree_particle` (see "Agreement and disagreement with content").

When evaluations from different signers accumulate,
each claim collects its own statistics,
and file A as a whole gets the aggregate of these statistics.
Because a claim is addressed by its content,
its evaluations are not tied to file A.
The author of another text can include in their file a claim that already has evaluations.
The evaluation statistics then come with the claim automatically
— the CID of the claim is the same.

For the whole set of files, this opens analysis beyond the count of evaluations.
This analysis can cluster related files. It can show central tendencies and outliers that are worth an investigation. It can also find files that contradict each other or state the same thing in different words.

Together, this gives a change of scale to work on information.
One can zoom in
— from the corpus to a file, from the file to an individual claim —
and evaluate the detail. Then one can zoom out again,
and the evaluations combine into properties of the whole.
The levels do not need different mechanisms.
CIDs address the claim, the file, and the corpus,
and the same conventions apply at every scale (see "Conventions").
