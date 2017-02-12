# Test add a New Members to etcd

## In terminal 1 (etcd0)

```
$ vagrant up
```

```
$ vagrant ssh etcd0
$ sudo su
# cd /root/
# source config
# ./etcd
2017-02-12 14:44:46.106108 I | flags: recognized and used environment variable ETCD_ADVERTISE_CLIENT_URLS=http://172.28.128.20:2379,http://172.28.128.20:4001
2017-02-12 14:44:46.108300 I | flags: recognized and used environment variable ETCD_DATA_DIR=/etcd_data/
2017-02-12 14:44:46.108561 I | flags: recognized and used environment variable ETCD_INITIAL_ADVERTISE_PEER_URLS=http://172.28.128.20:2380,http://172.28.128.20:7001
2017-02-12 14:44:46.108823 I | flags: recognized and used environment variable ETCD_INITIAL_CLUSTER=etcd0=http://172.28.128.20:2380,etcd0=http://172.28.128.20:7001
...
2017-02-12 14:44:46.650306 I | raft: 494ddd76cbf3d43a is starting a new election at term 1
2017-02-12 14:44:46.653344 I | raft: 494ddd76cbf3d43a became candidate at term 2
2017-02-12 14:44:46.653951 I | raft: 494ddd76cbf3d43a received vote from 494ddd76cbf3d43a at term 2
2017-02-12 14:44:46.654232 I | raft: 494ddd76cbf3d43a became leader at term 2
2017-02-12 14:44:46.654499 I | raft: raft.node: 494ddd76cbf3d43a elected leader 494ddd76cbf3d43a at term 2
2017-02-12 14:44:46.656459 I | etcdserver: setting up the initial cluster version to 2.3
2017-02-12 14:44:46.664810 N | etcdserver: set the initial cluster version to 2.3
2017-02-12 14:44:46.666655 I | etcdserver: published {Name:etcd0 ClientURLs:[http://172.28.128.20:2379 http://172.28.128.20:4001]} to cluster 4e038c824bb4b7a3
```

## In terminal 2 (etcdctl)

```
$ vagrant ssh etcdctl
$ sudo su
# cd /root/
# source config
# ./etcdctl cluster-health
member 494ddd76cbf3d43a is healthy: got healthy result from http://172.28.128.20:2379
# ./etcdctl member list
494ddd76cbf3d43a: name=etcd0 peerURLs=http://172.28.128.20:2380,http://172.28.128.20:7001 clientURLs=http://172.28.128.20:2379,http://172.28.128.20:4001 isLeader=true
```

Add new member `etcd1` :

```
# ./etcdctl member add etcd1 http://172.28.128.21:2380
Added member named etcd1 with ID dbc1eec63f2df556 to cluster

# ./etcdctl member list
494ddd76cbf3d43a: name=etcd0 peerURLs=http://172.28.128.20:2380,http://172.28.128.20:7001 clientURLs=http://172.28.128.20:2379,http://172.28.128.20:4001 isLeader=true
dbc1eec63f2df556[unstarted]: peerURLs=http://172.28.128.21:2380
```

## In terminal 3 (etcd1)

