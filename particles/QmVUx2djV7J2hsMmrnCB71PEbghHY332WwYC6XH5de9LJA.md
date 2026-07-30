---
parent: QmcrJtdsqVZSMPfsmWfUE8DgMdDPDfFDUniJTJHyt3dLb7
---

# Fundamentals

The definition in the chapter "Cyberlink and cybergraph" does not mention a blockchain: the triple and the derived CIDs are defined on top of IPFS hashing — this is the *format* of Cybergraph, fit for any medium where records are published signed. Cybergraph was first implemented on the Bostrom blockchain.

There the same things have other names, and the reader will meet them in Bostrom, on cyb.ai, and in the journal's first issue: a signer there is a *neuron*, and a file whose CID stands in an edge is a *particle*.

A Bostrom cyberlink carries the same triple as the format: `cid_from` and `cid_to` sit in the record, the signer is given by the transaction signature. Only the encoding of the signer diverges: in Bostrom it is a bostrom1… address (a chain-specific hash of the same key), in the format it is the CID of the public key (see the appendix "Cybergraph format").

Beyond the triple, the chain adds only publication metadata. Since Bostrom is a blockchain built on the Cosmos SDK, every cyberlink is contained in a transaction, so two more facts can be read from the raw chain:

- height and timestamp — when the cyberlink was published
- account sequence — the signer's own transaction counter, running without gaps

Every transaction with cyberlinks is signed by the key of its signer, and the block that carries it is signed by validators. Anyone can verify these signatures and, without trusting whoever provided the data, make sure that a specific signer published a specific cyberlink at a known moment in time. The proof extends to the content: a CID is deterministic from the content, so a cyberlink included in a block fixes that the content of both files already existed at the moment of publication — anyone who has the file computes its CID and checks it against the one recorded in the cyberlink. Since the account sequence runs without gaps, every transaction of the signer can be read, so none of their cyberlinks stays hidden.
