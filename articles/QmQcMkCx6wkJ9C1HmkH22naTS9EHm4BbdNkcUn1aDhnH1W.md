# Search on Cyb.ai

There is a search bar in cyb.ai. When a user enters a query in the search bar cyb.ai computes the `IPFS CID v0` of a text file with the search query contents. `IPFS CID v0` is `sha-256` hash with prefix `Qm` and here is the example: `QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m`. After that, cyb.ai requests the go-cyber node:

`https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/search/QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m`.

Similar results might be recieved by using go-cyber CLI:

`cyber query rank search QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m --chain-id bostrom --node https://rpc.bostrom.cybernode.ai:443`

If there are cyberlinks originating from the search query's IPFS hash, then the node returns particles sorted by cyberrank, cyb.ai using IPFS-JS node retrieves files from IPFS and presents these results.

Thus, the search results in cyb.ai are the files stored in IPFS (received by the browser and rendered on the page) with the IPFS hashes that were cyberlinked to the IPFS hash of the text entered into the search bar.

If no cyberlinks had been created for a text file hash of a particular search query, the cyb.ai displays particles linked to the hash of the text file with "0" content on the search result page.

Account avatar is an image file in IPFS. The hash of the image file is cyberlinked by a text file "avatar"'s hash by the current neuron.

Neurons message in a particular Sense account's feed is a cyberlink between the text "tweet" and the IPFS hash of the message file.

---

###### Information on the article’s previous version  

cid: [QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m](https://cyb.ai/ipfs/QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m)  
author: [bostrom1nngr5aj3gcvphlhnvtqth8k3sl4asq3n6r76m8](https://cyb.ai/network/bostrom/contract/bostrom1nngr5aj3gcvphlhnvtqth8k3sl4asq3n6r76m8)  
particle_epoch: 1650875245  

levenshtein similarity: 0.539  
cosine similarity: 0.948  

cyberrank[^1] = [3486631087](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/rank/QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m)  
incoming cyberlinks count[^1] = [1](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/backlinks/QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m?pagination.page=0&pagination.per_page=1000)  
outgoing cyberlinks count[^1] = [0](https://lcd.bostrom.cybernode.ai/cyber/rank/v1beta1/rank/search/QmWysZirB2fbKeaNPZxfjY9M381WjyzbdG5FhcxysYhJ7m??pagination.page=0&pagination.per_page=1000)  

[^1]: Metrics snapshot was taken between blocks [4102944](https://cyb.ai/network/bostrom/block/4102944)-[4102984](https://cyb.ai/network/bostrom/block/4102984)

