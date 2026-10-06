---
parent: QmWV2THnrQzXXZmiBuAKa9FkspZySVDFGCfhK26mMRRdmm
---

# A worked example: what did the Buddha actually say?

The Buddha wrote nothing.
He taught for approximately forty-five years, and then he died.
For four to four and a half centuries, people transmitted his words by communal recitation aloud
— and kept them in memory, not in writing.
There was no original manuscript that a person could use to verify a statement,
and no central authority with the power to certify anything.
The tradition preserved and verified his words by its own conventions, which have the same structure as the conventions above.
(The text below describes the structure that the tradition records.
People dispute whether each event occurred exactly as the tradition tells it.
The point is the form.)

**Authorship — "Thus have I heard" is a signed cyberlink.**
Almost every discourse in the canon starts with the same words.
These words are *Evaṃ me sutaṃ*, "Thus have I heard".
By tradition, these are the words of Ananda
— the attendant of the Buddha, who retells what he personally heard.
The formula does not claim authorship of the content.
It certifies provenance:
*I, this person, heard this from that source.*

```
signer = Ananda
A = hash("heard from the Buddha")     # the source / the act of hearing
B = hash(teaching)                    # the discourse, addressed by content

Ananda:  A → B                        # "Thus have I heard"
```

The signature carries the identity of Ananda.
`content(B)` is the words of the Buddha as Ananda retells them.
The formula that starts almost every discourse is the provenance edge plus the identity of the hearer:
exactly the triple that a cyberlink carries.
The special CID `hash("heard from the Buddha")` is not in the list above.
It is a convention of the tradition itself:
the set of conventions is open (see "Conventions").

The content carries more than the edge.
Every discourse starts not only with "Thus have I heard" but also with its setting.
One example:
*"On one occasion the Blessed One was dwelling near Sāvatthī, in Jeta's Grove"*.
The setting names the place, the audience, and the occasion.
Together, these are the conditions in which the words were heard.
The setting is part of `content(B)`, and it is recorded in the words of Ananda, not in the words of the Buddha.
The standing of Ananda is recorded too.
The tradition remembers him as the foremost of those who heard much.
A reader who knew none of this
could still read these dimensions from the account itself and weigh the account accordingly.

The depth of a plain "P said B" does not come from one edge.
It comes from who signed "P said B", when the signer signed it, and what the corpus already says about that signer.
Cybergraph shows the same for any signer.
The declaration of the signer is the signed cyberlink itself.
The context at the moment of the act is the earlier cyberlinks of the signer.
They run without gaps by account sequence,
so the record is provably complete:
no cyberlink hides between two transactions of the signer (see "Fundamentals").
Also, others made their own cyberlinks about the signer.

**No central authority — the Buddha's own convention for verification.**
The Buddha foresaw his death. He left a procedure to verify any teaching that people later attributed to him
— the *Mahāpadesa*, the "Four Great References" (DN 16; AN 4.180).
A person who receives the statement "I heard this from the Buddha" should

> "neither approve nor reject" it on the ground of who says it;
> instead, "having carefully memorized those words and phrases, you should check whether they fit in the discourses (suttas) and are manifested in the discipline (vinaya).
> If they do not fit... you should reject them".
> — AN 4.180

Consistency with the corpus that already exists (the Sutta and the Vinaya — the established graph) decides validity.
The authority of the person who makes the statement does not decide it.
The same verification applies even to "I heard this face to face from the Buddha".
This is validity-through-consistency
— a read policy that is different from the reputation-weighted vote count above, and robust to it.
A statement with many confirmations still fails if it contradicts the corpus.
There is no new mechanism here:
the verification reads the corpus that already exists.
The procedure itself is one more convention of the same kind.
The teaching that defines it is published into the graph as an ordinary cyberlink.

The *Kālāma Sutta* (AN 3.65) states the principle directly:
do not rely on oral tradition, lineage, hearsay, scripture, the apparent competence of the speaker, or "the teacher is ours"
— *know for yourselves.*
Here the standing of the person who makes the statement has no part in validity at all.
Results decide, not the speaker.

The canon, then, is a graph of provenance cyberlinks.
A convention of confirmation and denial governs this graph,
and the Buddha himself published this convention into the graph.
Cybergraph is the same design with cryptographic signatures and content addressing.
So "what did the Buddha actually say" becomes a question that a person can query and cross-check against the corpus,
not a matter of faith.

Preservation is a concern that is separate from verification.
The chain stores only CIDs;
the files themselves are outside it,
and any verification
(of a quote, of consistency with the corpus)
reads content.
Until people recorded it in writing, the canon survived not by verification but by replication.
For four centuries, communal recitation kept the text in thousands of memories.
In Cybergraph, content storage (pinning) has this role.
A cyberlink is indestructible,
but it has meaning only while someone stores the files that it points to.

The dimensions that a reader uses to read a signer are open in the same way as the conventions above.
Examples are statements about the experience of the signer, references to external services, and metrics imported from them.
Each of these is itself a cyberlink
that specialized signers can recheck, confirm, or deny.
Dimensions grow through conventions, not through a new mechanism.
