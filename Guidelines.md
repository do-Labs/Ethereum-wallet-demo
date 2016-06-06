# Guidelines for development setup for Ethereum
In progress...

## Prerequisites
+ Basic knowledge about Blockchain
+ Some knowledge to [Ethereum](https://www.ethereum.org/)
+ General terms used in Blockchain and Ethereum.

## Useful guides
- https://www.reddit.com/r/ethereum/comments/3vxvlx/starter_guide_almost_all_the_links_youll_need_to/
- https://medium.com/@ConsenSys/a-101-noob-intro-to-programming-smart-contracts-on-ethereum-695d15c1dab4#.2fvdjl9uy


## Tools

+ [Solc - Solidity compiler from cpp-ethereum](http://www.ethdocs.org/en/latest/ethereum-clients/cpp-ethereum/index.html)
+ Geth - node client 
+ [MIX IDE - IDE for developing Smart contracts](https://github.com/ethereum/wiki/wiki/Mix:-The-DApp-IDE)
+ Mist - Ethereum Wallet


## Local development
For local development there are some options:
+ MIX IDE for developing Smart Contracts and a simple GUI in html/js - setup and runs a private local node
+ Truffle for building, compiling, deploying and testing Smart Contracts and html/js - requries a local node, for example:
    + TestRPC
    + Geth
+ Mist - Write, build and deploy Smart contract on the testnet

#### Setup node using TestRPC
1. Install [Solc - Solidity compiler from cpp-ethereum](http://www.ethdocs.org/en/latest/ethereum-clients/cpp-ethereum/index.html)
2. Install [TestRPC](https://github.com/ethereumjs/testrpc)
    + For Windows follow these  [guidelines](https://github.com/ethereumjs/testrpc/wiki/Installing-TestRPC-on-Windows)
    + If there are errors with node-gyp while running ```$ npm install -g ethereumjs-testrpc``` see the installation guide for [node-gyp](https://github.com/nodejs/node-gyp)
3. Run ```$ testrpc <options>``` 

This will start a private node on a local network with accounts and RPC to access through web3.js at ```localhost:8545``` if nothing else is specified. 

#### Setup node using Geth
##### Useful links
+ https://github.com/ethereum/go-ethereum
+ https://github.com/ethereum/go-ethereum/wiki/Command-Line-Options

##### Install
See the [installation instructions](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum)

##### Create ethereum account
```sh
$ geth account new
```
##### Start node in dev mode
```sh
$ geth --dev --unlock 0 console
```
```unlock 0``` unlocks the (main) account for interactive use. ```console``` starts the interactive JavaScript environment

##### Start HTTP-RPC server
https://github.com/ethereum/wiki/wiki/JSON-RPC
```sh
admin.startRPC("0.0.0.0", 8545, "*", "web3,db,net,eth")
```

To start and stop mining use:
```sh
miner.start(1)
miner.stop(1)
```

To attach a console to a running geth instance:
```sh
geth attach
geth attach ipc:/some/path
geth attach rpc:http://host:8545
```

##### Start node on testnet
The node will start synchronising with the testnet blockchain.
```sh
$ geth --testnet --unlock 0 console
```

#### Setup on Azure VM
+ Make sure you have installed the prerequisites (Solc, Geth/TestRPC) on your VM
+ Follow the appropriate guidelines above
+ Remember to open up the port 8545 to connect through RPC

