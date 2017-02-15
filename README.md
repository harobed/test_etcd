# Test add news members to etcd

## In terminal 1 (etcd0)

```
$ vagrant up
```

Create certificates:

```
$ vagrant ssh etcd0
$ sudo su
# cd
# cd tls-setup
# make
# exit
$ exit
$ ./copy_certs.sh
```

```
$ vagrant ssh etcd0
$ sudo su
# cd /root/
# source config
# ./etcd
2017-02-15 16:54:44.539857 I | pkg/flags: recognized and used environment variable ETCD_ADVERTISE_CLIENT_URLS=http://etcd0:2379
2017-02-15 16:54:44.541289 I | pkg/flags: recognized and used environment variable ETCD_DATA_DIR=/etcd_data/
2017-02-15 16:54:44.541798 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_ADVERTISE_PEER_URLS=https://etcd0:2380
2017-02-15 16:54:44.542440 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_CLUSTER=etcd0=https://etcd0:2380
2017-02-15 16:54:44.542751 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_CLUSTER_STATE=new
2017-02-15 16:54:44.542933 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_CLUSTER_TOKEN=stephanetoken
2017-02-15 16:54:44.543118 I | pkg/flags: recognized and used environment variable ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379
2017-02-15 16:54:44.543293 I | pkg/flags: recognized and used environment variable ETCD_LISTEN_PEER_URLS=https://0.0.0.0:2380
2017-02-15 16:54:44.543465 I | pkg/flags: recognized and used environment variable ETCD_NAME=etcd0
2017-02-15 16:54:44.543633 I | pkg/flags: recognized and used environment variable ETCD_PEER_CA_FILE=/root/certs/ca.pem
2017-02-15 16:54:44.543813 I | pkg/flags: recognized and used environment variable ETCD_PEER_CERT_FILE=/root/certs/etcd0.pem
2017-02-15 16:54:44.543980 I | pkg/flags: recognized and used environment variable ETCD_PEER_KEY_FILE=/root/certs/etcd0-key.pem
2017-02-15 16:54:44.544266 I | etcdmain: etcd Version: 3.1.0
2017-02-15 16:54:44.544440 I | etcdmain: Git SHA: 8ba2897
2017-02-15 16:54:44.544619 I | etcdmain: Go Version: go1.7.4
2017-02-15 16:54:44.544798 I | etcdmain: Go OS/Arch: linux/amd64
2017-02-15 16:54:44.545051 I | etcdmain: setting maximum number of CPUs to 1, total number of available CPUs is 1
2017-02-15 16:54:44.545525 I | embed: peerTLS: cert = /root/certs/etcd0.pem, key = /root/certs/etcd0-key.pem, ca = /root/certs/ca.pem, trusted-ca = , client-cert-auth = false
2017-02-15 16:54:44.562972 I | embed: listening for peers on https://0.0.0.0:2380
2017-02-15 16:54:44.563705 I | embed: listening for client requests on 0.0.0.0:2379
2017-02-15 16:54:44.588951 I | warning: ignoring ServerName for user-provided CA for backwards compatibility is deprecated
2017-02-15 16:54:44.591920 I | pkg/netutil: resolving etcd0:2380 to 127.0.0.1:2380
2017-02-15 16:54:44.592334 I | pkg/netutil: resolving etcd0:2380 to 127.0.0.1:2380
2017-02-15 16:54:44.593111 I | etcdserver: name = etcd0
2017-02-15 16:54:44.593301 I | etcdserver: data dir = /etcd_data/
2017-02-15 16:54:44.593464 I | etcdserver: member dir = /etcd_data/member
2017-02-15 16:54:44.593625 I | etcdserver: heartbeat = 100ms
2017-02-15 16:54:44.593808 I | etcdserver: election = 1000ms
2017-02-15 16:54:44.593973 I | etcdserver: snapshot count = 10000
2017-02-15 16:54:44.594172 I | etcdserver: advertise client URLs = http://etcd0:2379
2017-02-15 16:54:44.594343 I | etcdserver: initial advertise peer URLs = https://etcd0:2380
2017-02-15 16:54:44.594528 I | etcdserver: initial cluster = etcd0=https://etcd0:2380
2017-02-15 16:54:44.605844 I | etcdserver: starting member 1eec2a5c2b8e3129 in cluster 2ac40d9fb4d3cf74
2017-02-15 16:54:44.606552 I | raft: 1eec2a5c2b8e3129 became follower at term 0
2017-02-15 16:54:44.606982 I | raft: newRaft 1eec2a5c2b8e3129 [peers: [], term: 0, commit: 0, applied: 0, lastindex: 0, lastterm: 0]
2017-02-15 16:54:44.607184 I | raft: 1eec2a5c2b8e3129 became follower at term 1
2017-02-15 16:54:44.633248 I | warning: ignoring ServerName for user-provided CA for backwards compatibility is deprecated
2017-02-15 16:54:44.647243 I | warning: ignoring ServerName for user-provided CA for backwards compatibility is deprecated
2017-02-15 16:54:44.647941 I | etcdserver: starting server... [version: 3.1.0, cluster version: to_be_decided]
2017-02-15 16:54:44.654651 I | etcdserver/membership: added member 1eec2a5c2b8e3129 [https://etcd0:2380] to cluster 2ac40d9fb4d3cf74
2017-02-15 16:54:45.509444 I | raft: 1eec2a5c2b8e3129 is starting a new election at term 1
2017-02-15 16:54:45.511038 I | raft: 1eec2a5c2b8e3129 became candidate at term 2
2017-02-15 16:54:45.511552 I | raft: 1eec2a5c2b8e3129 received MsgVoteResp from 1eec2a5c2b8e3129 at term 2
2017-02-15 16:54:45.511890 I | raft: 1eec2a5c2b8e3129 became leader at term 2
2017-02-15 16:54:45.512217 I | raft: raft.node: 1eec2a5c2b8e3129 elected leader 1eec2a5c2b8e3129 at term 2
2017-02-15 16:54:45.513542 I | etcdserver: setting up the initial cluster version to 3.1
2017-02-15 16:54:45.514900 N | etcdserver/membership: set the initial cluster version to 3.1
2017-02-15 16:54:45.514949 I | etcdserver/api: enabled capabilities for version 3.1
2017-02-15 16:54:45.515138 I | etcdserver: published {Name:etcd0 ClientURLs:[http://etcd0:2379]} to cluster 2ac40d9fb4d3cf74
2017-02-15 16:54:45.515551 E | etcdmain: forgot to set Type=notify in systemd service file?
2017-02-15 16:54:45.515863 I | embed: ready to serve client requests
2017-02-15 16:54:45.518932 N | embed: serving insecure client requests on [::]:2379, this is strongly discouraged!
```

