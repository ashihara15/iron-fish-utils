

### Caution

These notes are more of a quick reference for those familiar with docker.

It is assumed that the main node and account are already setup, including 
signing up for the testnet, setting graffiti, etc.  

Maybe you've been running a single node, and now you want to switch to a
multi-node mining arrangement? The quick reference & skeleton for that is below.

Warning: Don't run these on a public ip with the rpc tcp port open to the world


### Initial Setup - sync the account + graffiti

```
# main node
# (record these items, or output them to a file, for use on the remote node)
> ironfish accounts:export 
> ironfish config:get blockGraffiti

# remote node
> ironfish accounts:import
# paste in the details from the export
> ironfish config:set blockGraffiti "your-graffiti-here"
```


### Run the programs

Below is just a quick note on startup.  Most folks will want to add `-d` for
detatching and running the containers in the background.  More docker references
can be seen in the main readme.


Run main node & local miner (on the main node host):
```
> docker compose up iron-fish iron-fish-miner
```


Run remote miner (on each remote host):
```
> docker compose up iron-fish-miner-remote
```


