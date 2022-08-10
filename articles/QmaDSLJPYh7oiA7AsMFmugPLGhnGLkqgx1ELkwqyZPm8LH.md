# cyberGift

@groovybear, @mastercyb

The purpose of this research is to inspire at least 100k power-users of web3 to join the force of learning Superintelligence. To achieve this, we are going to gift 70% of the Bostrom genesis tokens BOOT to agents of Ethereum and Cosmos who are capable of contributing their best to the quality of the knowledge graph. First, we started by highlighting key audiences for establishing network effects and tackling basic chicken and eggs. Next, we balanced out the participation of key actors by splitting them into levels and adjusting allocations within the groups. Then we applied a filter in order to remove toxic fiat brains from the collective thought process. Finally, we added a crucial incentive to act quickly.

The research results are represented by reproducible scripts which output addresses and balances which will be loaded to the claim CosmWasm contract after the launch of Bostrom.

Data source is [BigQuery crypto-ethereum dataset](https://console.cloud.google.com/bigquery?d=crypto_ethereum&p=bigquery-public-data&page=dataset&project=cosmic-keep-223223) by [Blockchain ETL](https://github.com/blockchain-etl).

Research is done on the proposal basis. We hope this research can help pioneer a new wave of thinking in decentralized marketing.

## Connecting the Dots

The biggest problem in bootstrapping a blockchain ecosystem from scratch is that it is not enough to attract just users. Established network effects exist between four key groups: users, investors, validators, developers.

[![Network Effects](https://gateway.ipfs.cybernode.ai/ipfs/QmewHdVjafhaAbBYtVSEu7eVx4GLakLNRszCV8t7roUEdm/network_effects.png)](https://gateway.ipfs.cybernode.ai/ipfs/QmewHdVjafhaAbBYtVSEu7eVx4GLakLNRszCV8t7roUEdm/network_effects.png)

Hence we have to understand how to attract all these citizens simultaneously in order to target healthy organic growth.

In our case that would not be enough. First, Cyber is a content-oriented project. We need to understand how to add content creators to the soup. Second, information on the project has to be propagated somehow to all these guys, so key opinion leaders have to be incentivized. Third, as the Cyber project heavily relies on the interchain idea we have to attract the community behind IBC technology. We also want to add some fun by giving the power to the guys behind weird cyberpunk ideas. Finally, we want to check the credibility of the most trusted liquidity hubs.

## Audience Rules

The initial conditions for the allocation of classes were selected based on the analysis of web3 user activity and the need to cover the most web3 power-users.  
All distribution rules between levels are calculated in the respective jupyter notebooks.

These audiences were highlighted because their participation is necessary to form a full-fledged ecosystem of the project.

[Final Distribution](https://github.com/cybercongress/cybergift/blob/main/final_distribution.ipynb)

Based on counting the number of addresses and determining the fair reward for the participants of each audience, the following balanced distribution between them is proposed:

[![Distribution between Audiences](https://gateway.ipfs.cybernode.ai/ipfs/QmewHdVjafhaAbBYtVSEu7eVx4GLakLNRszCV8t7roUEdm/audiences_distribution.png)](https://gateway.ipfs.cybernode.ai/ipfs/audiences_distribution.png)

When an address hits multiple audiences, its reward is cumulative.

An amount of distributed BOOT tokens should be equal for each level within an audience.  
The amount of addresses should also be divided into levels for each audience as

[![Distribution between Levels](https://gateway.ipfs.cybernode.ai/ipfs/QmewHdVjafhaAbBYtVSEu7eVx4GLakLNRszCV8t7roUEdm/levels_distribution.png)](https://gateway.ipfs.cybernode.ai/ipfs/levels_distribution.png)

## Getting the Crowd

The most crowded audience is ETH holders and users. We identified 2 audiences: those who hold, and those who hold and transact. Following the Pareto Principle, our target was to exclude the majority of the most either inactive addresses or addresses with insignificant holdings:

| Audience         | Rule                                             | level 1  | level 2   | level 3     | Calculations                                                                                    |
| ---------------- | ------------------------------------------------ | -------- | --------- | ----------- | ----------------------------------------------------------------------------------------------- |
| Average Citizens | ETH balance > 0.12 ETH and Amount of outgoing tx | \> 4 tx  | \> 125 tx | \> 1,531 tx | [ETH Analysis](https://github.com/cybercongress/cybergift/blob/main/eth_and_tx__citizens.ipynb) |
| Average Citizens | ETH balance                                      | \> 1 ETH | \> 29 ETH | \> 485 ETH  | [ETH Analysis](https://github.com/cybercongress/cybergift/blob/main/eth_and_tx__citizens.ipynb) |

## Hunting for Content Creators

The key assumption is that NFT related actions will increase the chance of using cyberlinks because picture owners would love to make them searchable. We decided that all NFT owners deserve attention because they are on the edge of web3 technology.

Another important sub-audience is ENS and decentraLAND holders. This group is special because they value ENS and LAND. The only utility of ENS and LAND is to bind content hash. Hence they are the most desired as they prove the intention to create non trivial content.

| Audience                 | Rule                                                     | level 1  | level 2      | level 3               | Calculations                                                                                                 |
| ------------------------ | -------------------------------------------------------- | -------- | ------------ | --------------------- | ------------------------------------------------------------------------------------------------------------ |
| Masters of the Great Web | Amount of ERC721 tokens                                  | \> 0 NFT | \> 12 NFT    | \> 160 NFT            | [ERC721 Analysis](https://github.com/cybercongress/cybergift/blob/main/erc721__masters_and_cyberpunks.ipynb) |
| Masters of the Great Web | Fee spending to contracts[^1], by contract creators, ETH | \-       | ENS          | Gitcoin Kudos or LAND | [ERC721 Analysis](https://github.com/cybercongress/cybergift/blob/main/erc721__masters_and_cyberpunks.ipynb) |
| Masters of the Great Web |                                                          | \> 0 ETH | \> 0.004 ETH | \> 0.477 ETH          | [Gas Analysis](https://github.com/cybercongress/cybergift/blob/main/gas__hackers_and_masters.ipynb)          |

[^1]: including contracts created by factories only

## Attracting Astronauts

Bostrom is built using Cosmos-sdk, so attracting Cosmonauts is essential for the project health and interchain expansion. The most crowded and useful chains are Cosmos Hub, Osmosis and Terra. We followed the same Pareto Principle while filtering agents with insignificant holdings.

| Audience   | Rule         | level 1   | level 2     | level 3        | Calculations                                                                                                          |
| ---------- | ------------ | --------- | ----------- | -------------- | --------------------------------------------------------------------------------------------------------------------- |
|            |              |           |             |                |                                                                                                                       |
| Astronauts | ATOM Balance | \> 1 ATOM | \> 180 ATOM | \> 4,352 ATOM  | [ATOM, OSMO and LUNA Analysis](https://github.com/cybercongress/cybergift/blob/main/atom_osmo_luna__astronauts.ipynb) |
| Astronauts | OSMO Balance | \> 1 OSMO | \> 752 OSMO | \> 24,352 OSMO | [ATOM, OSMO and LUNA Analysis](https://github.com/cybercongress/cybergift/blob/main/atom_osmo_luna__astronauts.ipynb) |
| Astronauts | LUNA Balance | \> 1 LUNA | \> 568 LUNA | \> 12,364 LUNA | [ATOM, OSMO and LUNA Analysis](https://github.com/cybercongress/cybergift/blob/main/atom_osmo_luna__astronauts.ipynb) |

## Praying for Hackers

Developers, developers, developers... Success of any protocol is defined by it's ability to attract developers. Luckily Ethereum laid an amazing foundation for the identification of succesfull developers. The gas fee drop method is an unambiguous and provable way to give tokens to the mighty hands.

| Audience              | Rule                                                           | level 1  | level 2  | level 3    | Calculations                                                                                        |
| --------------------- | -------------------------------------------------------------- | -------- | -------- | ---------- | --------------------------------------------------------------------------------------------------- |
| Extraordinary Hackers | Fee spending to created contracts[^2] by contract creators[^3] | \> 0 ETH | \> 4 ETH | \> 254 ETH | [Gas Analysis](https://github.com/cybercongress/cybergift/blob/main/gas__hackers_and_masters.ipynb) |
| Extraordinary Hackers | Fee spending to created contracts[^2] by factory creators[^4]  | \-       | \> 0 ETH | \> 10 ETH  | [Gas Analysis](https://github.com/cybercongress/cybergift/blob/main/gas__hackers_and_masters.ipynb) |

[^2]: excluding fee from a contract creator address
[^3]: excluding contracts created by factories
[^4]: excluding factories that only created contracts when called from the creator of that factory

## Formation of Heroes Corpus

Any PoS network is run by validators. We need to attract the best validators to become heroes for us. We decided to focus on two groups. The first group is genesis Ethereum investors as they were practically successful in building the biggest GPU mining infrustructure on the planet. The second group is Eth2 stakers as they exactly match the profile we need: patience, technical skills and risk appetite.

| Audience                | Rule            | level 1 | level 2 | level 3   | Calculations                                                                                                    |
| ----------------------- | --------------- | ------- | ------- | --------- | --------------------------------------------------------------------------------------------------------------- |
| Heroes of the Great Web | Genesis         | \-      | \-      | only here | [Genesis and ETH2 Stakers](https://github.com/cybercongress/cybergift/blob/main/genesis_and_eth2__heroes.ipynb) |
| Heroes of the Great Web | ETH 2.0 Stakers | \-      | \-      | only here | [Genesis and ETH2 Stakers](https://github.com/cybercongress/cybergift/blob/main/genesis_and_eth2__heroes.ipynb) |

## Focusing Investors

We need to bring capital to the table. We decided to narrow the scope to those who invested in at least 2 meaningful ERC-20 tokens we are aware of. Surprisingly there are not so many folks out there with this trait. We assume that this is a profile of the investors we need for success.

| Audience             | Rule                                                   | level 1     | level 2  | level 3   | Calculations                                                                                                 |
| -------------------- | ------------------------------------------------------ | ----------- | -------- | --------- | ------------------------------------------------------------------------------------------------------------ |
| Passionate Investors | Number of selected ERC20 tokens >= 2 and balance of it | \> 0.01 ETH | \> 3 ETH | \> 55 ETH | [ERC20 Analysis](https://github.com/cybercongress/cybergift/blob/main/erc20__investors_and_cyberpunks.ipynb) |

## Inspiring Key Opinion Leaders

Key figures who connect Ethereum to different audiences are projects that are building on top of Ethereum. Hence giving tokens to those who are able to lead these groups is likely a good idea. So we included into the scope top token holders of selected projects. To our surprise, we found that there is very little overlap between these people, which adds to our hypothesis.

| Audience            | Rule                                     | level 1 | level 2 | level 3   | Calculations                                                                                   |
| ------------------- | ---------------------------------------- | ------- | ------- | --------- | ---------------------------------------------------------------------------------------------- |
| Key Opinion Leaders | Top 100 Holders by selected ERC20 Tokens | \-      | \-      | only here | [Top ERC20 Holders](https://github.com/cybercongress/cybergift/blob/main/erc20__leaders.ipynb) |

## Cyberpunks

There are groups that create a revolution without regard to trends. These groups include Urbit, Foam and Dragonereum. Another interesting group is Donors of Ethereum foundation. We decided to reward them for fun.

| Audience   | Rule                                 | level 1 | level 2 | level 3                         | Calculations                                                                                                 |
| ---------- | ------------------------------------ | ------- | ------- | ------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Cyberpunks | Owners of the Selected ERC20 tokens  | \-      | \-      | FOAM or GOLD                    | [ERC20 Analysis](https://github.com/cybercongress/cybergift/blob/main/erc20__investors_and_cyberpunks.ipynb) |
| Cyberpunks | Owners of the Selected ERC721 tokens | \-      | \-      | Unicorns, DRAGON or Cryptopunks | [ERC721 Analysis](https://github.com/cybercongress/cybergift/blob/main/erc721__masters_and_cyberpunks.ipynb) |
| Cyberpunks | Urbit Owners                         | \-      | \-      | here                            | [Urbit Analysis](https://github.com/cybercongress/cybergift/blob/main/urbit__cyberpunks.ipynb)               |

## Understanding Devils

We included the top 10 centralized exchanges to the gift because we want to better understand their behavior.

| Audience | Rule               | level 1 | level 2 | level 3   | Calculations                                                                                                       |
| -------- | ------------------ | ------- | ------- | --------- | ------------------------------------------------------------------------------------------------------------------ |
| Leeches  | 10 CEXes addresses | \-      | \-      | only here | [Assigning Addresses](https://github.com/cybercongress/cybergift/blob/main/manual_assigned_addresses__cexes.ipynb) |

## Excluding Fiat Brains

Addresses based on the fiat system will not be included, namely those that satisfy these two conditions:

1.  Stablecoin balance is more than sum of ETH and [selected ERC20 tokens](https://github.com/cybercongress/cybergift/blob/main/erc20__investors_and_cyberpunks.ipynb) balances.
2.  Stablecoin balance is more than 0.1 ETH.

## Prize to be the First

We've added an incentive to claim the gift early.  
There are about **4M** addresses in Gift, but we expect that only the first **~1/10** accounts can claim them.

There will be an incentive of **13x** for those who claim first, reducing to **7x** for those who come last.

[![Incentive chart](https://gateway.ipfs.cybernode.ai/ipfs/QmewHdVjafhaAbBYtVSEu7eVx4GLakLNRszCV8t7roUEdm/incentive_chart.png)](https://gateway.ipfs.cybernode.ai/ipfs/incentive_chart.png)

## Data Pipeline

[![Data Pipeline](https://gateway.ipfs.cybernode.ai/ipfs/QmewHdVjafhaAbBYtVSEu7eVx4GLakLNRszCV8t7roUEdm/data_pipeline.png)](https://gateway.ipfs.cybernode.ai/ipfs/data_pipeline.png)

## Gift Execution

[![cyberGift Execution](https://gateway.ipfs.cybernode.ai/ipfs/QmewHdVjafhaAbBYtVSEu7eVx4GLakLNRszCV8t7roUEdm/gift_execution.png)](https://gateway.ipfs.cybernode.ai/ipfs/gift_execution.png)

## Final Distribution

[Final Distribution Table](https://console.cloud.google.com/bigquery?project=cosmic-keep-223223&p=cosmic-keep-223223&d=final&t=final_distribution&page=table&ws=!1m5!1m4!4m3!1scosmic-keep-223223!2sfinal!3sfinal_distribution)

**Check your address in:**

- **web2** by the [Dashboard](https://datastudio.google.com/u/0/reporting/53e1c28b-9f10-497c-9b5b-9f2a4749450b)
- **web3** by IPFS link `gateway.ipfs.cybernode.ai/ipfs/QmWvynJ9yrfU5ju8dRSDBY7SmfEugoTyhtA5YmvSqE6Q1c/<your address>.json`  
  for example [gateway.ipfs.cybernode.ai/ipfs/QmWvynJ9yrfU5ju8dRSDBY7SmfEugoTyhtA5YmvSqE6Q1c/0x91170c80ce048e00202e7ad72f8cfab86ec9004d.json](https://gateway.ipfs.cybernode.ai/ipfs/QmWvynJ9yrfU5ju8dRSDBY7SmfEugoTyhtA5YmvSqE6Q1c/0x91170c80ce048e00202e7ad72f8cfab86ec9004d.json)

---

###### Information on the article’s previous version  

cid: [QmWZAvPVAargE2FJsgBgHJjaVZznZjuSBJrBmHnUTHJV88](https://cyb.ai/ipfs/QmWZAvPVAargE2FJsgBgHJjaVZznZjuSBJrBmHnUTHJV88)  
author: [bostrom135ca8hdpy9sk0ntwqzpzsvatyl48ptx5j359lz](https://cyb.ai/network/bostrom/contract/bostrom135ca8hdpy9sk0ntwqzpzsvatyl48ptx5j359lz)  
particle_epoch: 1658133953  

levenshtein similarity: 0.963  
cosine similarity: 1.0  

cyberrank[^1] = [3240597445](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/rank/QmWZAvPVAargE2FJsgBgHJjaVZznZjuSBJrBmHnUTHJV88)  
incoming cyberlinks count[^1] = [1](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/backlinks/QmWZAvPVAargE2FJsgBgHJjaVZznZjuSBJrBmHnUTHJV88?pagination.page=0&pagination.per_page=1000)  
outgoing cyberlinks count[^1] = [3](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/search/QmWZAvPVAargE2FJsgBgHJjaVZznZjuSBJrBmHnUTHJV88??pagination.page=0&pagination.per_page=1000)  

[^1]: Metrics snapshot was taken between blocks [4102944](https://cyb.ai/network/bostrom/block/4102944)-[4102984](https://cyb.ai/network/bostrom/block/4102984)