## In terminal 2 (etcdctl)

```
$ vagrant ssh etcdctl
$ sudo su
# cd /root/
# source config
# ./etcdctl cluster-health
member 1eec2a5c2b8e3129 is healthy: got healthy result from http://etcd0:2379
cluster is healthy
# ./etcdctl member list
1eec2a5c2b8e3129: name=etcd0 peerURLs=https://etcd0:2380 clientURLs=http://etcd0:2379 isLeader=true
```

Add new member `etcd1` :

```
# ./etcdctl member add etcd1 https://etcd1:2380
Added member named etcd1 with ID 709fe558a49720e3 to cluster

ETCD_NAME="etcd1"
ETCD_INITIAL_CLUSTER="etcd0=https://etcd0:2380,etcd1=https://etcd1:2380"
ETCD_INITIAL_CLUSTER_STATE="existing"
```

## In terminal 3 (etcd1)

```
$ vagrant ssh etcd1
$ sudo su
# cd /root/
# source config
# ./etcd
2017-02-15 17:13:57.693332 I | pkg/flags: recognized and used environment variable ETCD_ADVERTISE_CLIENT_URLS=http://etcd1:2379
2017-02-15 17:13:57.693875 I | pkg/flags: recognized and used environment variable ETCD_DATA_DIR=/etcd_data/
2017-02-15 17:13:57.694184 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_ADVERTISE_PEER_URLS=https://etcd1:2380
2017-02-15 17:13:57.694349 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_CLUSTER=etcd0=https://etcd0:2380,etcd1=https://etcd1:2380
2017-02-15 17:13:57.694821 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_CLUSTER_STATE=existing
2017-02-15 17:13:57.695060 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_CLUSTER_TOKEN=stephanetoken
2017-02-15 17:13:57.695376 I | pkg/flags: recognized and used environment variable ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379
2017-02-15 17:13:57.695628 I | pkg/flags: recognized and used environment variable ETCD_LISTEN_PEER_URLS=https://0.0.0.0:2380
2017-02-15 17:13:57.696023 I | pkg/flags: recognized and used environment variable ETCD_NAME=etcd1
2017-02-15 17:13:57.696318 I | pkg/flags: recognized and used environment variable ETCD_PEER_CA_FILE=/root/certs/ca.pem
2017-02-15 17:13:57.696667 I | pkg/flags: recognized and used environment variable ETCD_PEER_CERT_FILE=/root/certs/etcd1.pem
2017-02-15 17:13:57.696897 I | pkg/flags: recognized and used environment variable ETCD_PEER_KEY_FILE=/root/certs/etcd1-key.pem
2017-02-15 17:13:57.697397 I | etcdmain: etcd Version: 3.1.0
2017-02-15 17:13:57.697615 I | etcdmain: Git SHA: 8ba2897
2017-02-15 17:13:57.697968 I | etcdmain: Go Version: go1.7.4
2017-02-15 17:13:57.698229 I | etcdmain: Go OS/Arch: linux/amd64
2017-02-15 17:13:57.698820 I | etcdmain: setting maximum number of CPUs to 1, total number of available CPUs is 1
2017-02-15 17:13:57.700023 I | embed: peerTLS: cert = /root/certs/etcd1.pem, key = /root/certs/etcd1-key.pem, ca = /root/certs/ca.pem, trusted-ca = , client-cert-auth = false
2017-02-15 17:13:57.716540 I | embed: listening for peers on https://0.0.0.0:2380
2017-02-15 17:13:57.717174 I | embed: listening for client requests on 0.0.0.0:2379
2017-02-15 17:13:57.743762 I | warning: ignoring ServerName for user-provided CA for backwards compatibility is deprecated
2017-02-15 17:13:57.881603 I | pkg/netutil: resolving etcd0:2380 to 172.28.128.20:2380
2017-02-15 17:13:57.881912 I | pkg/netutil: resolving etcd0:2380 to 172.28.128.20:2380
2017-02-15 17:13:57.882573 I | pkg/netutil: resolving etcd1:2380 to 127.0.0.1:2380
2017-02-15 17:13:57.882855 I | pkg/netutil: resolving etcd1:2380 to 127.0.0.1:2380
2017-02-15 17:13:57.883850 I | etcdserver: name = etcd1
2017-02-15 17:13:57.883861 I | etcdserver: data dir = /etcd_data/
2017-02-15 17:13:57.883865 I | etcdserver: member dir = /etcd_data/member
2017-02-15 17:13:57.883868 I | etcdserver: heartbeat = 100ms
2017-02-15 17:13:57.883871 I | etcdserver: election = 1000ms
2017-02-15 17:13:57.883874 I | etcdserver: snapshot count = 10000
2017-02-15 17:13:57.883882 I | etcdserver: advertise client URLs = http://etcd1:2379
2017-02-15 17:13:57.887888 I | etcdserver: starting member 709fe558a49720e3 in cluster 2ac40d9fb4d3cf74
2017-02-15 17:13:57.888843 I | raft: 709fe558a49720e3 became follower at term 0
2017-02-15 17:13:57.889415 I | raft: newRaft 709fe558a49720e3 [peers: [], term: 0, commit: 0, applied: 0, lastindex: 0, lastterm: 0]
2017-02-15 17:13:57.889898 I | raft: 709fe558a49720e3 became follower at term 1
2017-02-15 17:13:57.938578 I | warning: ignoring ServerName for user-provided CA for backwards compatibility is deprecated
2017-02-15 17:13:57.950429 I | warning: ignoring ServerName for user-provided CA for backwards compatibility is deprecated
2017-02-15 17:13:57.951786 I | rafthttp: started HTTP pipelining with peer 1eec2a5c2b8e3129
2017-02-15 17:13:57.952298 I | rafthttp: starting peer 1eec2a5c2b8e3129...
2017-02-15 17:13:57.952528 I | rafthttp: started HTTP pipelining with peer 1eec2a5c2b8e3129
2017-02-15 17:13:57.958029 I | rafthttp: started streaming with peer 1eec2a5c2b8e3129 (writer)
2017-02-15 17:13:57.961155 I | rafthttp: started peer 1eec2a5c2b8e3129
2017-02-15 17:13:57.961711 I | rafthttp: added peer 1eec2a5c2b8e3129
2017-02-15 17:13:57.962107 I | etcdserver: starting server... [version: 3.1.0, cluster version: to_be_decided]
2017-02-15 17:13:57.966004 I | rafthttp: started streaming with peer 1eec2a5c2b8e3129 (stream Message reader)
2017-02-15 17:13:57.985981 I | rafthttp: started streaming with peer 1eec2a5c2b8e3129 (writer)
2017-02-15 17:13:57.986709 I | rafthttp: started streaming with peer 1eec2a5c2b8e3129 (stream MsgApp v2 reader)
2017-02-15 17:13:58.153353 I | rafthttp: peer 1eec2a5c2b8e3129 became active
2017-02-15 17:13:58.153721 I | rafthttp: established a TCP streaming connection with peer 1eec2a5c2b8e3129 (stream Message writer)
2017-02-15 17:13:58.184077 I | rafthttp: established a TCP streaming connection with peer 1eec2a5c2b8e3129 (stream MsgApp v2 writer)
2017-02-15 17:13:58.212379 I | rafthttp: established a TCP streaming connection with peer 1eec2a5c2b8e3129 (stream Message reader)
2017-02-15 17:13:58.217291 I | rafthttp: established a TCP streaming connection with peer 1eec2a5c2b8e3129 (stream MsgApp v2 reader)
2017-02-15 17:13:58.699624 I | raft: 709fe558a49720e3 [term: 1] received a MsgVote message with higher term from 1eec2a5c2b8e3129 [term: 43]
2017-02-15 17:13:58.699647 I | raft: 709fe558a49720e3 became follower at term 43
2017-02-15 17:13:58.699655 I | raft: 709fe558a49720e3 [logterm: 0, index: 0, vote: 0] cast MsgVote for 1eec2a5c2b8e3129 [logterm: 2, index: 6] at term 43
2017-02-15 17:13:58.703300 I | raft: raft.node: 709fe558a49720e3 elected leader 1eec2a5c2b8e3129 at term 43
2017-02-15 17:13:58.705669 I | etcdserver/membership: added member 1eec2a5c2b8e3129 [https://etcd0:2380] to cluster 2ac40d9fb4d3cf74
2017-02-15 17:13:58.706918 N | etcdserver/membership: set the initial cluster version to 3.1
2017-02-15 17:13:58.707403 I | etcdserver/api: enabled capabilities for version 3.1
2017-02-15 17:13:58.707818 I | etcdserver/membership: added member 709fe558a49720e3 [https://etcd1:2380] to cluster 2ac40d9fb4d3cf74
2017-02-15 17:13:58.714373 I | etcdserver: published {Name:etcd1 ClientURLs:[http://etcd1:2379]} to cluster 2ac40d9fb4d3cf74
2017-02-15 17:13:58.714960 E | etcdmain: forgot to set Type=notify in systemd service file?
2017-02-15 17:13:58.715317 I | embed: ready to serve client requests
2017-02-15 17:13:58.718490 N | embed: serving insecure client requests on [::]:2379, this is strongly discouraged!
```

