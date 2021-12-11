
## single node + multi-miner setup - quick reference


reminders:

* all miners need to be able to access the node ip and port (all on same network is easiest)
* windows? make sure windows firewall isn't blocking inbound traffict for tcp on port 8001 on the node
* set thread counts however you like.  maybe run max-1 on main node, to allow one core for node (vs miner)
* have same account and config setup on each host


changes required:

* change "ironfish" command to match your install type (ex: yarn start, docker run -it ..., etc)
* change the ip address in the examples to the address of your main node


```
# run the node:
ironfish start --rpc.ipc --rpc.tcp --rpc.tcp.host=172.16.0.1 --rpc.tcp.port=8001

# run a miner:
ironfish miners:start --threads -1 --rpc.tcp --rpc.tcp.host=172.16.0.1 --rpc.tcp.port=8001
```



