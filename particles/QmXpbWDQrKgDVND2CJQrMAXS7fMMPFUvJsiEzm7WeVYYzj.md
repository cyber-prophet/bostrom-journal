---
parent: QmZqnCSjrkidsUqT3PzkK7djfZuSPmCQ36WwKWaTfSEPtH
---

# A worked example: what did the Buddha actually say?

The Buddha wrote nothing. He taught for about forty-five years, died, and for four to four and a half centuries his words were passed on by communal recitation aloud — kept in memory, not in writing. There was no original manuscript against which a statement could be verified, and no central authority empowered to certify anything. The methods by which the tradition preserved and verified his words are the tradition's own conventions, built like those defined above. (What follows describes the structure the tradition records; whether every event happened exactly as told is a matter of dispute; the point is the form.)

**Authorship — "Thus have I heard" is a signed cyberlink.** Almost every discourse in the canon opens with the same words: *Evaṃ me sutaṃ*, "Thus have I heard". By tradition these are the words of Ananda — the Buddha's attendant, retelling what he personally heard. The formula does not claim authorship of the content; it certifies provenance: *I, this person, heard this from that source.*

```
neuron = Ananda
A = hash("heard from the Buddha")     # the source / the act of hearing
B = hash(teaching)                    # the discourse, addressed by content

Ananda:  A → B                        # "Thus have I heard"
```

The signature carries Ananda's identity; `content(B)` is the Buddha's words in his retelling. The opening formula of almost every discourse is the provenance edge plus the identity of the hearer: exactly the triple a cyberlink carries. The special CID `hash("heard from the Buddha")` is not in the list above — it is the tradition's own convention: the set of conventions is open (see "Conventions").

The content carries more than the edge. Every discourse opens not only with "Thus have I heard" but also with its setting. One example: *"On one occasion the Blessed One was dwelling near Sāvatthī, in Jeta's Grove"*. The setting names the place, the audience, and the occasion. Together these are the conditions under which the words were heard; the setting is part of `content(B)` and is recorded in Ananda's words, not the Buddha's. Ananda's standing is recorded too. He is remembered as the foremost of those who had heard much. A reader who knew none of this could still read these dimensions out of the account itself and weigh it accordingly.

The depth of a plain "P said B" comes not from one edge but from who signed it, when it was done, and what the corpus already says about that neuron. Cybergraph exposes the same for any neuron. Its declaration is the signed cyberlink itself. The context at the moment of the act is the neuron's earlier cyberlinks. They run without gaps by account sequence, so the record is provably complete: no cyberlink hides between two of its transactions (see "Fundamentals"). And others have made their own cyberlinks about the neuron.

**No central authority — the Buddha's own convention for verification.** Foreseeing his death, the Buddha left a procedure for verifying any teaching later attributed to him — the *Mahāpadesa*, the "Four Great References" (DN 16; AN 4.180). On receiving the statement "I heard this from the Buddha", one should

> "neither approve nor reject" it on the ground of who says it; instead, "having carefully memorized those words and phrases, you should check whether they fit in the discourses (suttas) and are manifested in the discipline (vinaya). If they do not fit... you should reject them". — AN 4.180

Validity is decided by consistency with the existing corpus (the Sutta and the Vinaya — the established graph), not by the authority of the one making the statement. Even "I heard this face to face from the Buddha" is verified the same way. This is validity-through-consistency — a read policy different from the reputation-weighted vote counting above, and robust to it: a statement with many confirmations still fails if it contradicts the corpus. There is no new mechanism here — the verification reads the existing corpus, and the procedure itself is one more convention of the same kind, whose defining teaching is published into the graph as an ordinary cyberlink.

The *Kālāma Sutta* (AN 3.65) states the principle directly: do not go by oral tradition, by lineage, by hearsay, by scripture, by the seeming competence of the speaker, or by "the teacher is ours" — *know for yourselves.* Here the standing of the one making the statement is excluded from validity entirely — results decide, not the speaker.

The canon, then, is a graph of provenance cyberlinks governed by a convention of confirmation and denial that the Buddha himself published into the graph. Cybergraph is the same design with cryptographic signatures and content addressing — so "what did the Buddha actually say" becomes queryable and cross-checkable against the corpus, rather than a matter of faith.

Preservation is a concern separate from verification. The chain stores only CIDs; the files themselves live outside it, and any verification — of a quote, of consistency with the corpus — reads content. The canon survived until writing not by verification but by replication: for four centuries communal recitation kept the text in thousands of memories. In Cybergraph this role is played by content storage (pinning): a cyberlink is indestructible, but it is meaningful only as long as someone stores the files it points to.

And the dimensions for reading a neuron are open in the same way the conventions above are open: statements about its experience, references to external services and metrics imported from them — each is itself a cyberlink that specialized neurons can recheck, confirm, or deny. Dimensions grow through conventions, not through a new mechanism.
