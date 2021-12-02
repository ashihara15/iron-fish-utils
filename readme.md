
# iron-fish utils


References:
* Discord: https://discord.gg/EkQkEcm8DH
* https://ironfish.network/
* https://testnet.ironfish.network/about
* https://ironfish.network/docs/onboarding/iron-fish-tutorial
* https://github.com/iron-fish/ironfish
* https://github.com/iron-fish/ironfish/blob/master/ironfish-cli/Dockerfile



# TLDR :: incentivized testnet + mining + docker

This approach assumes you have docker and a shell, and know at least a little
bit about how to use them (os x, linux, etc).


### Setup

```
> docker pull ghcr.io/iron-fish/ironfish:latest
> docker compose up -d
> source ./source-me.sh
> ironfish config:set nodeName "some-name-here"
> ironfish config:set blockGraffiti "some-unique-graffiti-here"
> docker compose restart

# watch logs as desired:
> docker compose logs -f
```

### Sign up

* Visit: https://testnet.ironfish.network/about
  * Go to "sign up"
  * When creating account, use the same "graffiti" from config:set above


### Misc pro tips

* Join the discord
* Occasionally restart because there are known memory leaks
* Edit the thread count in the docker compose file
* Don't run too many threads vs cores or contention will slow down mining


```
# Occasionally restart
> docker compose restart

# New Release?
> docker pull ghcr.io/iron-fish/ironfish:latest
> docker compose down
> docker compose up -d
> docker compose logs -f
```




# Getting started - longer version


```
#
# Just starting?
#
# 1. Start the main node for the first time
#    a. At first start, config will be initialized and account will be created
#    b. Watch and wait for the chain to sync (ranges from minutes to days depending on chain length)
#

# start the main node
> docker compose up iron-fish -d

# check and/or follow the logs
> docker compose logs -f
> docker compose logs --tail 30


#
# 2. While waiting for the initial sync...
#
#  . explore the docs 
#  . explore the cli command (start with help)
#  . try out different ironfish status and info commands
#  . check out peers and workers with ironfish cli commands
#
#  . check out the config settings if you want to name your node etc
#  . stop and start the node and update config as desired, and it will pick back up with sync
#

> source ./source-me.sh
> ironfish status
> ironfish help

# Set your node name and graffiti
> ironfish config:set nodeName "some-name-here"
> ironfish config:set blockGraffiti "some-unique-graffiti-here"

# Sign up for the incentivized testnet and use your same graffiti
* https://testnet.ironfish.network/about


#
# 3. Fully synced? Start the miner process:
#

> docker compose up iron-fish-miner -d
> source ./source-me.sh
> ironfish status

```





# Misc Reference


### ironfish cli via docker - for ad hoc ironfish cli commands

```
> source ./source-me.sh
> ironfish help
> ironfish status
```


### general node control via docker compose

```
# Get the latest image
> docker pull ghcr.io/iron-fish/ironfish:latest

# Stop everything
> docker compose down

# Start both nodes in the background
> docker compose up -d

# Start just the main node (not the miner) in the background
> docker compose up iron-fish -d

# Restart both processes
> docker compose restart

# Check the latest logs
> docker compose logs --tail 30

# Follow the logs
> docker compose logs --tail 30 -f
```


### misc notes

```
# Full docker command for status without alias
docker run --rm --tty --interactive --network host \
           --volume $HOME/.ironfish:/root/.ironfish \
           ghcr.io/iron-fish/ironfish:latest \
           status -f
```

```
# Original from the onboarding instructions
docker run --rm --tty --interactive --network host --volume <home-directory>/.ironfish:/root/.ironfish ghcr.io/iron-fish/ironfish:latest
docker run --rm --tty --interactive --network host --volume <home-directory>/.ironfish:/root/.ironfish ghcr.io/iron-fish/ironfish:latest status -f
```