## In terminal 2 (etcdctl)

```
# ./etcdctl member list
1eec2a5c2b8e3129: name=etcd0 peerURLs=https://etcd0:2380 clientURLs=http://etcd0:2379 isLeader=true
709fe558a49720e3: name=etcd1 peerURLs=https://etcd1:2380 clientURLs=http://etcd1:2379 isLeader=false
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
# ./etcdctl member add etcd2 https://etcd2:2380
Added member named etcd2 with ID e2679dd66feadfa to cluster
```


## In terminal 4 (etcd2)

```
$ vagrant ssh etcd2
$ sudo su
# cd /root/
# source config
# ./etcd
2017-02-15 17:52:26.041196 I | pkg/flags: recognized and used environment variable ETCD_ADVERTISE_CLIENT_URLS=http://etcd2:2379
2017-02-15 17:52:26.042466 I | pkg/flags: recognized and used environment variable ETCD_DATA_DIR=/etcd_data/
2017-02-15 17:52:26.043125 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_ADVERTISE_PEER_URLS=https://etcd2:2380
2017-02-15 17:52:26.043997 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_CLUSTER=etcd0=https://etcd0:2380,etcd1=https://etcd1:2380,etcd2=https://etcd2:2380
2017-02-15 17:52:26.044417 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_CLUSTER_STATE=existing
2017-02-15 17:52:26.045029 I | pkg/flags: recognized and used environment variable ETCD_INITIAL_CLUSTER_TOKEN=stephanetoken
2017-02-15 17:52:26.045242 I | pkg/flags: recognized and used environment variable ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379
2017-02-15 17:52:26.045438 I | pkg/flags: recognized and used environment variable ETCD_LISTEN_PEER_URLS=https://0.0.0.0:2380
2017-02-15 17:52:26.045655 I | pkg/flags: recognized and used environment variable ETCD_NAME=etcd2
2017-02-15 17:52:26.045831 I | pkg/flags: recognized and used environment variable ETCD_PEER_CA_FILE=/root/certs/ca.pem
2017-02-15 17:52:26.045945 I | pkg/flags: recognized and used environment variable ETCD_PEER_CERT_FILE=/root/certs/etcd2.pem
2017-02-15 17:52:26.045958 I | pkg/flags: recognized and used environment variable ETCD_PEER_KEY_FILE=/root/certs/etcd2-key.pem
2017-02-15 17:52:26.046320 I | etcdmain: etcd Version: 3.1.0
2017-02-15 17:52:26.046337 I | etcdmain: Git SHA: 8ba2897
2017-02-15 17:52:26.046388 I | etcdmain: Go Version: go1.7.4
2017-02-15 17:52:26.046399 I | etcdmain: Go OS/Arch: linux/amd64
2017-02-15 17:52:26.046625 I | etcdmain: setting maximum number of CPUs to 1, total number of available CPUs is 1
2017-02-15 17:52:26.047098 I | embed: peerTLS: cert = /root/certs/etcd2.pem, key = /root/certs/etcd2-key.pem, ca = /root/certs/ca.pem, trusted-ca = , client-cert-auth = false
2017-02-15 17:52:26.062564 I | embed: listening for peers on https://0.0.0.0:2380
2017-02-15 17:52:26.063205 I | embed: listening for client requests on 0.0.0.0:2379
2017-02-15 17:52:26.094410 I | warning: ignoring ServerName for user-provided CA for backwards compatibility is deprecated
2017-02-15 17:52:26.206811 I | pkg/netutil: resolving etcd0:2380 to 172.28.128.20:2380
2017-02-15 17:52:26.207139 I | pkg/netutil: resolving etcd0:2380 to 172.28.128.20:2380
2017-02-15 17:52:26.207528 I | pkg/netutil: resolving etcd1:2380 to 172.28.128.21:2380
2017-02-15 17:52:26.207839 I | pkg/netutil: resolving etcd1:2380 to 172.28.128.21:2380
2017-02-15 17:52:26.208350 I | pkg/netutil: resolving etcd2:2380 to 127.0.0.1:2380
2017-02-15 17:52:26.208677 I | pkg/netutil: resolving etcd2:2380 to 127.0.0.1:2380
2017-02-15 17:52:26.286594 I | etcdserver: name = etcd2
2017-02-15 17:52:26.286971 I | etcdserver: data dir = /etcd_data/
2017-02-15 17:52:26.287309 I | etcdserver: member dir = /etcd_data/member
2017-02-15 17:52:26.287651 I | etcdserver: heartbeat = 100ms
2017-02-15 17:52:26.287892 I | etcdserver: election = 1000ms
2017-02-15 17:52:26.288207 I | etcdserver: snapshot count = 10000
2017-02-15 17:52:26.288511 I | etcdserver: advertise client URLs = http://etcd2:2379
2017-02-15 17:52:26.293915 I | etcdserver: starting member 94b7368f02256774 in cluster 2ac40d9fb4d3cf74
2017-02-15 17:52:26.295060 I | raft: 94b7368f02256774 became follower at term 0
2017-02-15 17:52:26.295491 I | raft: newRaft 94b7368f02256774 [peers: [], term: 0, commit: 0, applied: 0, lastindex: 0, lastterm: 0]
2017-02-15 17:52:26.295502 I | raft: 94b7368f02256774 became follower at term 1
2017-02-15 17:52:26.321025 I | warning: ignoring ServerName for user-provided CA for backwards compatibility is deprecated
2017-02-15 17:52:26.331461 I | warning: ignoring ServerName for user-provided CA for backwards compatibility is deprecated
2017-02-15 17:52:26.332240 I | rafthttp: started HTTP pipelining with peer 1eec2a5c2b8e3129
2017-02-15 17:52:26.332661 I | rafthttp: started HTTP pipelining with peer 709fe558a49720e3
2017-02-15 17:52:26.332994 I | rafthttp: starting peer 1eec2a5c2b8e3129...
2017-02-15 17:52:26.333182 I | rafthttp: started HTTP pipelining with peer 1eec2a5c2b8e3129
2017-02-15 17:52:26.338554 I | rafthttp: started streaming with peer 1eec2a5c2b8e3129 (writer)
2017-02-15 17:52:26.342784 I | rafthttp: started peer 1eec2a5c2b8e3129
2017-02-15 17:52:26.344326 I | rafthttp: added peer 1eec2a5c2b8e3129
2017-02-15 17:52:26.345320 I | rafthttp: starting peer 709fe558a49720e3...
2017-02-15 17:52:26.345550 I | rafthttp: started HTTP pipelining with peer 709fe558a49720e3
2017-02-15 17:52:26.350813 I | rafthttp: started streaming with peer 1eec2a5c2b8e3129 (stream Message reader)
2017-02-15 17:52:26.354422 I | rafthttp: started streaming with peer 1eec2a5c2b8e3129 (writer)
2017-02-15 17:52:26.354932 I | rafthttp: started streaming with peer 1eec2a5c2b8e3129 (stream MsgApp v2 reader)
2017-02-15 17:52:26.355366 I | rafthttp: started peer 709fe558a49720e3
2017-02-15 17:52:26.355884 I | rafthttp: added peer 709fe558a49720e3
2017-02-15 17:52:26.356275 I | etcdserver: starting server... [version: 3.1.0, cluster version: to_be_decided]
2017-02-15 17:52:26.357137 I | rafthttp: started streaming with peer 709fe558a49720e3 (writer)
2017-02-15 17:52:26.442711 I | rafthttp: started streaming with peer 709fe558a49720e3 (stream MsgApp v2 reader)
2017-02-15 17:52:26.488641 I | rafthttp: started streaming with peer 709fe558a49720e3 (stream Message reader)
2017-02-15 17:52:26.510920 I | rafthttp: started streaming with peer 709fe558a49720e3 (writer)
2017-02-15 17:52:26.800473 I | raft: 94b7368f02256774 [term: 1] received a MsgHeartbeat message with higher term from 1eec2a5c2b8e3129 [term: 43]
2017-02-15 17:52:26.801259 I | raft: 94b7368f02256774 became follower at term 43
2017-02-15 17:52:26.801699 I | raft: raft.node: 94b7368f02256774 elected leader 1eec2a5c2b8e3129 at term 43
2017-02-15 17:52:26.802681 I | rafthttp: peer 709fe558a49720e3 became active
2017-02-15 17:52:26.802873 I | rafthttp: established a TCP streaming connection with peer 709fe558a49720e3 (stream MsgApp v2 writer)
2017-02-15 17:52:26.839764 I | rafthttp: established a TCP streaming connection with peer 709fe558a49720e3 (stream Message writer)
2017-02-15 17:52:26.845448 I | rafthttp: peer 1eec2a5c2b8e3129 became active
2017-02-15 17:52:26.846693 I | rafthttp: established a TCP streaming connection with peer 1eec2a5c2b8e3129 (stream MsgApp v2 reader)
2017-02-15 17:52:26.892726 I | rafthttp: established a TCP streaming connection with peer 1eec2a5c2b8e3129 (stream MsgApp v2 writer)
2017-02-15 17:52:26.894081 I | rafthttp: established a TCP streaming connection with peer 1eec2a5c2b8e3129 (stream Message writer)
2017-02-15 17:52:26.895210 I | rafthttp: established a TCP streaming connection with peer 1eec2a5c2b8e3129 (stream Message reader)
2017-02-15 17:52:26.944958 I | rafthttp: established a TCP streaming connection with peer 709fe558a49720e3 (stream MsgApp v2 reader)
2017-02-15 17:52:27.036561 I | rafthttp: established a TCP streaming connection with peer 709fe558a49720e3 (stream Message reader)
2017-02-15 17:52:27.084702 I | etcdserver/membership: added member 1eec2a5c2b8e3129 [https://etcd0:2380] to cluster 2ac40d9fb4d3cf74
2017-02-15 17:52:27.085776 N | etcdserver/membership: set the initial cluster version to 3.1
2017-02-15 17:52:27.086003 I | etcdserver/api: enabled capabilities for version 3.1
2017-02-15 17:52:27.086487 I | etcdserver/membership: added member 709fe558a49720e3 [https://etcd1:2380] to cluster 2ac40d9fb4d3cf74
2017-02-15 17:52:27.086910 I | etcdserver/membership: added member 2b9f64cb16836bb1 [http://172.28.128.22:2380] to cluster 2ac40d9fb4d3cf74
2017-02-15 17:52:27.087101 I | rafthttp: starting peer 2b9f64cb16836bb1...
2017-02-15 17:52:27.087328 I | rafthttp: started HTTP pipelining with peer 2b9f64cb16836bb1
2017-02-15 17:52:27.088188 I | rafthttp: started peer 2b9f64cb16836bb1
2017-02-15 17:52:27.088364 I | rafthttp: added peer 2b9f64cb16836bb1
2017-02-15 17:52:27.088783 I | etcdserver/membership: removed member 2b9f64cb16836bb1 from cluster 2ac40d9fb4d3cf74
2017-02-15 17:52:27.089029 I | rafthttp: stopping peer 2b9f64cb16836bb1...
2017-02-15 17:52:27.089467 I | rafthttp: started streaming with peer 2b9f64cb16836bb1 (writer)
2017-02-15 17:52:27.089674 I | rafthttp: stopped streaming with peer 2b9f64cb16836bb1 (writer)
2017-02-15 17:52:27.089844 I | rafthttp: started streaming with peer 2b9f64cb16836bb1 (writer)
2017-02-15 17:52:27.090116 I | rafthttp: stopped streaming with peer 2b9f64cb16836bb1 (writer)
2017-02-15 17:52:27.090452 I | rafthttp: started streaming with peer 2b9f64cb16836bb1 (stream MsgApp v2 reader)
2017-02-15 17:52:27.090791 I | rafthttp: started streaming with peer 2b9f64cb16836bb1 (stream Message reader)
2017-02-15 17:52:27.091066 I | rafthttp: stopped HTTP pipelining with peer 2b9f64cb16836bb1
2017-02-15 17:52:27.091247 I | rafthttp: stopped streaming with peer 2b9f64cb16836bb1 (stream MsgApp v2 reader)
2017-02-15 17:52:27.091532 I | rafthttp: stopped streaming with peer 2b9f64cb16836bb1 (stream Message reader)
2017-02-15 17:52:27.091867 I | rafthttp: stopped peer 2b9f64cb16836bb1
2017-02-15 17:52:27.092284 I | rafthttp: removed peer 2b9f64cb16836bb1
2017-02-15 17:52:27.093284 I | etcdserver/membership: added member 94b7368f02256774 [https://etcd2:2380] to cluster 2ac40d9fb4d3cf74
2017-02-15 17:52:27.110925 I | etcdserver: published {Name:etcd2 ClientURLs:[http://etcd2:2379]} to cluster 2ac40d9fb4d3cf74
2017-02-15 17:52:27.111309 E | etcdmain: forgot to set Type=notify in systemd service file?
2017-02-15 17:52:27.111372 I | embed: ready to serve client requests
2017-02-15 17:52:27.113647 N | embed: serving insecure client requests on [::]:2379, this is strongly discouraged!
```


