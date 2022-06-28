# Bostrom Journal

Issue 1, 20220606

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
  - [The transaction cost in Bostrom ~](#the-transaction-cost-in-bostrom-)
  - [Staking mechanism - encouraging desired behavior in agents (heroes and neurons) ~](#staking-mechanism---encouraging-desired-behavior-in-agents-heroes-and-neurons-)
- [Apps built on Bostrom, for Bostrom ~](#apps-built-on-bostrom-for-bostrom-)
  - [go-cyber [~](Qmd4suKEMpRKuFkEeGbsHqDAKJfSQdNkkxPie6cfVacm8X)](#go-cyber-)
  - [Cyb [~](QmSDCFfY1S2UxoDkhbAtFbnm2vp97eefNyb5NQKpXENwDj)](#cyb-)
  - [Bostrom stats on Grafana by cyber-congress team [~]()](#bostrom-stats-on-grafana-by-cyber-congress-team-)
  - [Bostrom stats with price of token dynamics on Grafana by Bro-n-Bro hero [~]()](#bostrom-stats-with-price-of-token-dynamics-on-grafana-by-bro-n-bro-hero-)
  - [cyberdbot [~](QmWjcFRoVPeYXWug6NsoWFGA8PWqfFWcJ6G2HFNLf5QyXR)](#cyberdbot-)
  - [Cybernode.ai [~](QmRBxwqwNhLUjnsKwm8giYNVv4wwa77XUk51bYoo67tbah)](#cybernodeai-)
  - [cyber-js [~](QmcwgfBG21fQ3sqiQhwnvFmadijd2GYZDF81QyQLXoJtEM)](#cyber-js-)
  - [cyber CLI helper [~](Qmdo6FeBhcu1rW3bC2eu62g9sQifgAZu1wBh47UKgnTdbN)](#cyber-cli-helper-)
  - [Cyber arbitrage [~](QmNyxAQcozrkb2Ekr9EMUVZUXQduUGazYwfRTZtvxnjUwd)](#cyber-arbitrage-)
- [Cyb.ai functionality [~]()](#cybai-functionality-)
  - [Cyb.ai: intro, mechanics ~](#cybai-intro-mechanics-)
  - [My Robot ~](#my-robot-)
  - [Teleport ~](#teleport-)
  - [Dyson Sphere ~](#dyson-sphere-)
  - [HFR ~](#hfr-)
  - [Grid (My Energy) ~](#grid-my-energy-)
  - [Senate ~](#senate-)
  - [Thoughts ~](#thoughts-)
- [Bostrom Blockchain philosophy ~](#bostrom-blockchain-philosophy-)
  - [The Great Web ~](#the-great-web-)
  - [Markdown ~](#markdown-)
- [Bostrom cybernomics ~](#bostrom-cybernomics-)
  - [cyberGift ~](#cybergift-)
  - [Result Validation](#result-validation)

## Preface [~]()

In this issue we collected particles from the founding team and the first users of Bostrom regarding using Bostrom. Those particles could have been edited to correct typos and grammar mistakes, to delete repeated information already presented in other journal particles and to make them as a whole more readable. Initial particle references are provided.

## Intro to Bostrom Blockchain [~]()

### Bostrom - the short definition [~](QmbvXoTA8nqZGzzCtQtw7rrrNrTRxyRSHsJPa5ZsPLHDG7)

Bostrom is a superintelligence project with a permissionless knowledge graph at its core built on blockchain (cosmos-SDK), consensus protocol Tendermint and content addressing mechanism (with the current implementation of IPFS protocol).

### Purpose of the Bostrom network [~](QmX3owfDdvVUAr2J58nrdBQShBH8be6iwv9NZwnTAjTdjf)

Bostrom allows adding knowledge (creating cyberlinks between particles) to the knowledge graph verifiably. By "verifiably" we mean that it is guaranteed by blockchain design that a particular address added specific content into the blockchain at the known time.

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

On [cyb.ai](https://cyb.ai) you can already create [cyberlinks](https://cyb.ai/search/cyberlink), search the [graph](https://cyb.ai/oracle), rank using the [Relevance machine](https://cyb.ai/search/rm), share and store information, [earn rewards](https://cyb.ai/halloffame), [investmint](https://cyb.ai/mint), and [tweet](https://cyb.ai/search/tweet). [Bostrom](https://cyb.ai/search/bostrom) is the [bootloader](https://cyb.ai/bootloader) for [Cyber](https://cyb.ai/search/cyber), with the same features.

### IPFS, Content-addressing mechanism [~](QmQSDwNXZuLVoX5i9eUMbS5f6EYvX3miX9DUy6BCSH2Jh1)

IPFS (interplanetary file system) is a distributed (decentralized) file system within which files are stored on network members' computers. Files are received by their CID (cryptographic hash, particle in Bostrom's terminology) using software that supports IPFS protocol.

Files are downloaded from network participants' nodes. Therefore, the more devices have the file, the higher chances it can be downloaded (and potentially faster).

IPFS does not guarantee the safety or accessibility of the files.

### Bostrom is a full refactoring of the Euler network [~](QmYaf3J118vExRV6gFv2CjwYCyHmzV6Z9ACV7avWb652XZ)

Before Bostrom network (which itself had 5 testnets), there were 6 testnets with the name of Euler.

Bostrom is a full refactoring of the Euler network with a strong focus on Superintelligence. It includes a new distribution model, economics, improved ranking, and some superintelligent abilities.

Founders perceive [Bostrom](https://cyb.ai/search/bostrom) as a canary network in the same way that Kusama relates to Polkadot. The Bostrom knowledge graph tends to be a bootstrap hub for domain-specific networks of Cyber. The network works as a testbed for Interplanetary Knowlege Protocol communications and different experiments. Consider Bostrom a network with high risks but of market value.

The key differences within the Cyber network are being discussed [here](https://cyb.ai/search/bostrom%20vs%20cyber). The launch of the Bostrom network is the inception of an ecosystem.

## Knowledge graph [~](QmYPEehJdgxfTK3x5KQt56HbFEk8RXUmceqaTaseoPMUR6)

Knowledge graph of Bostrom blockchain consists of couples: source particle connected to destination particle via cyberlink. So it can be encoded in form of `source_particle - destination_particle`, which reduces the complexity of entering data. But simple cyberlinks in combinantion with markdown files, where could be used various conventions of connections between particles, gives the necessary flexibility to Bostrom's knowledge graph, adopting it diffrent usecases.

### Particles [~]()

Particle is a hash of the file in IPFS network. Having its hash the file can be retreived from IPFS network. Particles are written into Bostrom blockchain. But, cyb.ai application is built to render content of cyberlinked files.

### Cyberlinks [~](QmewU6pKFtGc3Fm8XsMxS3bA2xf3swQwuPuepxebp2WNMH)

A cyberlink is the link between two particles registered in Bostrom blockchain by particular neuron.

To cyberlink - to create a cyberlink between two particles.

### Neurons [~](QmV1JLxPMeWuZFYWYx9GGRQLJTRMuBCxxU6s1jEuShsFn4)

A neuron is a token holder who can provide valuable knowledge to the knowledge graph.

### Cyberrank [~]()

Cyberrank is a default rank calculated on each particle. It's calculated as a weighted Pagerank, where every cyberlink has the weight of ampere-per-cyberlink. Ampere-per-cyberlink calculated for each neuron by dividing his ampere balance on count of his cyberlinks.

Cyberrank calculated using GPU of node. Cyberrank is deterministic, so it is used in a Bostrom's blockchain consensus.

## Bostrom tokens [~](QmbiZAm2QV5AXg6kW74hsavU4QtVc98AyPzu9VP7Fd6YQR)

There are several tokens in the Bostrom network: BOOT, HYDROGEN, VOLT, AMPERE. Each of its own usage.

### BOOT token

BOOT is the main token of Bostrom. The token's name BOOT symbolizes the BOOTloader nature of the Bostrom network for the future Cyber network.

With BOOT one can:

- `hire a hero` (to stake or to delegate tokens to a validator), being paid rewards in return (risk fee);
  - for each staked BOOT a HYDROGEN is minted (with a 1 to 1 ratio)
- transfer to somebody (if BOOT is in a liquid state);
- pay for network transactions (pay for gas). Though now, many validators accept transactions for free;
- vote for protocol change and public goods.

### HYDROGEN token

With HYDROGEN one can:

- `investmint` HYDROGEN for a limited period of time to produce VOLT and AMPERE tokens;
- exchange back for delegated BOOT in order to transfer BOOT into a liquid state;
- transfer to someone (if in liquid state).

### VOLT token

- is needed to create cyberlinks;
- amount of Volt tokens on a balance of selected neuron regulates how many cyberlinks per day the neuron can submit;
- may be transferred in a liquid state

Each Volt token on the neuron's balance allows to create 1 cyberlink per day. The ability to create cyberlinks is restored within a day.

If the network is underloaded, one can produce more cyberlinks (up to 4 cyberlinks for each Volt on balance per day).

### AMPERE token

- is needed to create cyberlinks;
- amount of Ampere tokens on a balance of selected neuron characterizes the power of its impact on the cyberrank;
- may be transfered in a liquid state

The more Ampere tokens the neuron has, the higher his cyberlinks would be ranked. Cyberrank is recalculated for each `cycle` so that the changes in the amount of Amperes tokens on the neurons' balances that produced cyberlinks would influence the cyberrank of the whole graph. It's reasonable to think about of Ampere tokens as a measure that characterises the impact of cyberlinks creacted from account on the knowledge graph.

### TOCYB token [~](QmfGPCSpPCRTsBw2g6wqrLkHaCwtFChXeHADju5RrYu9EB)

TOCYB token is a token of a future [Cyber](https://cyb.ai/search/cyber) network. Everyone who have [TOCYB](https://cyb.ai/token/TOCYB) will be able to convert it into CYB tokens through private exodus. The contract will be developed by [cyber~Congress](https://cyb.ai/search/cybercongress).

### Investminting - definition and mechanics [~](Qmezuhrqm7P8u8PwHhoq5EjWmnk3VxGju9DVUT9pWmeNaV)

In order to obtain resource tokens: A (AMPERES) and V (VOLTS) one should investmint H (HYDROGEN). The term `investminting` is composed of `minting` (producing new tokens) and `investing` (putting capital into something for a period of time in order to make a profit).

After Hydrogen tokens are investminted, the neurons balance is immediately replenished by a number of temporary `frozen` for transferring but ready to use A and V tokens. Both tokens of the investminting pair (H and A or V) are `frozen` till the end of the investminting period. After investminting period both tokens become liquid.

#### Investminting features

Investminting has the next features:

1. The period chosen for investminting Hydrogen tokens has a proportionate effect on the amount of Ampere and Volt tokens received.
2. The amount of Hydrogen tokens investminted has a proportionate effect on the amount of Ampere and Volt tokens received.
3. H, Ampere, and Volt tokens become liquid after the investminting period has ended.
4. Before the tokens become liquid, they perform their resource functions for the account - Amperes increase links' rank (their place in the search result), Volts may be used for producing cyberlinks.
5. Maximum investminting period (`investmint_max_period`) is limited. However, it increases every 547 days (`horizon_period_init`).
6. The amount of Amperes and Volts available for investminting per time unit is determined by the following parameters `ampere_mint_rate` and `volt_mint_rate`. These parameters' values are halved every 18 months to align with Moors law(~547 days). (`ampere_base_halving_period`, `volt_base_halving_period`). At the beginning of the network's lifecycle, one can investmint more Amperes and Volts than later.

Amperes and Volts are finite due to fundamental constraints in computing resources. They cannot be replenished in case the investminting has been missed. So if you didn't investmint your H, you would miss the opportunity to have Amperes and Volts.

Halving occurs every 567 days, which means half as many tokens can be minted per time unit compared to the before halving amount.

### The transaction cost in Bostrom [~](QmYYB4EEb9KUagqotDWFYtCUsmsFqhNtneqALdTTrKut1t)

Any action changing state in a blockchain is a transaction. Each transaction has a cost. That cost is covered by an agent conducting the transaction.

Examples of actions in Bostrom:

- adding knowledge to knowledge graph by creating cyberlinks
  - setting neuron's avatar on cyb.ai
  - sending neuron's tweet on cyb.ai
  - sending a comment on a particle on cyb.ai
- transferring tokens between accounts
- delegating BOOT to a hero
- claiming delegation rewards
- hydrogen investminting
- exchanging tokens using pools
- etc

When signing a transaction, the neuron should set an amount of gas for executing the transaction and the cost of the gas in BOOT. In case of a large number of transactions (high network load), heroes may set their servers to accept those transactions of higher fee with higher priority. As for now (the network is still underloaded), many heroes accept transactions at a zero-cost gas.

### Staking mechanism - encouraging desired behavior in agents (heroes and neurons) [~](Qma2tQuYBhM5vGFq1cpUhyXPU57UVcvLiUNuw9hH63m9Cb)

Bostrom is a proof-of-stake blockchain. Validators ensure proof-of-stake blockchain functioning. A validator (the hero in Bostrom terminology) is a server with installed blockchain software (node).

Each node contains a blockchain replica (transaction log) that allows computing the current state of the system each block. Nodes agree among themselves on a common state of affairs according to the Tendermint consensus protocol as a guideline.

Bostrom is designed to economically encourage (incentivize) heroes and neurons to perform useful functions for the system.

#### Valuable functions of Bostrom's agents (Heroes and Neurons)

Heroes' valuable functions are:

- computing each blockchain block;
- checking and signing transaction messages from other nodes (thus reaching a consensus on the present state of the blockchain);
- distributing state of a blockchain via various apis.

Neurons' useful functions are:

- maintaining desired balance between `staked` and `liquid` tokens (`goal_bonded` parameter in the senate which is `80%` at the moment of writing);
- distributing `staked` tokens to validators who perform their functions properly thus preventing `slashing`;
- using H token (HYDROGEN), which can be obtained in exchange for a `staked` BOOT, for investminting Ampere and Volt tokens (and then using As and Vs for creating сyberlinks, i.e. training Bostrom);
- deciding on the evolution of the network using the governance portal (`senate`).

#### The economic incentivization mechanism of agents in Bostrom

The economic incentivization mechanism of heroes and neurons in Bostrom includes rewards and penalties.

Blockchain is programmed to mint new BOOT tokens in each block to pay rewards. The `inflation_rate` coefficient determines the amount of new tokens to be produced. `Inflation_rate` coefficient depends on the share of `staked` BOOTs:

- if the `staked` percentage of BOOTs is less than the `goal_bonded` parameter, then the `inflation_rate` coefficient will be increasing for each block till it hits the `inflation_rate_max` value. The higher the `inflation_rate`, the more rewarding is the `stake`;
- if the `staked` percentage of BOOTs is more than the `goal_bonded` parameter, then the `inflation_rate` coefficient will be decreasing for each block till it hits the `inflation_rate_min` value, thus signaling to search for another way of profiting from BOOTs

New tokens are distributed between neurons who `staked` their tokens and heroes proportionally to their `staked` tokens.

Heroes receive a set fee.

Neurons are rewarded for deligating (`staking`) tokens to heroes and bearing `slashing` risks (reducing `stake` by the penalty amount), and also risks of skipping blocks without getting any rewards (while the hero commited violation remains in the `jail` state).

Neurons' risks are that the heroes, to whom the former have delegated their tokens, may commit a violation of two kinds:

- Downtime (skipping new blocks computing).
- Double sign (using the same private key of validator on two diffrenet servers).

`slashing` is a feedback mechanism from the blockchain to heroes, as it forces neurons to redistribute their `stakes` in favor of heroes, who perform their functions properly.

When a particular hero is caught violating rules, that hero is put into the `jail` state, which means no rewards are produced for the tokens deligated to him.

All the violations and the penalties are noted in the blockchain settings and are executed according to the Tenderimnt consensus protocol.

As of now (2022-01-14), there is no publicly available services for monitoring heroes' violation statistics. Therefore neurons have to make decisions based only on their own statistics. In order to make it easier to track heroes’ performance, one can use a hack: if only multiples of 10 are deligated to heroes' balances, `slashing` is easily tracked in case it did occur.

For example, we can delegate `153 298 189` BOOTs to a hero. In this case we'll have to remember the exact amount deligated and constantly recheck for potential changes. It can become problematic as one bonds to more heroes. On the other hand, we can delegate `153 000 000` making the violation easily traceable. Simply browse through your stakes and any non-zero digit at the end will give away the violating hero.

In order to hedge `slashing` risks one may distribute `stakes` between several heroes.

## Apps built on Bostrom, for Bostrom [~]()

### [go-cyber](https://github.com/cybercongress/go-cyber) [~](Qmd4suKEMpRKuFkEeGbsHqDAKJfSQdNkkxPie6cfVacm8X)

Implementation of [Cyber protocol](https://github.com/cybercongress/cyber) in Go. Each hero runs it's own node of go-cyber.

### [Cyb](https://cyb.ai) [~](QmSDCFfY1S2UxoDkhbAtFbnm2vp97eefNyb5NQKpXENwDj)

Your [open source](https://github.com/cybercongress/cyb) immortal robot for the Great Web.

Current version is availble on address [https://cyb.ai](https://cyb.ai).

Cyb.ai functionality is explained in the section below.

### [Bostrom stats on Grafana by cyber-congress team](https://cybernode.ai/grafana/d/cyber_stats/computer?orgId=2&from=now-30d&to=now) [~]()

- [Users by cohorts by activity](https://cybernode.ai/grafana/d/SdWCR028z/analytics?orgId=2)
- [Nodes technical statistics](https://cybernode.ai/grafana/d/cyber_stats/computer?orgId=2&from=now-30d&to=now)

### [Bostrom stats with price of token dynamics on Grafana by Bro-n-Bro hero](https://monitor.bronbro.io/d/bostrom-stats/bostrom-stats?orgId=2&from=now-30d&to=now) [~]()

### [cyberdbot](https://github.com/Snedashkovsky/cyberdBot) [~](QmWjcFRoVPeYXWug6NsoWFGA8PWqfFWcJ6G2HFNLf5QyXR)

[Open source](https://github.com/Snedashkovsky/cyberdBot) telegram bot for Cyber

### [Cybernode.ai](https://cybernode.ai) [~](QmRBxwqwNhLUjnsKwm8giYNVv4wwa77XUk51bYoo67tbah)

Node monitor of cyberCongress public infrastructure

### [cyber-js](https://github.com/cybercongress/cyber-js) [~](QmcwgfBG21fQ3sqiQhwnvFmadijd2GYZDF81QyQLXoJtEM)

[Javascript library](https://github.com/cybercongress/cyber-js) for [cyber protocol](https://github.com/cybercongress/cyber)

### [cyber CLI helper](https://docs.google.com/spreadsheets/d/1S58novA61H9V0EgzToO3LSIZ0cFHCiGtmnUCYVE6ZC8/edit?usp=sharing) [~](Qmdo6FeBhcu1rW3bC2eu62g9sQifgAZu1wBh47UKgnTdbN)

[Google sheets template](https://docs.google.com/spreadsheets/d/1S58novA61H9V0EgzToO3LSIZ0cFHCiGtmnUCYVE6ZC8/edit?usp=sharing) for CLI cyber configuration.

You can make a copy of the spreadsheet and fill in blue cells with your inputs.

To contribute - request write rights.

### [Cyber arbitrage](https://github.com/Snedashkovsky/cyber-arbitrage/blob/main/search_arbitrage.ipynb) [~](QmNyxAQcozrkb2Ekr9EMUVZUXQduUGazYwfRTZtvxnjUwd)

Search for the best arbitrage options in Bostrom. Ipython notebook retrieves data on pools' state from CLI and display it in a table form.

## [Cyb.ai](https://cyb.ai) functionality [~]()

### Cyb.ai: intro, mechanics [~](QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m)

[Cyb.ai](https://cyb.ai) - is a WEB interface to the Bostrom blockchain developed by the Bostrom team. Among Cyb.ai's many functions are:

- receiving data on cyberlinks recorded by Bostrom blockchain from node;
- creating cyberlinks;
- receiving and sharing objects in the IPFS network using library [ipfs-js](https://github.com/ipfs/js-ipfs).

There is a search bar in cyb.ai. When a user enters a query in the search bar cyb.ai computes the ipfs hash of a text file with the search query contents. After that, cyb.ai requests the node with go-cyber installed. If there are cyberlinks originating from the search query's IPFS hash, then the node returns particles sorted by cyberrank, cyb.ai using IPFS-JS node retrieves files from IPFS and presents these results.

Thus, the search results in cyb.ai are the files stored in IPFS (received by the browser and rendered on the page) with the IPFS hashes that were cyberlinked to the IPFS hash of the text entered into the search bar.

If no cyberlinks had been created for a text file hash of a particular search query, the cyb.ai displays particles linked to the hash of text file with content "0" in the search result page.

Account avatar is an image file in IPFS. The hash of the image file is cyberlinked by a text file "avatar"'s hash by the current neuron.

Amperes message in a particular Twitter account's feed is a cyberlink between the text "tweet" and the IPFS hash of the message file.

### My Robot [~](QmSfnbtVvAQxLBtD9wfkn5XexGPPkofcT7pS7379WoXqVW)

On "My Robot" page you can see the information about the state of your IPFS local node (that uses cache of your browser), connected accounts, their addresses and balances of tokens on them.

### Teleport [~](QmSBDA7qQEbV6sQRmzbj3VuiXGG9g9vpbLWC9DWFtzq9mh)

On teleport page you can exchange your tokens using swap, explore [existing pools](https://cyb.ai/teleport/pools) or add and sub liquidity to liquidity pools. Refer to the links below:

- [swap](https://cyb.ai/teleport)
- [add liquidity](https://cyb.ai/teleport/add-liquidity)
- [sub liquidity](https://cyb.ai/teleport/sub-liquidity)

### Dyson Sphere [~](QmS1jB9j7LHJo7iyYQc3MErKHEGvgXkt67xrqH44dzQdRt)

You can delegate (stake) BOOT by hiring a Hero in the [Dyson Sphere](https://cyb.ai/search/dyson%20shpere). That will grant you Hydrogen in amount equal to staked BOOT. Also, you can see the information regarding heroes.

- [hire & fire Heros](https://cyb.ai/halloffame)

### HFR [~](QmReuU5gTyEGZJTk3nxs5ViJjMMvYVoRzYr9j4r6TeKjFX)

In this reactor, [Amperes](https://cyb.ai/token/A) or [Volts](https://cyb.ai/token/V) can be [extracted](https://cyb.ai/mint) from [hydrogen](https://cyb.ai/token/H) without burning the hydrogen itself.

You can mint [Amperes](https://cyb.ai/token/A) and [Volts](https://cyb.ai/token/V) by locking (freezing) your [Hydrogen](https://cyb.ai/token/H).

You can get Hydrogen by delegating BOOTs to Heroes in the [Dyson Sphere](https://cyb.ai/search/dyson%20shpere).

- Use HFR menu to adjust freezing parameters and [investmint](https://cyb.ai/mint)

### Grid (My Energy) [~](Qmdfb54D92tzTMLKNqVZuo74aN5yUHnk6kwcVK9Js6PTqn)

Here you can check your energy, route Amperes and Volts to your friends:

- [check energy](https://cyb.ai/grid)
- [route](https://cyb.ai/grid/outcome)

### Senate [~](QmcpFmrqqaiJdCoS9S83w3uCEvbvT4y8BRQDTB9KF8XhFW)

Senate is the main arena for performing and improving Bostrom's governance.

You can submit your own proposals and/or vote on existing ones on the [senate](https://cyb.ai/senate) page. All active, accepted and rejected proposals are also listed there. You can check for more information and statistics by clicking on each of the proposals.

#### Bostrom's Governance [~](QmY4X4SkVBkoUGZdTzdcW7SKY8t4ULj5GJBRcRr4UMyahp), by

Governance process of [Cyber networks](https://cyb.ai/search/computing%20knowledge) is focused on the [evolution](https://cyb.ai/search/cyber%20evolution) of its code and is based on 3 methods:

- [self-reflection](https://cyb.ai/search/cyber%20self-reflection)
- [investments](https://cyb.ai/search/cyber%20investments)
- [adaptation](https://cyb.ai/search/cyber%20adaptation)

Everyone can submit proposals.

A proposal can become active if [minimum deposit](https://cyb.ai/network/bostrom/parameters/gov) is submitted by network participants in the [max deposit period](https://cyb.ai/network/bostrom/parameters/gov).

During [voting period](https://cyb.ai/network/bostrom/parameters/gov) proposal have to reach [quorum](https://cyb.ai/network/bostrom/parameters/gov). The threshold is defined as the minimum proportion of Yes votes excluding Abstain votes for the proposal to be accepted. More details in [cosmos-sdk docs](https://docs.cosmos.network/master/modules/gov/).

### Thoughts [~](QmWxDGihyZBUsZ97yToWeK35hftvKnxPzeaNqPwRCCecYH)

Thoughts are completely autonomous programs. Program can schedule the execution of itself.

Please refer to [the code](https://github.com/cybercongress/go-cyber/blob/main/x/dmn/client/cli/query.go) to understand how this works.

## Bostrom Blockchain philosophy [~]()

### The Great Web [~](QmUamt7diQP54eRnmzqMZNEtXNTzbgkQvZuBsgM6qvbd57)

The Great Web is a web that lasts. It is based on three simple ideas: access, immutability, universality.

#### Access

Anyone who can store secret and compute digital signatures can use the Great Web. Humans, robots, animals, plants, and even mycelium can use it without discrimination and limits.

#### Immutability

Particles in the Great Web can survive through spacetime thanks to content addressing mechanism. So the Great Web can last indefinitely.

#### Universality

The Great Web is built by connecting particles through cyberlinks. The result is universally acceptable language, dynamic but understandable and acceptable by anyone.

### Markdown [~](QmXQ4k4ciK5ieaSwtccmH9mm4QdPS6Spd21DTqLFrEwDWR)

The content of text particles in Cyb.ai is rendered in Markdown. Cyb.ai uses [ReactMarkdown](https://www.npmjs.com/package/react-markdown), [remarkGfm](https://www.npmjs.com/package/remark-gfm) JS packages to render markdown.

If you want your posts look beautiful, use [markdown syntax](https://www.markdownguide.org/basic-syntax/) and [test it here](https://markdown-it.github.io/) before posting.

## Bostrom cybernomics [~]()

### cyberGift [~](Qmcgoy9bV6zsqnzoLB4YunEWXadavKMXKgvmUdToh2Nr3E)

The purpose of this research is to inspire at least 100k power-users of web3 to join the force of learning Superintelligence. To achieve this, we are going to gift 70% of the Bostrom genesis tokens BOOT to agents of Ethereum and Cosmos who are capable of contributing their best to the quality of the knowledge graph. First, we start by highlighting key audiences for establishing network effects and tackling basic chicken and eggs situation. Next, we balance out the participation of key actors by splitting them into grades and adjusting allocations within the groups. Then we apply a filter in order to remove toxic fiat brains from the collective thought process. Finally, we add a crucial incentive to hurry up.

The research results are represented by reproducible scripts that output addresses and balances which will be loaded to the claim CosmWasm contract after the launch of Bostrom.

Data source is [BigQuery crypto-ethereum dataset](https://console.cloud.google.com/bigquery?d=crypto_ethereum&p=bigquery-public-data&page=dataset&project=cosmic-keep-223223) by [Blockchain ETL](https://github.com/blockchain-etl).

Research is done on the [proposal](https://cyber.page/governance/20) basis. We hope this research can help pioneer a new wave of thinking in decentralized marketing.

#### Connecting the Dots

The biggest problem in bootstrapping a blockchain ecosystem from scratch is that it is not enough to attract just users. Established network effects exist between four key groups: users, investors, validators, developers.

![Network effects](https://ipfs.io/ipfs/Qmf2ARvyZ1gu5HJmsPjnWQdhyfmvaEVxnz9vvp5KUt3Lgo)

Hence we have to understand how to attract all these guys simultaneously in order to target healthy organic growth.

In our case that would not be enough. Firstly, Cyber is a content-oriented project. We need to understand how to add content creators to the soup. Secondly, information on the project has to be propagated somehow to all these guys, so key opinion leaders have to be incentivized. Thirdly, as the Cyber project heavily relies on the interchain idea we have to attract the community behind IBC technology. We also want to add some fun giving the power to the guys behind weird cyberpunk ideas. Finally, we want to check the credibility of the most trusted liquidity hubs.

#### Distribution between Grades

An amount of distributed BOOT tokens should be equal for each grade within an audience. The amount of addresses should also be divided into grades for each audience as

![Distribution between grades](https://ipfs.io/ipfs/QmWcyKgUAqtbubrmXyrP8ufXLmLoWMksF32ZzdGRYvCa3b)

Cyber ecosystem consists of a number of different audiences. They are divided depending on their backgrounds and roles played in the community. Main audiences and their short characteristics are listed below.

#### Average Citizens

- ETH owners and senders of outgoing transactions

#### Masters of the Great Web

- ERC721 owners and creators of contracts using factories

#### Astronauts

- ATOM owners
- OSMO owners and liquidity providers
- LUNA owners

#### Extraordinary Hackers

- contract creators

#### Heroes of the Great Web

- participants of Genesis and ETH 2.0 stackers

#### Passionate Investors

- owners of the selected ERC20 tokens

#### Key Opinion Leaders

- TOP holders by the selected ERC20 tokens

#### Cyberpunks

- owners of the cyberpunk tokens

#### Leeches

- manual assigned addresses of top CEXes

These audiences were highlighted because their participation is necessary to form a full-fledged ecosystem of the project.

#### Audience Rules

The initial conditions for the allocation of classes were selected based on the analysis of web3 user activity and the need to cover the most web3 power-users. All distribution rules between grades are calculated in the respective jupyter notebooks.

#### Distribution between Audiences

Based on counting the number of addresses and determining the fair reward of the participants of each audience, the following balanced distribution between them is proposed:

![Distribution between Audiences](https://ipfs.io/ipfs/QmS5z9wW53Rj7sUxb8mJsnp5JqFrUzHRhhwBvJ6YZjc2Yk)

When an address hits multiple audiences, its reward is cumulative.

#### Excluding Fiat Brains

Addresses based on the fiat system will not be included, namely those that satisfy these two conditions:

1. Stablecoin balance is more than sum of ETH and [selected ERC20 tokens](https://github.com/cybercongress/cybergift/blob/main/erc20__investors_and_cyberpunks.ipynb) balances.
2. Stablecoin balance is more than 0.1 ETH.

#### Prize to be the First

We've added an incentive to claim gift early. There are about `4M` addresses in Gift, but at the same time we expect that only the first `1/10` accounts can claim them.

There will be incentive `13x` for those who claim first reducing to `7x` who came last.

![Incetive nchart](https://ipfs.io/ipfs/Qmc4dGDvHqj2KGWZXxSLServ8Hz8Fch2ZyQa57DZ7FAFYd)

#### Data Pipeline

![Data Pipeline](https://ipfs.io/ipfs/QmWUWSHsbFp7tmxjeehCuEFpSz6w5pTPyJcvRvj5M4bUip)

#### Gift Execution

![cyberGift Execution](https://ipfs.io/ipfs/QmZY1jWqceiCaUK1keoaXWkRNBPhga7g5jrYdsPvFxosdt)

#### Final Distribution

[Final Distribution Table](https://console.cloud.google.com/bigquery?project=cosmic-keep-223223&p=cosmic-keep-223223&d=final&t=final_distribution&page=table&ws=!1m5!1m4!4m3!1scosmic-keep-223223!2sfinal!3sfinal_distribution)

Check your address in the [Dashboard](https://datastudio.google.com/u/0/reporting/53e1c28b-9f10-497c-9b5b-9f2a4749450b)

### Result Validation

My name is Maxim Razhev (@ninjascant). I'm a software engineer with 3+ years of experience in blockchain analytics development. I made a manual re-check of queries used here e.g.

- re-calculating balances on a subset of wallets and comparing with a node output;
- comparing the list of NFTs and other entities with open sources like Etherscan and OpenSea;
- verifying that the data presented in the final tables are consistent with query logic.

So, by making this commit, I confirm that the results of the analysis presented in this repository are checked by me and correct.
