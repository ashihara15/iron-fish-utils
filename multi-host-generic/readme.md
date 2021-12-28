
## single node + multi-miner setup - quick reference


reminders:

* Don't run the node or miner on a public ip with the tcp port open to the world
* all miners need to be able to access the node ip and port (all on same network is easiest)
* windows? make sure windows firewall isn't blocking inbound traffic for tcp on port 8001 on the node
* windows? docker host mode networking doesn't work so use "-p 8001:8001" instead of "--network host"
* have same account and config setup on each host
* Be wary of the -1 threads and tune it to fit your setup


changes required:

* change "ironfish" command to match your install type (ex: yarn start, docker run -it ..., etc)
* change the ip address in the examples to the address of your main node (see: 192.168.3.8)


```
# run the node:
ironfish start --rpc.ipc --rpc.tcp --rpc.tcp.host=192.168.3.8 --rpc.tcp.port=8001

# run a local miner (ipc):
ironfish miners:start --threads 12

# run a remote miner (tcp):
ironfish miners:start --threads -1 --rpc.tcp --rpc.tcp.host=192.168.3.8 --rpc.tcp.port=8001
```



