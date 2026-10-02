---
parent: QmR4GggrxCke9RKMoxS923RzA8hAQWMuhEYTy68dMAnBFV
---

# Acknowledgement

As far as I know, the first to document conventions of this kind
was @snedashkovsky in [semantic conventions](https://github.com/Snedashkovsky/cyber-semantic-conventions)
— in July 2021, months before the Bostrom launch;
the examples ran on the test network.
The form itself was likely born earlier,
as an implementation of @mastercyb's ideas behind cyb.ai
— Sergey gave them a name and a description.
His document encodes application objects — tweet, follow, avatar:
the CID of a special string, such as tweet, is placed in the source of an edge
and marks the target as an object of that type;
this is the CID of the string itself, not of a record as in the appendix "Cybergraph format".
He also proposed a meta level:
a convention is itself declared in the graph by cyberlinks from the semantic convention root,
and the list of conventions is read from the graph itself.

And, of course, the whole Cybergraph model with its many manifestations,
some of which are described in this issue, was born — in far greater volume — and lives in the minds of the founders @mastercyb and @cyborgshead.
Everything described in this journal is only rediscovered ideas of the Bostrom founders, or derivatives of them.