```
$ vagrant ssh etcd1
$ sudo su
# cd /root/
# source config
# ./etcd
2017-02-12 15:07:10.455594 I | flags: recognized and used environment variable ETCD_ADVERTISE_CLIENT_URLS=http://172.28.128.21:2379
2017-02-12 15:07:10.457689 I | flags: recognized and used environment variable ETCD_DATA_DIR=/etcd_data/
2017-02-12 15:07:10.458003 I | flags: recognized and used environment variable ETCD_INITIAL_ADVERTISE_PEER_URLS=http://172.28.128.21:2380
2017-02-12 15:07:10.458218 I | flags: recognized and used environment variable ETCD_INITIAL_CLUSTER=etcd0=http://172.28.128.20:2380,etcd0=http://172.28.128.20:7001,etcd1=http://172.28.128.21:2380
2017-02-12 15:07:10.458515 I | flags: recognized and used environment variable ETCD_INITIAL_CLUSTER_STATE=existing
2017-02-12 15:07:10.458686 I | flags: recognized and used environment variable ETCD_INITIAL_CLUSTER_TOKEN=stephanetoken
2017-02-12 15:07:10.458908 I | flags: recognized and used environment variable ETCD_LISTEN_CLIENT_URLS=http://172.28.128.21:2379
2017-02-12 15:07:10.459092 I | flags: recognized and used environment variable ETCD_LISTEN_PEER_URLS=http://172.28.128.21:2380
2017-02-12 15:07:10.459267 I | flags: recognized and used environment variable ETCD_NAME=etcd1
2017-02-12 15:07:10.459520 I | etcdmain: etcd Version: 2.3.7
2017-02-12 15:07:10.459693 I | etcdmain: Git SHA: fd17c91
2017-02-12 15:07:10.460192 I | etcdmain: Go Version: go1.6.2
2017-02-12 15:07:10.460375 I | etcdmain: Go OS/Arch: linux/amd64
...
2017-02-12 15:07:10.557716 I | raft: dbc1eec63f2df556 became follower at term 2
2017-02-12 15:07:10.558705 I | raft: raft.node: dbc1eec63f2df556 elected leader 494ddd76cbf3d43a at term 2
2017-02-12 15:07:10.581433 N | etcdserver: added member 494ddd76cbf3d43a [http://172.28.128.20:2380 http://172.28.128.20:7001] to cluster 4e038c824bb4b7a3
2017-02-12 15:07:10.583230 N | etcdserver: set the initial cluster version to 2.3
2017-02-12 15:07:10.597985 N | etcdserver: added local member dbc1eec63f2df556 [http://172.28.128.21:2380] to cluster 4e038c824bb4b7a3
2017-02-12 15:07:10.599635 I | etcdserver: published {Name:etcd1 ClientURLs:[http://172.28.128.21:2379]} to cluster 4e038c824bb4b7a3
```

## In terminal 2 (etcdctl)

```
# ./etcdctl member list
494ddd76cbf3d43a: name=etcd0 peerURLs=http://172.28.128.20:2380,http://172.28.128.20:7001 clientURLs=http://172.28.128.20:2379,http://172.28.128.20:4001 isLeader=true
dbc1eec63f2df556: name=etcd1 peerURLs=http://172.28.128.21:2380 clientURLs=http://172.28.128.21:2379 isLeader=false
```

I add some data in *etcd*:

```
# ./etcdctl mkdir foo
# ./etcdctl set foo/bar value=hello
value=hello
# ./etcdctl get foo/bar
value=hello
```

Add new member `etcd2`:

```
# ./etcdctl member add etcd2 http://172.28.128.22:2380
Added member named etcd2 with ID e2679dd66feadfa to cluster
```


## In terminal 4 (etcd4)

