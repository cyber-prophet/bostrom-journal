---
parent: QmaDb4px5QhE4SpzWzu9BenLBys2MMS1BuPbaYXbctxfKs
---

# Confirming an edge and a cyberlink

A statement can be supported in two ways:
make it your own, or confirm someone else's.

The first: simply repeat the edge.

Unlike `deny_edge`/`update_edge`/`quote_particle`, repetition requires no special CID in the source:
it is simply the same edge published again by another signer.
There is no convention here at all
— repetition has no record that would go into the source.
And it says more than an evaluation:
the signer makes the same statement themselves.

But a statement can be supported without making it your own:

```
A - CID
B - CID
signer - the CID of the signer of the cyberlink being confirmed

{"op":"confirm_edge"} → {"cid_from":A,"cid_to":B}                  # confirming the edge
{"op":"confirm_link"} → {"cid_from":A,"cid_to":B,"signer":signer}  # confirming a specific cyberlink
```

Two targets of confirmation — two semantics,
each with its own word, mirroring `deny_edge`/`deny_link` (see "Denying an edge and a cyberlink"):
- `confirm_edge` → `{"cid_from":A,"cid_to":B}` — confirms the statement `A → B` itself:
  it is true no matter who published it
- `confirm_link` → `{"cid_from":A,"cid_to":B,"signer":signer}` — confirms a specific cyberlink of a specific signer:
  the record is valid
  — for example, it is not spam —
  with no opinion about the statement itself

The word names its subject itself:
a reader filtering instructions by the word alone
gets confirmations of edges and confirmations of cyberlinks apart,
without parsing the target of each edge.
Like `deny_edge`/`deny_link`, the sources `{"op":"confirm_edge"}` and `{"op":"confirm_link"}` are fixed CIDs:
what they point to is what is confirmed.

Repetition and `confirm_edge` are different signals,
and what tells them apart is work.
Repetition requires it:
the archivist collated the copies of the source, the agent repeated the computation, the reader checked the substring of the quote
— only then does the signer state the same thing.
`confirm_edge` is support without one's own work;
it leans on the one who did the work.
A monk who did not himself hear the words from the Buddha cannot repeat the edge "Thus have I heard"
— that would be a false assertion —
but is entitled to confirm it.
Aggregation counts repetitions and confirmations separately (see "Measurable consensus").

Where the work cannot be done for oneself,
only confirmation remains.
So it is with `update_edge`:
`{"about":{"cid_from":A,"cid_to":B},"op":"update_edge"}` is one source for everyone who proposes an update (see "Updating a previously published edge"),
but C itself is the author's proposal,
and there is nothing from which to derive it anew.
To repeat someone else's update is to claim that one came up with the same replacement oneself;
to confirm it is to accept it.
So the reader tells competing versions apart by confirmations, not by repetitions.

The authenticity of a record is proved by the signature (see "Fundamentals"),
and there is no point in certifying it:
`confirm_link` is a judgment about validity.
The direct use is a counterweight:
a cyberlink denied as spam is confirmed as valid by other signers,
and both sides are visible side by side.
