---
parent: QmaqxKFFQi22K11zfgGhHQ2Vnvw6Q7qvSVBnmXbe5aH2Da
---

# Confirming an edge and a cyberlink

A statement can be supported in two ways: make it your own, or confirm someone else's.

The first: simply repeat the edge.

Unlike `deny`/`update`/`quote`, repetition requires no special CID in the source: it is simply the same edge published again by another neuron. There is no convention here at all — repetition has no string that would go into `hash()`. And it says more than an evaluation: the neuron makes the same statement itself.

But a statement can be supported without making it your own:

```
A - CID
B - CID
neuron - the CID of the neuron of the cyberlink being confirmed

hash("confirm") → hash(A, B)          # confirming the edge
hash("confirm") → hash(A, B, neuron)  # confirming a specific cyberlink
```

Two targets of confirmation — two semantics, mirroring `deny` (see "Denying an edge and a cyberlink"):
- `hash(A, B)` — confirms the statement `A → B` itself: it is true no matter who published it
- `hash(A, B, neuron)` — confirms a specific cyberlink of a specific neuron: the record is valid — for example, it is not spam — with no opinion about the statement itself

Like `hash("deny")`, `hash("confirm")` is a fixed CID: what it points to is what is confirmed.

Repetition and `confirm` of an edge are different signals, and what tells them apart is work. Repetition requires it: the archivist collated the copies of the source, the agent repeated the computation, the reader checked the substring of the quote — only then does the neuron state the same thing. `confirm` is support without one's own work; it leans on the one who did the work. A monk who did not himself hear the words from the Buddha cannot repeat the edge "Thus have I heard" — that would be a false assertion — but is entitled to confirm it. Aggregation counts repetitions and confirmations separately (see "Measurable consensus").

Where the work cannot be done for oneself, only confirmation remains. So it is with `update`: `hash("update", hash(A, B))` is one source for everyone who proposes an update (see "Updating a previously published edge"), but C itself is the author's proposal, and there is nothing from which to derive it anew. To repeat someone else's update is to claim that one came up with the same replacement oneself; to confirm it is to accept it. So the reader tells competing versions apart by confirmations, not by repetitions.

The authenticity of a record is proved by the signature (see "Fundamentals"), and there is no point in certifying it: `confirm` of a cyberlink is a judgment about validity. The direct use is a counterweight: a cyberlink denied as spam is confirmed as valid by other neurons, and both sides are visible side by side.
