---
parent: QmbCKe4xxMpD7fvtLS2yGXQ1bjjqA8YeDNpbkC25qY8pdz
---

# Changing scale: claim, file, corpus

A text file A need not be treated as a single whole. It can be decomposed into the basic claims it makes: each claim — a verbatim excerpt — is published as a separate file B and connected to the original with a quote edge `hash("quote", A) → B` (see "Quotes"). The decomposition is limited to the verbatim: anyone can verify a substring; a normalized paraphrase is built from the excerpt as a separate step and is not part of this convention. Now every claim has its own CID and is individually open to evaluative cyberlinks — `agree` and `disagree` (see "Agreement and disagreement with content").

As evaluations from different neurons accumulate, each claim builds up its own statistics, and file A as a whole receives their aggregate. And since a claim is addressed by content, its evaluations are not tied to file A: the author of another text can include an already evaluated claim in their file, and the evaluation statistics come with it automatically — the claim's CID is the same.

Across the whole set of files this opens analysis beyond counting evaluations: clustering related files, revealing central tendencies and outliers worth investigating, and detecting files that contradict each other or state the same thing in different words.

Together this gives work on information a change of scale: one can zoom in — from the corpus to a file, from the file to an individual claim — evaluate the detail and zoom back out, and the evaluations assemble into properties of the whole. The levels require no different mechanisms: claim, file, and corpus are addressed by CIDs, and the same conventions act at every scale (see "Conventions").
