# The economic incentivization mechanism of agents in Bostrom

The economic incentivization mechanism of heroes and neurons in Bostrom includes rewards and penalties.

Blockchain is programmed to mint new BOOT tokens in each block to pay rewards. The `inflation_rate` coefficient determines the number of new tokens produced. `Inflation_rate` coefficient depends on the share of `staked` BOOTs:

- if the `staked` percentage of BOOTs is less than the `goal_bonded` parameter, then the `inflation_rate` coefficient will be increasing for each block till it hits the `inflation_rate_max` value. The higher the `inflation_rate`, the more rewarding is the `stake`;
- if the `staked` percentage of BOOTs is more than the `goal_bonded` parameter, then the `inflation_rate` coefficient will be decreasing for each block till it hits the `inflation_rate_min` value, thus signaling to search for another way of profiting from BOOTs.

New tokens are distributed between neurons who `staked` their tokens and heroes proportionally to their `staked` tokens.

Heroes receive a set fee.

Neurons are rewarded for deligating (`staking`) tokens to heroes and bearing `slashing` risks (reducing `stake` by the penalty amount), and also risks of skipping blocks without getting any rewards (while the hero who committed violation remains in the `jail` state).

Neurons' risks are that the heroes, to whom the former have delegated their tokens, may commit a violation of two kinds:

- Downtime (skipping new block's computing).
- Double sign (using the same private key of the validator on two different servers).

`slashing` is a feedback mechanism from the blockchain to heroes, as it forces neurons to redistribute their `stakes` in favor of heroes, who perform their functions properly.

When a particular hero is caught violating rules, that hero is put into the `jail` state, which means no rewards are produced for the tokens deligated to him.

All the violations and the penalties are noted in the blockchain settings and are executed according to the Tendermint consensus protocol.

In order to hedge `slashing` risks one may distribute `stakes` between several heroes.

---

###### Information on the article’s previous version  

cid: [QmQuGqjVrGKq8xrCkE3NNPnfJNLpDqRo6FWwEYkyV9SA4z](https://cyb.ai/ipfs/QmQuGqjVrGKq8xrCkE3NNPnfJNLpDqRo6FWwEYkyV9SA4z)  
author: [bostrom1h29u0h2y98rkhdrwsx0ejk5eq8wvslygexr7p8](https://cyb.ai/network/bostrom/contract/bostrom1h29u0h2y98rkhdrwsx0ejk5eq8wvslygexr7p8)  
particle_epoch: 1659228532  

levenshtein similarity: 1  
cosine similarity: 1  

cyberrank[^1] = [2771849100](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/rank/QmQuGqjVrGKq8xrCkE3NNPnfJNLpDqRo6FWwEYkyV9SA4z)  
incoming cyberlinks count[^1] = [0](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/backlinks/QmQuGqjVrGKq8xrCkE3NNPnfJNLpDqRo6FWwEYkyV9SA4z?pagination.page=0&pagination.per_page=1000)  
outgoing cyberlinks count[^1] = [1](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/search/QmQuGqjVrGKq8xrCkE3NNPnfJNLpDqRo6FWwEYkyV9SA4z??pagination.page=0&pagination.per_page=1000)  

[^1]: Metrics snapshot was taken between blocks [4102944](https://cyb.ai/network/bostrom/block/4102944)-[4102984](https://cyb.ai/network/bostrom/block/4102984)

