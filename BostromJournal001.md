# [Bostrom Journal](https://cyb.ai/network/bostrom/contract/bostrom1q7zd65fsx8hvh788lyla8wxemlesf0djrhe0wa)

Issue 1, 1656576418 or 2022-06-30

Editor-in-chief: [maxim-uvarov](https://cyb.ai/network/bostrom/contract/bostrom173u67p9zefy24y0ze3v3dwh0upsge20av4hjpm)

The latest version of Bostrom Journal can be found on [github](https://github.com/learn-to-teach-cyber/bostrom-journal).

## Table of contents

<!-- TOC -->

- [Preface ~](#preface-)
- [Intro to Bostrom Blockchain ~](#intro-to-bostrom-blockchain-)
  - [Bostrom - the short definition ~](#bostrom---the-short-definition-)
  - [Purpose of the Bostrom network ~](#purpose-of-the-bostrom-network-)
  - [Capabilities of the Bostrom Blockchain ~](#capabilities-of-the-bostrom-blockchain-)
  - [IPFS, Content-addressing mechanism ~](#ipfs-content-addressing-mechanism-)
  - [Bostrom is a full refactoring of the Euler network ~](#bostrom-is-a-full-refactoring-of-the-euler-network-)
- [Knowledge graph ~](#knowledge-graph-)
  - [Particles ~](#particles-)
  - [Cyberlinks ~](#cyberlinks-)
  - [Neurons ~](#neurons-)
  - [Cyberrank ~](#cyberrank-)
- [Bostrom tokens ~](#bostrom-tokens-)
  - [BOOT token](#boot-token)
  - [HYDROGEN token](#hydrogen-token)
  - [VOLT token](#volt-token)
  - [AMPERE token](#ampere-token)
  - [TOCYB token ~](#tocyb-token-)
  - [Investminting - definition and mechanics ~](#investminting---definition-and-mechanics-)
- [Important blockchain concepts and their meaning ~](#important-blockchain-concepts-and-their-meaning-)
  - [State machine ~](#state-machine-)
  - [Transactions and their cost in Bostrom ~](#transactions-and-their-cost-in-bostrom-)
  - [Staking mechanism - encouraging desired behavior in agents heroes and neurons ~](#staking-mechanism---encouraging-desired-behavior-in-agents-heroes-and-neurons-)
- [Apps built on Bostrom, for Bostrom ~](#apps-built-on-bostrom-for-bostrom-)
  - [go-cyber ~](#go-cyber-)
  - [cyb.ai ~](#cybai-)
  - [cyberindex ~](#cyberindex-)
  - [cybernode](#cybernode)
  - [cyberdbot ~](#cyberdbot-)
  - [cyber-js ~](#cyber-js-)
  - [cyber arbitrage py ~](#cyber-arbitrage-py-)
  - [Cybernode.ai ~](#cybernodeai-)
  - [Bostrom dashboard by Bro-n-Bro ~](#bostrom-dashboard-by-bro-n-bro-)
  - [cyber CLI helper ~](#cyber-cli-helper-)
- [Cyb.ai functionality ~](#cybai-functionality-)
  - [Cyb.ai: intro, mechanics ~](#cybai-intro-mechanics-)
  - [Search on Cyb.ai ~](#search-on-cybai-)
  - [My Robot ~](#my-robot-)
  - [Teleport ~](#teleport-)
  - [Dyson Sphere ~](#dyson-sphere-)
  - [HFR ~](#hfr-)
  - [My Energy ~](#my-energy-)
  - [Senate ~](#senate-)
  - [Progs ~](#progs-)
- [Bostrom Blockchain philosophy ~](#bostrom-blockchain-philosophy-)
  - [The Great Web ~](#the-great-web-)
  - [Markdown ~](#markdown-)
- [Bostrom cybernomics ~](#bostrom-cybernomics-)
  - [BOOT and TOCYB genesis allocation ~](#boot-and-tocyb-genesis-allocation-)
  - [cyberGift ~](#cybergift-)

<!-- /TOC -->

## Preface [~]()

This document is intended to provide the brief and necessary information for understanding the potential of Bostrom's blockchain, explaining its features and capabilities. I am not a founder or developer of Bostrom, though I had the luck to communicate with them and develop my understanding of Bostrom's mechanics, which I am sharing here.

There are documents about Bostrom's blockchain written by Bostrom's founders or the cyberCongress team:

- Whitepaper [~](QmUbFsWDVnVBSisBTZpkQHtEMqpQkdh93EWpkqouQSYmuW), [github](https://github.com/cybercongress/cyber/blob/master/computing-the-knowledge/computing-the-knowledge.md)
- Cyber roadmap [~](QmSBYCCYFNfHNQD7MWm4zBaNuztMaT2KghA2SbeZZm9vLH)
- Particles by mastercyb (cofounder of Bostrom) [~](https://cyb.ai/network/bostrom/contract/bostrom1d8754xqa9245pctlfcyv8eah468neqzn3a0y0t)
- Particles by cyberCongress [~](https://cyb.ai/network/bostrom/contract/bostrom1xszmhkfjs3s00z2nvtn7evqxw3dtus6yr8e4pw)
- [Cyber's story](https://cyb.ai/genesis)
- Docs on go-cyber (`.md` files) scattered in to the folders of go-cyber repository on the [github](https://github.com/cybercongress/go-cyber)

If you are interested in researching Bostrom, all of these sources can give you a lot of information. Nevertheless, I believe that this manual is a good starting point.

## Intro to Bostrom Blockchain [~]()

### Bostrom - the short definition [~](QmbvXoTA8nqZGzzCtQtw7rrrNrTRxyRSHsJPa5ZsPLHDG7)

Bostrom is a superintelligence project with a permissionless knowledge graph at its core built on blockchain (cosmos-SDK) and content addressing mechanism (with the current implementation of IPFS protocol).

### Purpose of the Bostrom network [~](QmX3owfDdvVUAr2J58nrdBQShBH8be6iwv9NZwnTAjTdjf)

Bostrom allows adding knowledge (creating cyberlinks between particles) to the knowledge graph verifiably. By "verifiably" we mean that it is guaranteed by blockchain design that the holder of a particular private key added specific content into the blockchain at the known time. And technically correct to say that holder of the exact private key signed files (uniquely identified by their hashes) by writing this information into Bostrom blockchain.

The knowledge graph is a directed weighted graph between particles (CIDs or Content-ID of files, also known as content addresses, IPFS-hashes, IPFS-links).

Cyberlinks are the edges of the knowledge graph, particles are the vertexes (aka nodes).

In order to create cyberlinks in Bostrom, user accounts (so-called neurons) must have VOLT and AMPERE tokens.

By definition, created cyberlinks cannot be deleted. This means, among other things, that they will always be taken into account in cyberrank (until "forgetting" or "pruning" functions are introduced).

### Capabilities of the Bostrom Blockchain [~](QmREDsSSALhBnPCPXKYSi9piknyqEvCErTAGvpWyMCWAmZ)

- new way of sharing, storing, ranking, and searching for information;
- platform for building on top of these ☝;
- social platform;
- economic environment;
- ground for AI;
- and much more that can be imagined and done.

Site [cyb.ai](https://cyb.ai) is an application built using the Bostrom Blockchain.

On [cyb.ai](https://cyb.ai) you can already create [cyberlinks](https://cyb.ai/search/cyberlink), search the [graph](https://cyb.ai/oracle), rank using the [Relevance machine](https://cyb.ai/search/rm), share and store information, [earn rewards](https://cyb.ai/halloffame), [investmint](https://cyb.ai/mint), and [tweet](https://cyb.ai/search/tweet).

### IPFS, Content-addressing mechanism [~](QmQSDwNXZuLVoX5i9eUMbS5f6EYvX3miX9DUy6BCSH2Jh1)

IPFS (interplanetary file system) is a distributed (decentralized) file system within which files are stored on network members' computers. Files are received by their CID (cryptographic hash, particle in Bostrom's terminology) using software that supports IPFS protocol.

Files are downloaded from network participants' nodes. Therefore, the more devices have the file, the higher chances it can be downloaded (and potentially faster).

IPFS does not guarantee the safety or retrievability of the files.

### Bostrom is a full refactoring of the Euler network [~](QmYaf3J118vExRV6gFv2CjwYCyHmzV6Z9ACV7avWb652XZ)

Bostrom blockchain is the result of 5 year's work and research of [cyber~congress](https://github.com/cybercongress/) team.

Before Bostrom network (which itself had 5 testnets), there were 6 testnets known as Euler network.

Bostrom is a full refactoring of the Euler network with a strong focus on Superintelligence. It includes a new distribution model, economics, improved ranking, and some superintelligent abilities.

Founders perceive Bostrom as a canary network in the same way that Kusama relates to Polkadot. The Bostrom knowledge graph tends to be a bootstrap hub for domain-specific networks of Cyber. The network works as a testbed for Interplanetary Knowlege Protocol communications and different experiments, including Moon development. Consider Bostrom a network with high risks but of market value.

The key differences within the Bostrom and Cyber network are to be discussed [here](https://cyb.ai/search/bostrom%20vs%20cyber). The launch of the Bostrom network is the inception of an ecosystem.

## Knowledge graph [~](QmYPEehJdgxfTK3x5KQt56HbFEk8RXUmceqaTaseoPMUR6)

The knowledge graph of Bostrom blockchain consists of pairs: each source particle is connected to a destination particle via cyberlink. So it can be encoded as `source_particle - destination_particle`, which reduces the complexity of entering data (compared to triples, commonly used in modern knowledge graph applications). Cyberlinks combined with markdown marked up text files, where various conventions on connections between particles could be used, provide the necessary flexibility to Bostrom's knowledge graph, adapting it to a vast variety of possible usages.

### Particles [~]()

A particle is a hash of the file in IPFS network. A file can be retrieved from IPFS network using its hash. Particles are written into Bostrom blockchain. But, cyb.ai application is built to render the content of cyberlinked files.

### Cyberlinks [~](QmewU6pKFtGc3Fm8XsMxS3bA2xf3swQwuPuepxebp2WNMH)

A cyberlink is a link between two particles registered in Bostrom blockchain by a particular neuron.

To cyberlink - to create a cyberlink between two particles.

### Neurons [~](QmV1JLxPMeWuZFYWYx9GGRQLJTRMuBCxxU6s1jEuShsFn4)

A neuron can be:

- a private key holder (who can create cyberlinks in the knowledge graph)
- a cosm-wasm contract (autonomus program)

### Cyberrank [~]()

Cyberrank is a default rank calculated on each particle. It's calculated as a weighted Pagerank, where every cyberlink has the weight of `ampere-per-cyberlink`. `ampere-per-cyberlink` is calculated for each neuron by dividing his ampere balance by number of his cyberlinks.

Cyberrank is calculated by using GPU of the node. Cyberrank is deterministic, so it is used in Bostrom's blockchain consensus.

## Bostrom tokens [~](QmbiZAm2QV5AXg6kW74hsavU4QtVc98AyPzu9VP7Fd6YQR)

There are several native tokens in the Bostrom network: BOOT, HYDROGEN, VOLT, AMPERE, TOCYB. Each of its own usage.

All the tokens can be in two states: frozen and liquid (except TOCYB which is always in liquid state).

When tokens are in liquid state they can be:

- transferred to other addresses in the Bostrom or other blockchains of Cosmos network;
- swapped to other tokens using liquidity pools. Other tokens can be non-native Bostrom tokens transferred by IBC protocol from other blockchains of the Cosmos network

### BOOT token

BOOT is the main token of Bostrom. The token's name BOOT symbolizes the BOOTloader nature of the Bostrom network for the future Cyber network.

With BOOT one can:

- `hire a hero` (to delegate tokens to a validator), being paid rewards in return (risk fee);
  - for each staked BOOT a HYDROGEN is minted (with a 1 to 1 ratio);
- pay for network transactions (pay for gas). Though now, many validators accept transactions with 0 gas fee;
- vote for protocol change and public goods.

### HYDROGEN token

With HYDROGEN one can:

- `investmint` HYDROGEN for a limited period to produce VOLT and AMPERE tokens;
- exchange it back for delegated BOOT to transfer BOOT into a liquid state.

### VOLT token

- is needed to create cyberlinks;
- amount of Volt tokens on a balance of the selected neuron regulates how many cyberlinks per day the neuron can submit.

Each Volt token on the neuron's balance allows creating 1 cyberlink per day. The ability to create cyberlinks is restored within a day.

If the network is underloaded, one can produce more cyberlinks (up to 4 cyberlinks for each Volt on balance per day).

### AMPERE token

- is needed to create cyberlinks;
- amount of Ampere tokens on a balance of the selected neuron is used for `ampere-per-cyberlink` metric, which is used in cyberrank algorithm.

The more Ampere tokens the neuron has, the higher his cyberlinks would be ranked. Cyberrank is recalculated for each `cycle` so that the changes in the amount of Ampere tokens on the neurons' balances that produced cyberlinks would influence the cyberrank of the whole graph. It's reasonable to think about Ampere tokens as a measure that characterizes the impact of cyberlinks created from the account on the knowledge graph.

### TOCYB token [~](QmfGPCSpPCRTsBw2g6wqrLkHaCwtFChXeHADju5RrYu9EB)

TOCYB token is a token of a future [Cyber](https://cyb.ai/search/cyber) network. Everyone who has [TOCYB](https://cyb.ai/token/TOCYB) will be able to convert it 1 to1 into CYB tokens through the private exodus. The contract will be developed by [cyber~Congress](https://cyb.ai/search/cybercongress).

### Investminting - definition and mechanics [~](Qmezuhrqm7P8u8PwHhoq5EjWmnk3VxGju9DVUT9pWmeNaV)

In order to obtain resource tokens: A (AMPERES) and V (VOLTS) one should investmint H (HYDROGEN).

The term `investminting` is composed of `minting` (producing new tokens) and `investing` (putting capital into something for a period of time to make a profit).

Investminting has the following features:

1. The period chosen for investminting Hydrogen tokens has a proportionate effect on the amount of Ampere and Volt tokens received.
2. The amount of Hydrogen tokens investminted has a proportionate effect on the amount of Ampere and Volt tokens received.
3. Hydrogen, Ampere, and Volt tokens become liquid after the investminting period has ended.
4. Before the tokens become liquid, they perform their resource functions for the account - Amperes increase links' rank (their place in the search result), Volts may be used for producing cyberlinks.
5. Maximum investminting period (`investmint_max_period`) is limited. However, it increases every 547 days (`horizon_period_init`).
6. The amount of Amperes and Volts available for investminting per time unit is determined by the following parameters `ampere_mint_rate` and `volt_mint_rate`. These parameters' values are halved every 18 months to align with Moors law(~547 days). (`ampere_base_halving_period`, `volt_base_halving_period`). At the beginning of the network's lifecycle, one can investmint more Amperes and Volts than later.

Amperes and Volts are finite due to fundamental constraints in computing resources. They cannot be replenished in case the investminting has been missed. So if you didn't investmint your H, you would miss the opportunity to have Amperes and Volts.

Halving occurs every 567 days, which means half as many tokens can be minted per time unit compared to the before halving amount.

## Important blockchain concepts and their meaning [~]()

### State machine [~]()

At its core, a blockchain is a replicated deterministic state machine.

A state machine is a computer science concept whereby a machine can have multiple states, but only one at any given time. There is a state, which describes the current state of the system, and transactions, that trigger state transitions.

Given a state S and a transaction T, the state machine will return a new state S'.

In a blockchain context, the state machine is deterministic. This means that if a node is started at a given state and replays the same sequence of transactions, it will always end up with the same final state.

A validator (the hero in Bostrom terminology) is a server with running blockchain software (node).

Each node contains a blockchain replica (transaction log) that allows computing the system’s current state for each block. Nodes agree among themselves on a current state according to the Tendermint consensus protocol.

### Transactions and their cost in Bostrom [~](QmYYB4EEb9KUagqotDWFYtCUsmsFqhNtneqALdTTrKut1t)

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
- etc

When signing a transaction, the neuron should set an amount of `gas` for executing the transaction and the `gasPrice` cost of the gas in BOOT.

Gas is the smallest unit or pricing value required to perform a transaction. Different transactions require different amounts of gas. The gas amount for a transaction is calculated as it is being processed.

Each hero sets a `min-gas-price` value and will only include transactions with a `gasPrice` greater than their `min-gas-price` value.

The transaction fees are the product of gas and `gasPrice`. The higher the `gasPrice` fees, the higher the chances that a transaction will get included in a block.

As for now (the network is still underloaded), many heroes accept transactions at a zero-cost gas.

There is no fee check for transactions that consist of cyberlinks. Though `gas` amount still needs be provided. This means that the creating cyberlinks is regulated only by VOLT tokens balance, and doesn't require of spending any BOOT tokens.

### Staking mechanism - encouraging desired behavior in agents (heroes and neurons) [~](Qma2tQuYBhM5vGFq1cpUhyXPU57UVcvLiUNuw9hH63m9Cb)

Bostrom is a proof-of-stake blockchain. Validators ensure its functioning.

Bostrom is designed to economically encourage (incentivize) heroes and neurons to perform useful functions for the system.

#### Valuable functions of Bostrom's agents (Heroes and Neurons)

Heroes are responsible for :

- adding blocks of transactions to the blockchain (and thus changing its state);
- distributing state of a blockchain via various APIs.

Neurons' valuable functions are:

- maintaining a desired balance between `staked` and `liquid` tokens (`goal_bonded` parameter is inteded to regulate this balance);
- distributing `staked` tokens to validators who perform their functions properly thus preventing `slashing`;
- using H token (HYDROGEN), which can be obtained in exchange for a `staked` BOOT, for investminting Ampere and Volt tokens (and then using As and Vs for creating сyberlinks, i.e. training Bostrom);
- deciding on the evolution of the network using the governance portal (`senate`).

#### The economic incentivization mechanism of agents in Bostrom

The economic incentivization mechanism of heroes and neurons in Bostrom includes rewards and penalties.

Blockchain is programmed to mint new BOOT tokens in each block to pay rewards. The `inflation_rate` coefficient determines the number of new tokens produced. `Inflation_rate` coefficient depends on the share of `staked` BOOTs:

- if the `staked` percentage of BOOTs is less than the `goal_bonded` parameter, then the `inflation_rate` coefficient will be increasing for each block till it hits the `inflation_rate_max` value. The higher the `inflation_rate`, the more rewarding is the `stake`;
- if the `staked` percentage of BOOTs is more than the `goal_bonded` parameter, then the `inflation_rate` coefficient will be decreasing for each block till it hits the `inflation_rate_min` value, thus signaling to search for another way of profiting from BOOTs

New tokens are distributed between neurons who `staked` their tokens and heroes proportionally to their `staked` tokens.

Heroes receive a set fee.

Neurons are rewarded for deligating (`staking`) tokens to heroes and bearing `slashing` risks (reducing `stake` by the penalty amount), and also risks of skipping blocks without getting any rewards (while the hero committed violation remains in the `jail` state).

Neurons' risks are that the heroes, to whom the former have delegated their tokens, may commit a violation of two kinds:

- Downtime (skipping new blocks computing).
- Double sign (using the same private key of the validator on two different servers).

`slashing` is a feedback mechanism from the blockchain to heroes, as it forces neurons to redistribute their `stakes` in favor of heroes, who perform their functions properly.

When a particular hero is caught violating rules, that hero is put into the `jail` state, which means no rewards are produced for the tokens deligated to him.

All the violations and the penalties are noted in the blockchain settings and are executed according to the Tenderimnt consensus protocol.

In order to hedge `slashing` risks one may distribute `stakes` between several heroes.

## Apps built on Bostrom, for Bostrom [~]()

### go-cyber [~](Qmd4suKEMpRKuFkEeGbsHqDAKJfSQdNkkxPie6cfVacm8X)

[go-cyber](https://github.com/cybercongress/go-cyber) - implementation of [cyber protocol](https://github.com/cybercongress/cyber) in Go. It is the node app itself. And it can be used as a command-line interface (CLI) for interacting with the local or remote node.

Each hero runs his own node of go-cyber.

On GitHub there is an informative [manual](https://github.com/cybercongress/go-cyber/blob/main/docs/ultimate-commands-guide.md) on how to use go-cyber cli.

### cyb.ai [~](QmSDCFfY1S2UxoDkhbAtFbnm2vp97eefNyb5NQKpXENwDj)

[Cyb.ai](https://cyb.ai) - most functional application built on Bostrom for interacting with Bostrom.

Code is available on the [github](https://github.com/cybercongress/cyb).

Cyb.ai functionality is explained in the it's own chapter below.

### cyberindex [~]()

Indexer is written on go language for Cyber's networks. [Github](https://github.com/cybercongress/cyberindex)

Supported:

- blocks and precommits
- transactions and messages
- validators and their uptime
- accounts and their balances
- cyberlinks and particles
- resources and supply
- grid routes
- wasm contracts
- advanced views for analytics

### cybernode

Cybernode is the tool to deploy, operate, maintain, and monitor major protocols required for next-generation browsers. [Github](https://github.com/cybercongress/cybernode)

### cyberdbot [~](QmWjcFRoVPeYXWug6NsoWFGA8PWqfFWcJ6G2HFNLf5QyXR)

[Open source](https://github.com/Snedashkovsky/cyberdBot) telegram bot for Cyber.

### cyber-js [~](QmcwgfBG21fQ3sqiQhwnvFmadijd2GYZDF81QyQLXoJtEM)

[Javascript library](https://github.com/cybercongress/cyber-js) for [cyber protocol](https://github.com/cybercongress/cyber)

### cyber arbitrage py [~](QmNyxAQcozrkb2Ekr9EMUVZUXQduUGazYwfRTZtvxnjUwd)

[Cyber arbitrage](https://github.com/Snedashkovsky/cyber-arbitrage/blob/main/search_arbitrage.ipynb) is a jupyter notebook that interacts with CLI to obtain information on the state of liquidity pools balances on Bostrom.

There you can search for the best arbitrage options in Bostrom. Jupyter notebook retrieves data on pools' state from CLI and displays it in a table form.

### Cybernode.ai [~](QmRBxwqwNhLUjnsKwm8giYNVv4wwa77XUk51bYoo67tbah)

[Cybernode.ai](https://cybernode.ai) Node monitor of cyberCongress public infrastructure built on to of cybernode.

- [Users by cohorts by activity](https://cybernode.ai/grafana/d/SdWCR028z/analytics?orgId=2)
- [Nodes technical statistics](https://cybernode.ai/grafana/d/cyber_stats/computer?orgId=2&from=now-30d&to=now)

#### Backend services provided by cybernode.ai

- Bostrom [RPC](https://rpc.bostrom.cybernode.ai)
- Bostrom [REST](https://lcd.bostrom.cybernode.ai)
- Bostrom [index](https://index.bostrom.cybernode.ai)
- Bostrom [websocket](wss://rpc.bostrom.cybernode.ai/websocket)
- Cosmoshub-4 [RPC](https://rpc.cosmoshub-4.cybernode.ai)
- Cosmoshub-4 [REST](https://lcd.cosmoshub-4.cybernode.ai)
- Ethereum [RPC](https://rpc.ethereum.cybernode.ai)
- Ethereum [websocket](wss://ws.ethereum.cybernode.ai)
- Ethereum rinkeby [RPC](https://rpc-rinkeby.ethereum.cybernode.ai)
- Ethereum rinkeby [websocket](wss://ws-rinkeby.ethereum.cybernode.ai)
- IPFS [gateway](https://gateway.ipfs.cybernode.ai)

### Bostrom dashboard by Bro-n-Bro [~]()

Bostrom stats with the price of token dynamics on [Grafana](https://monitor.bronbro.io/d/bostrom-stats/bostrom-stats?orgId=2&from=now-30d&to=now) by Bro-n-Bro hero.

### cyber CLI helper [~](Qmdo6FeBhcu1rW3bC2eu62g9sQifgAZu1wBh47UKgnTdbN)

[Google sheets template](https://docs.google.com/spreadsheets/d/1S58novA61H9V0EgzToO3LSIZ0cFHCiGtmnUCYVE6ZC8/edit?usp=sharing) for CLI cyber configuration.

You can make a copy of the spreadsheet and fill in blue cells with your inputs.

To contribute - request write rights.

## Cyb.ai functionality [~]()

### Cyb.ai: intro, mechanics [~](QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m)

[Cyb.ai](https://cyb.ai) - is a WEB interface to the Bostrom blockchain developed by the cyberCongress team. Among Cyb.ai's many functions are:

- receiving data on cyberlinks recorded by Bostrom blockchain from the node;
- creating cyberlinks;
- receiving and sharing objects in the IPFS network using library [ipfs-js](https://github.com/ipfs/js-ipfs).

### Search on Cyb.ai [~](QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m)

There is a search bar in cyb.ai. When a user enters a query in the search bar cyb.ai computes the `IPFS CID v0` of a text file with the search query contents. `IPFS CID v0` is `sha-256` hash with prefix `Qm` and here is the example: `QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m`. After that, cyb.ai requests the go-cyber node:

`https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/search/QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m`.

Similar results might be recieved by using go-cyber cli:

`cyber query rank search QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m --chain-id bostrom --node https://rpc.bostrom.cybernode.ai:443`

If there are cyberlinks originating from the search query's IPFS hash, then the node returns particles sorted by cyberrank, cyb.ai using IPFS-JS node retrieves files from IPFS and presents these results.

Thus, the search results in cyb.ai are the files stored in IPFS (received by the browser and rendered on the page) with the IPFS hashes that were cyberlinked to the IPFS hash of the text entered into the search bar.

If no cyberlinks had been created for a text file hash of a particular search query, the cyb.ai displays particles linked to the hash of the text file with content "0" on the search result page.

Account avatar is an image file in IPFS. The hash of the image file is cyberlinked by a text file "avatar"'s hash by the current neuron.

Neurons message in a particular Sense account's feed is a cyberlink between the text "tweet" and the IPFS hash of the message file.

### Creating cyberlinks on cyb.ai [~]()

To create a cyberlink on cyb.ai:

1. Enter the text of the source particle (or IPFS hash of the source particle) into the search bar and press enter
2. Enter the text of the destination particle (or IPFS hash of the destination particle, or attach file of the destination particle using the clip button) into the field at the bottom of the screen ("add keywords, hash or file" field) and hit "Cyberlink" button.
3. Keplr chrome extension should pop up, where you need to confirm creating cyberlink.

### My Robot [~](QmSfnbtVvAQxLBtD9wfkn5XexGPPkofcT7pS7379WoXqVW)

On the "My Robot" page you can see the information about the state of your IPFS local node (that uses the cache of your browser), connected accounts, their addresses and balances of tokens on them.

### Teleport [~](QmSBDA7qQEbV6sQRmzbj3VuiXGG9g9vpbLWC9DWFtzq9mh)

On the teleport page you can exchange your tokens using swap, explore [existing pools](https://cyb.ai/teleport/pools) or add and sub liquidity to liquidity pools.

### Dyson Sphere [~](QmS1jB9j7LHJo7iyYQc3MErKHEGvgXkt67xrqH44dzQdRt)

You can delegate (stake) BOOT by hiring a Hero in the [Dyson Sphere](https://cyb.ai/halloffame). That will grant you Hydrogen in the amount equal to staked BOOT. Also, you can see the information regarding heroes.

- [hire & fire Heros](https://cyb.ai/halloffame)

### HFR [~](QmReuU5gTyEGZJTk3nxs5ViJjMMvYVoRzYr9j4r6TeKjFX)

In this reactor, [Amperes](https://cyb.ai/token/A) or [Volts](https://cyb.ai/token/V) can be [extracted](https://cyb.ai/mint) from [hydrogen](https://cyb.ai/token/H) without burning the hydrogen itself.

You can mint [Amperes](https://cyb.ai/token/A) and [Volts](https://cyb.ai/token/V) by locking (freezing) your [Hydrogen](https://cyb.ai/token/H).

You can get Hydrogen by delegating BOOTs to Heroes in the [Dyson Sphere](https://cyb.ai/halloffame).

- Use the HFR menu to adjust freezing parameters and [investmint](https://cyb.ai/mint)

### My Energy [~](Qmdfb54D92tzTMLKNqVZuo74aN5yUHnk6kwcVK9Js6PTqn)

Here you can check your energy, route Amperes and Volts to your friends:

- [check energy](https://cyb.ai/grid)
- [route](https://cyb.ai/grid/outcome)

### Senate [~](QmcpFmrqqaiJdCoS9S83w3uCEvbvT4y8BRQDTB9KF8XhFW)

Senate is the main arena for performing and improving Bostrom's governance.

You can submit your proposals and/or vote on existing ones on the [senate](https://cyb.ai/senate) page. All active, accepted and rejected proposals are also listed there. You can check for more information and statistics by clicking on each of the proposals.

#### Bostrom's Governance [~](QmY4X4SkVBkoUGZdTzdcW7SKY8t4ULj5GJBRcRr4UMyahp), by

The governance process of [Cyber networks](https://cyb.ai/search/computing%20knowledge) is focused on the [evolution](https://cyb.ai/search/cyber%20evolution) of its code and is based on 3 methods:

- [self-reflection](https://cyb.ai/search/cyber%20self-reflection)
- [investments](https://cyb.ai/search/cyber%20investments)
- [adaptation](https://cyb.ai/search/cyber%20adaptation)

Everyone can submit proposals.

A proposal can become active if [minimum deposit](https://cyb.ai/network/bostrom/parameters/gov) is submitted by network participants in the [max deposit period](https://cyb.ai/network/bostrom/parameters/gov).

During [voting period](https://cyb.ai/network/bostrom/parameters/gov) proposal have to reach [quorum](https://cyb.ai/network/bostrom/parameters/gov). The threshold is defined as the minimum proportion of Yes votes excluding Abstain votes for the proposal to be accepted. More details in [cosmos-sdk docs](https://docs.cosmos.network/master/modules/gov/).

### Progs [~](QmVkLMwUbQFt1pHzRRZW3QqfepskT3v9b5Eb2ETU5TkYDD)

Progs are autonomous programs who live in some metastable information environment such as blockchain and is able to act on self behalf and self interest.

Technically prog is a smart contracts without admin control which is able to schedule next call in a way to have gas for a scheduling the next call.

> Until a prog is able to prog a prog is living.

In Bostrom smart contracts earn 80% from spent gas. This gas remains on prog's balance and is in possession of a smart contract logic. Bostom has default mode network that allows progs compete for computing space by bidding for scheduling calls.

Default mode network or [dmn](/search/dmn) is highly experimental and cutting edge functionality. You can discover [API](https://lcd.bostrom.cybernode.ai/swagger/#/Query/Thought) and [implementation](https://github.com/cybercongress/go-cyber/tree/main/x/dmn). Docs and examples are coming!

## Bostrom Blockchain philosophy [~]()

### The Great Web [~](QmUamt7diQP54eRnmzqMZNEtXNTzbgkQvZuBsgM6qvbd57)

The Great Web is a web that lasts. It is based on three simple ideas: access, immutability, and universality.

#### Access

Anyone who can store secret and compute digital signatures can use the Great Web. Humans, robots, animals, plants, and even mycelium can use it without discrimination and limits.

#### Immutability

Particles in the Great Web can survive through spacetime thanks to the content addressing mechanism. So the Great Web can last indefinitely.

#### Universality

The Great Web is built by connecting particles through cyberlinks. The result is universally acceptable language, dynamic but understandable and acceptable by anyone.

### Markdown [~](QmXQ4k4ciK5ieaSwtccmH9mm4QdPS6Spd21DTqLFrEwDWR)

Markdown markup is readable by humans and easily parsable by machines. It can be written with convenience using basic text editors or simple scripts. Documents written in markdown have all the necessary formatting options and are small in size. It makes markdown markup essential technology, which compliments Bostrom's capabilities greatly.

The content of text particles in Cyb.ai is rendered in Markdown. Cyb.ai uses [ReactMarkdown](https://www.npmjs.com/package/react-markdown), [remarkGfm](https://www.npmjs.com/package/remark-gfm) JS packages to render markdown.

You can check how your post will look like on cyb.ai before posting [here](https://markdown-it.github.io/).

## Bostrom cybernomics [~]()

### BOOT and TOCYB genesis allocation [~](QmVPgNeay23Ae5itAamMcr4iEAUKuhw5qD9U1zNqN4gpew)

The following information is a concise rundown explaining
how genesis BOOT and TOCYB have been allocated.

![genesis-by-audience](https://ipfs.io/ipfs/QmcVU9ifetBuaZ6dfwAbEqSBeyNxCvAs4tfAXfehcpasK2)

#### Details

![genesis-details](https://ipfs.io/ipfs/QmbfnQpkSH3AJoG8mVtGMVxPNspvxSkzFu5zcpRKusjS8P)

#### Gift

70% of supply is allocated to the [Gift](https://cyb.ai/network/bostrom/contract/bostrom1qs9w7ry45axfxjgxa4jmuhjthzfvj78sxh5p6e). It is claimable in the [portal](https://cyb.ai/portal).

- [presentation](https://cyb.ai/ipfs/QmQd2migYNL1Mb7CHhPEdz99we2a5SeRf3kUuV1Lx1muVE)
- [research](https://github.com/cybercongress/cybergift)
- [implementation](https://github.com/cybercongress/cw-cybergift)

#### cyberCongress

cyberCongress is supranational community. 11.6% is owned by cyberCongress.

cyberCongress operations are public:

- [multisig in Bostrom](https://cyb.ai/network/bostrom/contract/bostrom1xszmhkfjs3s00z2nvtn7evqxw3dtus6yr8e4pw)
- [Aragon in Ethereum](https://client.aragon.org/#/cybercongress/0xa0a55e68dc52b47f8a9d5d05329fab5bdabffb14/)

cyberCongress as a community led launch of Bostrom. A detailed strategy of cyberCongress fund management will be published soon.

#### Investors

5 public rounds attracted 91 individuals. Thanks to them the project was able to flourish during the 5 years prior to launch. More than ~5000 ETH has been spent on the project.

#### Senate

5.1% lives in the common goods pool of the [Senate](https://cyb.ai/senate). Every BOOT holder decides where these funds could be allocated.

#### Cyberpunks

During Game of Links the [Euler foundation](https://client.aragon.org/#/eulerfoundation/0x34291feae53ad4e155a20de02585eb115ef5d373/) was created. Those who created it got [GOL tokens](https://etherscan.io/address/0xF4ecdBa8ba4144Ff3a2d8792Cad9051431Aa4F64).

The Euler foundation will transform into the Great Web Foundation. 5% of BOOT and TOCYB genesis stake is under management of GOL token holders. Currently cyberCongress is a [key holder](https://cyb.ai/network/bostrom/contract/bostrom1ha4pw9w2qgc2ce9jwfrwrmaft5fneus58nqwev), but only GOL holders can decide on the future of these funds.

Those who create The Great Web foundation are true cyberpunks.

#### Inventors

The project exists thanks to the passions of [@mastercyb](https://cyb.ai/network/bostrom/contract/bostrom1gxhs5wzam5rlgf6cs0lkme400ut64d4ncpfs2h) and [@cyberhead](bostrom16230lc9r27vrxlzd4wlvcz2l66quzj84vlkxc5). They got 1% each.

#### Heroes

Before Genesis, a group of heroes helped to run and test 6 euler and 6 bostrom tesnets. Overall 142 individuals got 0.6% from genesis for their work.

#### Hackers

9 individuals earned different grants and bounties for outside code colaboration.

#### Masters

During Game of Links 332 individuals helped to test key mechanics of superintelligence. Thanks to their work cyberCongress was able to identify a lot of design problems.

### cyberGift [~](Qmcgoy9bV6zsqnzoLB4YunEWXadavKMXKgvmUdToh2Nr3E)

The purpose of this research is to inspire at least 100k power-users of web3 to join the force of learning
Superintelligence. To achieve this, we are going to gift 70% of the Bostrom genesis tokens BOOT to agents of Ethereum
and Cosmos who are capable of contributing their best to the quality of the knowledge graph. First, we started
by highlighting key audiences for establishing network effects and tackling basic chicken and eggs. Next, we balanced
out the participation of key actors by splitting them into levels and adjusting allocations within the groups.
Then we applied a filter in order to remove toxic fiat brains from the collective thought process. Finally, we added
a crucial incentive to act quickly.

The research results are represented by reproducible scripts which output addresses and balances which will be loaded
to the claim CosmWasm contract after the launch of Bostrom.

Data source is [BigQuery crypto-ethereum dataset](https://console.cloud.google.com/bigquery?d=crypto_ethereum&p=bigquery-public-data&page=dataset&project=cosmic-keep-223223)
by [Blockchain ETL](https://github.com/blockchain-etl).

Research is done on the proposal basis. We hope this research can help pioneer
a new wave of thinking in decentralized marketing.

#### Connecting the Dots

The biggest problem in bootstrapping a blockchain ecosystem from scratch is that it is not enough to attract just users.
Established network effects exist between four key groups:

<img src="img/network_effects.png" width="50%" height="50%" alt="Network Effects">

Hence we have to understand how to attract all these citizens simultaneously in order to target healthy organic growth.

In our case that would not be enough. First, Cyber is a content-oriented project. We need to understand how
to add content creators to the soup. Second, information on the project has to be propagated somehow to all these guys,
so key opinion leaders have to be incentivized. Third, as the Cyber project heavily relies on the interchain idea we
have to attract the community behind IBC technology. We also want to add some fun by giving the power to the guys behind
weird cyberpunk ideas. Finally, we want to check the credibility of the most trusted liquidity hubs.

#### Audience Rules

The initial conditions for the allocation of classes were selected based on the analysis of web3 user activity and the need to cover the most web3 power-users.  
All distribution rules between levels are calculated in the respective jupyter notebooks.

These audiences were highlighted because their participation is necessary to form a full-fledged ecosystem of the project.

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <td colspan=5 style="text-align: left"> Final Distribution </td>
            <td style="text-align: center"> <a href="final_distribution.ipynb">Final Distribution</a></td>
        </tr>
    </tbody>
</table>

Based on counting the number of addresses and determining the fair reward of the participants of each audience, the following balanced distribution between them is proposed:

<img src="img/audiences_distribution.png" width="75%" height="75%" alt="Distribution between Audiences">

When an address hits multiple audiences, its reward is cumulative.

An amount of distributed BOOT tokens should be equal for each level within an audience.  
The amount of addresses should also be divided into levels for each audience as

<img src="img/levels_distribution.png" width="50%" height="50%" alt="Distribution between Levels">

#### Getting the Crowd

The most crowded audience is ETH holders and users. We identified 2 audiences: those who hold, and those who hold and transact. Following the Pareto Principle, our target was to exclude the majority of the most either inactive addresses or addresses with insignificant holdings:

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <th rowspan=2>Audience</th>
            <th rowspan=2>Rule</th>
            <th colspan=3>Level</th>
            <th rowspan=2>Calculations</th>
        </tr>
        <tr>
            <th>1</th>
            <th>2</th>
            <th>3</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=2 style="text-align: left"> Average Citizens </td>
            <td style="text-align: left"> ETH balance > 0.12 ETH and Amount of outgoing tx</td>
            <td style="text-align: center"> > 4 tx </td>
            <td style="text-align: center"> > 125 tx </td>
            <td style="text-align: center"> > 1,531 tx </td>
            <td rowspan=2 style="text-align: center"> <a href="eth_and_tx__citizens.ipynb">ETH Analysis</a> </td>
        </tr>
        <tr>
            <td style="text-align: left"> ETH balance</td>
            <td style="text-align: center"> > 1 ETH</td>
            <td style="text-align: center"> > 29 ETH</td>
            <td style="text-align: center"> > 485 ETH</td>
        </tr>
    </tbody>
</table>

#### Hunting for Content Creators

The key assumption is that NFT related actions will increase the chance of using cyberlinks because picture owners would love to make them searchable. We decided that all NFT owners deserve attention becasue they are on the edge of web3 technology.

Another important sub-audience is ENS and decentraLAND holders. This group is special because they value ENS and LAND. The only utility of ENS and LAND is to bind content hash. Hence they are the most desired as they prove the intention to create non trivial content.

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <td rowspan=3 style="text-align: left"> Masters of the Great Web </td>
            <td style="text-align: left"> Amount of ERC721 tokens </td>
            <td style="text-align: center"> > 0 NFT </td>
            <td style="text-align: center"> > 12 NFT </td>
            <td style="text-align: center"> > 160 NFT </td>
            <td rowspan=2 style="text-align: center"> <a href="erc721__masters_and_cyberpunks.ipynb">ERC721 Analysis</a> </td>
        </tr>
        <tr>
            <td style="text-align: left"> Owners of the Selected ERC721 tokens </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> ENS </td>
            <td style="text-align: center" style="text-align: center"> Gitcoin Kudos or LAND </td>
        </tr>
        <tr>
            <td style="text-align: left"> Fee spending to contracts<sup>4</sup>, by contract creators, ETH </td>
            <td style="text-align: center"> > 0 ETH </td>
            <td style="text-align: center"> > 0.004 ETH </td>
            <td style="text-align: center"> > 0.477 ETH </td>
            <td style="text-align: center"> <a href="gas__hackers_and_masters.ipynb">Gas Analysis</a>       </td>
        </tr>
  </tbody>
</table>
<i>
<sup>4</sup> including contracts created by factories only<br>
</i>

#### Attracting Astronauts

Bostrom is built using Cosmos-sdk, so attracting Cosmonauts is essential for the project health and interchain expansion. The most crowded and useful chains are Cosmos Hub, Osmosis and Terra. We followed the same Pareto Principle while filtering agents with insignificant holdings.

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <td rowspan=3 style="text-align: left"> Astronauts </td>
            <td style="text-align: left"> ATOM Balance </td>
            <td style="text-align: center"> > 1 ATOM </td>
            <td style="text-align: center"> > 180 ATOM </td>
            <td style="text-align: center"> > 4,352 ATOM </td>
            <td rowspan=3 style="text-align: center"> <a href="atom_osmo_luna__astronauts.ipynb">ATOM, OSMO and LUNA Analysis</a> </td>
        </tr>
        <tr>
            <td style="text-align: left"> OSMO Balance </td>
            <td style="text-align: center"> > 1 OSMO </td>
            <td style="text-align: center"> > 752 OSMO </td>
            <td style="text-align: center"> > 24,352 OSMO </td>
        </tr>
        <tr>
            <td style="text-align: left"> LUNA Balance </td>
            <td style="text-align: center"> > 1 LUNA </td>
            <td style="text-align: center"> > 568 LUNA </td>
            <td style="text-align: center"> > 12,364 LUNA </td>
        </tr>
    </tbody>
</table>

#### Praying for Hackers

Developers, developers, developers... Success of any protocol is defined by it's ability to attract developers. Luckily Ethereum laid an amazing foundation for the identification of succesfull developers. The gas fee drop method is an unambiguous and provable way to give tokens to the mighty hands.

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <td rowspan=2 style="text-align: left"> Extraordinary Hackers </td>
            <td> Fee spending to created contracts<sup>1</sup> by contract creators<sup>2</sup> </td>
            <td style="text-align: center"> > 0 ETH </td>
            <td style="text-align: center"> > 4 ETH </td>
            <td style="text-align: center"> > 254 ETH </td>
            <td rowspan=2 style="text-align: center"> <a href="gas__hackers_and_masters.ipynb">Gas Analysis</a> </td>
        </tr>
        <tr>
            <td style="text-align: left"> Fee spending to created contracts<sup>1</sup> by factory creators<sup>3</sup> </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> > 0 ETH </td>
            <td style="text-align: center"> > 10 ETH </td>
        </tr>
    </tbody>
</table>
<i>
<sup>1</sup>  excluding fee from a contract creator address<br>
<sup>2</sup>  excluding contracts created by factories<br>
<sup>3</sup>  excluding factories that only created contracts when called from the creator of that factory<br>

</i>

#### Formation of Heroes Corpus

Any PoS network is run by validators. We need to attract the best validators to become heroes for us. We decided to focus on two groups. The first group is genesis Ethereum investors as they were practically successful in building the biggest GPU mining infrustructure on the planet. The second group is Eth2 stakers as they exactly match the profile we need: patience, technical skills and risk appetite.

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <td rowspan=2 style="text-align: left"> Heroes of the Great Web </td>
            <td style="text-align: left"> Genesis </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> only here </td>
            <td rowspan=2 style="text-align: center"> <a href="genesis_and_eth2__heroes.ipynb">Genesis and ETH2 Stakers</a> </td>
        </tr>
        <tr>
            <td style="text-align: left"> ETH 2.0 Stakers </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> only here </td>
        </tr>
    </tbody>
</table>

#### Focusing Investors

We need to bring capital to the table. We decided to narrow the scope to those who invested in at least 2 meaningful ERC-20 tokens we are aware of. Surprisingly there are not so many folks out there with this trait. We assume that this is a profile of the investors we need for success.

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <td style="text-align: left"> Passionate Investors </td>
            <td style="text-align: left"> Number of selected ERC20 tokens >= 2 and balance of it </td>
            <td style="text-align: center"> > 0.01 ETH </td>
            <td style="text-align: center"> > 3 ETH </td>
            <td style="text-align: center"> > 55 ETH </td>
            <td style="text-align: center"> <a href="erc20__investors_and_cyberpunks.ipynb">ERC20 Analysis</a> </td>
        </tr>
    </tbody>
</table>

#### Inspiring Key Opinion Leaders

Key figures who connect Ethereum to different audiences are projects that are building on top of Ethereum. Hence giving tokens to those who are able to lead these groups is likely a good idea. So we included into the scope top token holders of selected projects. To our surprise, we found that there is very little overlap between these people, which adds to our hypothesis.

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <td style="text-align: left"> Key Opinion Leaders </td>
            <td style="text-align: left"> Top 100 Holders by selected ERC20 Tokens </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> only here </td>
            <td style="text-align: center"> <a href="erc20__leaders.ipynb">Top ERC20 Holders</a> </td>
        </tr>
    </tbody>
</table>

#### Cyberpunks

There are groups that create a revolution without regard to trends. These groups include Urbit, Foam and Dragonereum. Another interesting group is Donors of Ethereum foundation. We decided to reward them for fun.

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <td rowspan=3 style="text-align: left"> Cyberpunks </td>
            <td style="text-align: left"> Owners of the Selected ERC20 tokens </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> FOAM or GOLD </td>
            <td style="text-align: center"> <a href="erc20__investors_and_cyberpunks.ipynb">ERC20 Analysis</a> </td>
        </tr>
        <tr>
            <td style="text-align: left"> Owners of the Selected ERC721 tokens </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> Unicorns, DRAGON or Cryptopunks </td>
            <td style="text-align: center"> <a href="erc721__masters_and_cyberpunks.ipynb">ERC721 Analysis</a> </td>
        </tr>
        <tr>
            <td style="text-align: left"> Urbit Owners </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> here </td>
            <td style="text-align: center"> <a href="urbit__cyberpunks.ipynb">Urbit Analysis</a> </td>
        </tr>
    </tbody>
</table>

#### Understanding Devils

We included the top 10 centralized exchanges to the gift because we want to better understand their behavior.

<table style="text-align: left">
    <thead style="text-align: center">
        <tr>
            <td style="text-align: left"> Leeches </td>
            <td style="text-align: left"> 10 CEXes addresses </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> - </td>
            <td style="text-align: center"> only here </td>
            <td style="text-align: center"> <a href="manual_assigned_addresses__cexes.ipynb">Assigning Addresses</a> </td>
        </tr>
    </tbody>
</table>

#### Excluding Fiat Brains

Addresses based on the fiat system will not be included,
namely those that satisfy these two conditions:

1. Stablecoin balance is more than sum of ETH and [selected ERC20 tokens](erc20__investors_and_cyberpunks.ipynb) balances
2. Stablecoin balance is more than 0.1 ETH

#### Prize to be the First

We've added an incentive to claim the gift early.  
There are about **4M** addresses in Gift, but we expect that only the first **~1/10** accounts can
claim them.

There will be an incentive of **13x** for those who claim first, reducing to **7x** for those who come last.

<img src="img/incentive_chart.png" width="50%" height="50%" alt="Incentive chart">

#### Data Pipeline

<img src="img/data_pipeline.png" width="75%" height="75%" alt="Data Pipeline">

#### Gift Execution

<img src="img/gift_execution.png" alt="cyberGift Execution">

#### Final Distribution

[Final Distribution Table](https://console.cloud.google.com/bigquery?project=cosmic-keep-223223&p=cosmic-keep-223223&d=final&t=final_distribution&page=table&ws=!1m5!1m4!4m3!1scosmic-keep-223223!2sfinal!3sfinal_distribution)

**Check your address in:**

- **web2** by the [Dashboard](https://datastudio.google.com/u/0/reporting/53e1c28b-9f10-497c-9b5b-9f2a4749450b)
- **web3** by IPFS link
  `gateway.ipfs.cybernode.ai/ipfs/QmWvynJ9yrfU5ju8dRSDBY7SmfEugoTyhtA5YmvSqE6Q1c/<your address>.json`  
  for example [gateway.ipfs.cybernode.ai/ipfs/QmWvynJ9yrfU5ju8dRSDBY7SmfEugoTyhtA5YmvSqE6Q1c/0x91170c80ce048e00202e7ad72f8cfab86ec9004d.json](https://gateway.ipfs.cybernode.ai/ipfs/QmWvynJ9yrfU5ju8dRSDBY7SmfEugoTyhtA5YmvSqE6Q1c/0x91170c80ce048e00202e7ad72f8cfab86ec9004d.json)
