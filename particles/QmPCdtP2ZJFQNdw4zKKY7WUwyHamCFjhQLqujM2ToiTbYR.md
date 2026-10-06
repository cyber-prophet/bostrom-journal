---
parent: QmPS3e1yrAYVzpPqVienqVce8GZYdc9KdqBz2am7hF2UYB
---

# Fundamentals

The definition in the chapter "Cyberlink and cybergraph" does not mention a blockchain.
The triple and the derived CIDs are defined on top of IPFS hashes.
This is the *format* of Cybergraph, and it is suitable for any medium
where records are published with a signature.
Cybergraph was first implemented on the Bostrom blockchain.

In Bostrom, on cyb.ai, and in the first issue of the journal, a signer has another name: *neuron*.

A Bostrom cyberlink carries the same triple as the format:
`cid_from` and `cid_to` are in the record,
and the transaction signature identifies the signer.
Only the encoding of the signer is different.
In Bostrom, it is a bostrom1… address (a blockchain-specific hash of the same key).
In the format, it is the CID of the public key (see the appendix "Cybergraph format").

In addition to the triple, the blockchain adds only publication metadata.
Bostrom is a blockchain that is built on the Cosmos SDK,
so every cyberlink is in a transaction.
Thus, two more facts can be read from the raw data of the blockchain:

- height and timestamp — when the cyberlink was published
- account sequence — the signer's own transaction counter, which runs without gaps

Each transaction with cyberlinks has a signature from the key of its signer,
and validators sign the block that carries the transaction.
Anyone can verify these signatures.
And, with no trust in the data provider,
anyone can make sure that a specific signer published a specific cyberlink at a known time.
The proof also applies to the content:
the content determines its CID.
Thus, a cyberlink in a block is proof
that the content of both particles already existed at the moment of publication.
Anyone who has the file computes its CID and compares it with the CID in the cyberlink.
Because the account sequence runs without gaps,
every transaction of the signer can be read,
so no cyberlink of the signer stays hidden.
