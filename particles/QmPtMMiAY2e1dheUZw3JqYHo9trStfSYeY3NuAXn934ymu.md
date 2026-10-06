---
parent: QmYHALvTwpbxxDKneAs8FWpUzJYdBUvu2Z44dD4AJ6KnXc
---

# Confirming an edge and a cyberlink

A signer can support a statement in two ways:
make it their own, or confirm a statement of another signer.

The first way: simply repeat the edge.

Unlike `deny_edge`/`update_edge`/`quote_particle`, a repetition does not need a special CID in the source:
it is simply the same edge that another signer publishes again.
There is no convention here at all
— a repetition has no record that goes into the source.
Also, a repetition says more than an evaluation:
the signer personally makes the same statement.

But a signer can support a statement and not make it their own:

```
A - CID
B - CID
signer - the CID of the signer of the cyberlink being confirmed

{"op":"confirm_edge"} → {"cid_from":A,"cid_to":B}                  # confirming the edge
{"op":"confirm_link"} → {"cid_from":A,"cid_to":B,"signer":signer}  # confirming a specific cyberlink
```

Confirmation has two targets, and thus two semantics.
Each of them has its own word, and the words mirror `deny_edge`/`deny_link` (see "Denying an edge and a cyberlink"):
- `confirm_edge` → `{"cid_from":A,"cid_to":B}` — confirms the statement `A → B` itself:
  the statement is true, no matter who published it
- `confirm_link` → `{"cid_from":A,"cid_to":B,"signer":signer}` — confirms a specific cyberlink of a specific signer:
  the record is valid
  — for example, it is not spam —
  with no opinion about the statement itself

The word itself names its subject.
A reader who filters instructions only by the word
gets the confirmations of edges separately from the confirmations of cyberlinks.
The reader does not parse the target of each edge.
As with `deny_edge`/`deny_link`, the sources `{"op":"confirm_edge"}` and `{"op":"confirm_link"}` are fixed CIDs:
what they point to is what is confirmed.

Repetition and `confirm_edge` are different signals,
and work distinguishes them.
Repetition needs work:
the archivist compared the copies of the source, the agent repeated the computation, the reader checked the substring of the quote.
Only then does the signer state the same thing.
`confirm_edge` is support from a signer who did not do the work.
It relies on the one who did the work.
A monk who did not personally hear the words from the Buddha cannot repeat the edge "Thus have I heard".
Such a repetition is a false claim,
but the monk has the right to confirm the edge.
Aggregation counts repetitions and confirmations separately (see "Measurable consensus").

Where a signer cannot do the work personally,
only confirmation remains.
This is the case with `update_edge`:
`{"about":{"cid_from":A,"cid_to":B},"op":"update_edge"}` is one source for everyone who proposes an update (see "Updating a previously published edge").
But C itself is the proposal of its author,
and there is nothing from which to derive it again.
If a signer repeats the update of another signer, the signer claims that they independently invented the same replacement.
If the signer confirms it, the signer accepts it.
Thus the reader uses confirmations, not repetitions, to distinguish the versions that compete.

The signature proves the authenticity of a record (see "Fundamentals"),
and there is no reason to certify it:
`confirm_link` is a judgment about validity.
Its direct use is a counterweight.
Some signers deny a cyberlink as spam and other signers confirm it as valid,
and both sides are visible next to each other.
