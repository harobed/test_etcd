#/bin/bash

mkdir -p src/etcd0/certs
mkdir -p src/etcd1/certs
mkdir -p src/etcd2/certs

cp src/etcd0/tls-setup/certs/ca* src/etcd0/certs/
cp src/etcd0/tls-setup/certs/etcd0* src/etcd0/certs/

cp src/etcd0/tls-setup/certs/ca* src/etcd1/certs/
cp src/etcd0/tls-setup/certs/etcd1* src/etcd1/certs/

cp src/etcd0/tls-setup/certs/ca* src/etcd2/certs/
cp src/etcd0/tls-setup/certs/etcd2* src/etcd2/certs/