```
$ vagrant ssh etcd2
$ sudo su
# cd /root/
# source config
# ./etcd
2017-02-12 15:30:23.436166 I | etcdmain: etcd Version: 2.3.7
2017-02-12 15:30:23.437870 I | etcdmain: Git SHA: fd17c91
2017-02-12 15:30:23.438248 I | etcdmain: Go Version: go1.6.2
2017-02-12 15:30:23.438375 I | etcdmain: Go OS/Arch: linux/amd64
2017-02-12 15:30:23.438775 I | etcdmain: setting maximum number of CPUs to 1, total number of available CPUs is 1
2017-02-12 15:30:23.439224 W | etcdmain: no data-dir provided, using default data-dir ./default.etcd
2017-02-12 15:30:23.446694 I | etcdmain: listening for peers on http://localhost:2380
2017-02-12 15:30:23.447540 I | etcdmain: listening for peers on http://localhost:7001
2017-02-12 15:30:23.448481 I | etcdmain: listening for client requests on http://localhost:2379
2017-02-12 15:30:23.449378 I | etcdmain: listening for client requests on http://localhost:4001
2017-02-12 15:30:23.457345 I | etcdserver: name = default
2017-02-12 15:30:23.457610 I | etcdserver: data dir = default.etcd
2017-02-12 15:30:23.457803 I | etcdserver: member dir = default.etcd/member
2017-02-12 15:30:23.458091 I | etcdserver: heartbeat = 100ms
2017-02-12 15:30:23.458395 I | etcdserver: election = 1000ms
2017-02-12 15:30:23.458680 I | etcdserver: snapshot count = 10000
2017-02-12 15:30:23.458853 I | etcdserver: advertise client URLs = http://localhost:2379,http://localhost:4001
2017-02-12 15:30:23.459144 I | etcdserver: initial advertise peer URLs = http://localhost:2380,http://localhost:7001
2017-02-12 15:30:23.459344 I | etcdserver: initial cluster = default=http://localhost:2380,default=http://localhost:7001
2017-02-12 15:30:23.466681 I | etcdserver: starting member ce2a822cea30bfca in cluster 7e27652122e8b2ae
...
2017-02-12 15:30:23.497115 N | etcdserver: added local member ce2a822cea30bfca [http://localhost:2380 http://localhost:7001] to cluster 7e27652122e8b2ae
2017-02-12 15:30:23.875903 I | raft: ce2a822cea30bfca is starting a new election at term 1
2017-02-12 15:30:23.878964 I | raft: ce2a822cea30bfca became candidate at term 2
2017-02-12 15:30:23.879691 I | raft: ce2a822cea30bfca received vote from ce2a822cea30bfca at term 2
2017-02-12 15:30:23.880015 I | raft: ce2a822cea30bfca became leader at term 2
2017-02-12 15:30:23.880812 I | raft: raft.node: ce2a822cea30bfca elected leader ce2a822cea30bfca at term 2
2017-02-12 15:30:23.884055 I | etcdserver: published {Name:default ClientURLs:[http://localhost:2379 http://localhost:4001]} to cluster 7e27652122e8b2ae
2017-02-12 15:30:23.885383 I | etcdserver: setting up the initial cluster version to 2.3
2017-02-12 15:30:23.885797 N | etcdserver: set the initial cluster version to 2.3
```


## In terminal 2 (etcdctl)

```
# ./etcdctl member list
e2679dd66feadfa: name=etcd2 peerURLs=http://172.28.128.22:2380 clientURLs=http://172.28.128.22:2379 isLeader=false
494ddd76cbf3d43a: name=etcd0 peerURLs=http://172.28.128.20:2380,http://172.28.128.20:7001 clientURLs=http://172.28.128.20:2379,http://172.28.128.20:4001 isLeader=true
dbc1eec63f2df556: name=etcd1 peerURLs=http://172.28.128.21:2380 clientURLs=http://172.28.128.21:2379 isLeader=false
```

I shutdown `etcd0` and I check if all work great.

```
# export ETCDCTL_ENDPOINT=http://etcd1:2379
# ./etcdctl cluster-health
member e2679dd66feadfa is healthy: got healthy result from http://172.28.128.22:2379
failed to check the health of member 494ddd76cbf3d43a on http://172.28.128.20:2379: Get http://172.28.128.20:2379/health: dial tcp 172.28.128.20:2379: getsockopt: connection refused
failed to check the health of member 494ddd76cbf3d43a on http://172.28.128.20:4001: Get http://172.28.128.20:4001/health: dial tcp 172.28.128.20:4001: getsockopt: connection refused
member 494ddd76cbf3d43a is unreachable: [http://172.28.128.20:2379 http://172.28.128.20:4001] are all unreachable
member dbc1eec63f2df556 is healthy: got healthy result from http://172.28.128.21:2379
# ./etcdctl member list
e2679dd66feadfa: name=etcd2 peerURLs=http://172.28.128.22:2380 clientURLs=http://172.28.128.22:2379 isLeader=true
494ddd76cbf3d43a: name=etcd0 peerURLs=http://172.28.128.20:2380,http://172.28.128.20:7001 clientURLs=http://172.28.128.20:2379,http://172.28.128.20:4001 isLeader=false
dbc1eec63f2df556: name=etcd1 peerURLs=http://172.28.128.21:2380 clientURLs=http://172.28.128.21:2379 isLeader=false
# ./etcdctl get foo/bar
value=hello
```
