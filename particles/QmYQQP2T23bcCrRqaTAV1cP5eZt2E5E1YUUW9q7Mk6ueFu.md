# Transactions and their cost in Bostrom

Any action changing the state of blockchain is a transaction.

Examples of actions changing state of Bostrom:

- adding knowledge to the knowledge graph by creating cyberlinks
  - setting neuron's avatar on cyb.ai
  - sending neuron's tweet on cyb.ai
  - sending a comment on a particle on cyb.ai
- transferring tokens between accounts
- delegating BOOT to a hero
- claiming delegation rewards
- hydrogen investminting
- calls of contracts
- exchanging tokens using pools
- etc.

When signing a transaction, the neuron should set an amount of `gas` for executing the transaction and the `gasPrice` cost of the gas in BOOT.

Gas is the smallest unit or pricing value required to perform a transaction. Different transactions require different amounts of gas. The gas amount for a transaction is calculated as it is being processed.

Each hero sets a `min-gas-price` value and will only include transactions with a `gasPrice` greater than their `min-gas-price` value.

The transaction fees are the product of gas and `gasPrice`. The higher the `gasPrice` fees, the higher the chances that a transaction will get included in a block.

As for now (the network is still underloaded), many heroes accept transactions at a zero-cost gas.

There is no fee check for transactions that consist of cyberlinks. Though `gas` amount still needs to be provided. This means that creating cyberlinks is regulated only by VOLT tokens balance, and doesn't require spending any BOOT tokens.

---

###### Information on the article’s previous version  

cid: [QmYYB4EEb9KUagqotDWFYtCUsmsFqhNtneqALdTTrKut1t](https://cyb.ai/ipfs/QmYYB4EEb9KUagqotDWFYtCUsmsFqhNtneqALdTTrKut1t)  
author: [bostrom1nngr5aj3gcvphlhnvtqth8k3sl4asq3n6r76m8](https://cyb.ai/network/bostrom/contract/bostrom1nngr5aj3gcvphlhnvtqth8k3sl4asq3n6r76m8)  
particle_epoch: 1650875281  

levenshtein similarity: 0.468  
cosine similarity: 0.943  

cyberrank[^1] = [3486631087](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/rank/QmYYB4EEb9KUagqotDWFYtCUsmsFqhNtneqALdTTrKut1t)  
incoming cyberlinks count[^1] = [1](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/backlinks/QmYYB4EEb9KUagqotDWFYtCUsmsFqhNtneqALdTTrKut1t?pagination.page=0&pagination.per_page=1000)  
outgoing cyberlinks count[^1] = [0](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/search/QmYYB4EEb9KUagqotDWFYtCUsmsFqhNtneqALdTTrKut1t??pagination.page=0&pagination.per_page=1000)  

[^1]: Metrics snapshot was taken between blocks [4102944](https://cyb.ai/network/bostrom/block/4102944)-[4102984](https://cyb.ai/network/bostrom/block/4102984)

