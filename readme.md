
# iron-fish utils

The notes and utils here are generally applicable if:

* you are running linux or os x
* you have docker and basic command line experience
* you are ok using docker compose for orchestration



## TLDR :: incentivized testnet + mining + docker compose

A quick start for getting up and running on the incentivized testnet with
a single computer.


### 1. Sign up

If you want credit during the incentivized testnet period, you'll need to sign up.

* Visit: https://testnet.ironfish.network/about
  * Go to "sign up"
  * Make up a "graffiti" string which is sort of like a public user name
  * Save the graffiti string and use it in the "config:set blockGraffiti" noted in the section below


### 2. Set up (a node and a miner)

```
# start the node and the miner
> docker pull ghcr.io/iron-fish/ironfish:latest
> docker compose up -d

# run ad hoc commands, including setting some important config
> source ./source-me.sh
> ironfish config:set nodeName "some-name-here"
> ironfish config:set blockGraffiti "unique-graffiti-string-from-signup-here"

# restart after config change
> docker compose restart

# watch logs as desired:
> docker compose logs -f
```

### 3. Misc pro tips

* Join the discord @ https://discord.gg/EkQkEcm8DH
* Edit the thread count in the docker compose file based on your core count
* Don't run too many threads vs cores or contention will slow down mining


```
# New Release announced?
> docker pull ghcr.io/iron-fish/ironfish:latest
> docker compose down
> docker compose up -d
> docker compose logs -f
```


### 4. Docs & References

Tons more information can be found in the official docs, discord, etc

* Discord: https://discord.gg/EkQkEcm8DH
* https://ironfish.network/
* https://testnet.ironfish.network/about
* https://ironfish.network/docs/onboarding/iron-fish-tutorial
* https://github.com/iron-fish/ironfish
* https://github.com/iron-fish/ironfish/blob/master/ironfish-cli/Dockerfile




## Misc Reference


### ironfish cli via docker - for ad hoc ironfish cli commands

```
> source ./source-me.sh
> ironfish help
> ironfish status
> ironfish status -f
> ironfish accounts:balance
> ironfish accounts:export
...
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


### notes from the docs

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