## In terminal 2 (etcdctl)

```
# ./etcdctl member list
e2679dd66feadfa: name=etcd2 peerURLs=http://172.28.128.22:2380 clientURLs=http://172.28.128.22:2379 isLeader=false
494ddd76cbf3d43a: name=etcd0 peerURLs=http://172.28.128.20:2380,http://172.28.128.20:7001 clientURLs=http://172.28.128.20:2379,http://172.28.128.20:4001 isLeader=true
dbc1eec63f2df556: name=etcd1 peerURLs=http://172.28.128.21:2380 clientURLs=http://172.28.128.21:2379 isLeader=false
```

```
# ./etcdctl cluster-health
member 1eec2a5c2b8e3129 is healthy: got healthy result from http://etcd0:2379
member 709fe558a49720e3 is healthy: got healthy result from http://etcd1:2379
member 94b7368f02256774 is healthy: got healthy result from http://etcd2:2379
cluster is healthy
```

I shutdown `etcd0` and I check if all work great.

```
# export ETCDCTL_ENDPOINT=http://etcd1:2379
# ./etcdctl cluster-health
failed to check the health of member 1eec2a5c2b8e3129 on http://etcd0:2379: Get http://etcd0:2379/health: dial tcp 172.28.128.20:2379: getsockopt: connection refused
member 1eec2a5c2b8e3129 is unreachable: [http://etcd0:2379] are all unreachable
member 709fe558a49720e3 is healthy: got healthy result from http://etcd1:2379
member 94b7368f02256774 is healthy: got healthy result from http://etcd2:2379
cluster is healthy
root@etcdctl:~#
# ./etcdctl member list
1eec2a5c2b8e3129: name=etcd0 peerURLs=https://etcd0:2380 clientURLs=http://etcd0:2379 isLeader=false
709fe558a49720e3: name=etcd1 peerURLs=https://etcd1:2380 clientURLs=http://etcd1:2379 isLeader=true
94b7368f02256774: name=etcd2 peerURLs=https://etcd2:2380 clientURLs=http://etcd2:2379 isLeader=false
# ./etcdctl get foo/bar
value=hello
```

## Backup data

```
$ vagrant up etcd1
$ sudo su
# cd
# export ETCDCTL_ENDPOINT=http://etcd1:2379
# ./etcdctl backup --data-dir=/etcd_data/ --backup-dir=/backup/
```

Shutdown all `etcd`.


## Restore data

```
$ vagrant up etcd1
# mv /etcd_data/ /etcd_data2/
$ sudo su
# cd
# source config
# ./etcd -data-dir=/backup/ -force-new-cluster
# ./etcd
```
