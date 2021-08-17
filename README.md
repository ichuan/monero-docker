# monero-docker
Dockerfile for monero


# Building

```sh
docker build -t monero .
```


# Running

You need to create a wallet (`data/mywallet`) before start wallet RPC, backup the 25 words.

```sh
echo n | docker run --rm -i --name xmr -v `pwd`/data:/opt/data monero /opt/coin/monero-wallet-cli --password \"\" --generate-new-wallet /opt/data/mywallet --mnemonic-language English --offline --command version
```

Then, start node and RPC:

```sh
docker run --restart always -itd --name xmr -p 18088:18088 -v `pwd`/data:/opt/data monero
```


# Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/wshub/monero/>:

```sh
docker run --restart always -itd --name xmr -p 18088:18088 -v `pwd`/data:/opt/data wshub/monero
```


## Importing bootstrap blockchain

Download from <https://downloads.getmonero.org/blockchain.raw> (54GB, as of 2019/9/9)

```sh
# Save blockchain.raw to data/
wget -O /data/blockchain.raw https://downloads.getmonero.org/blockchain.raw
docker run --rm -it --name xmr -v `pwd`/data:/opt/data wshub/monero /opt/coin/monero-blockchain-import --data-dir /opt/data/blocks --input-file /opt/data/blockchain.raw --dangerous-unverified-import 1
```
