.PHONY: cfssl ca req clean

CFSSL = /root/cfssl
JSON = /root/cfssljson

all: ca req

cfssl:
	go get -u -tags nopkcs11 github.com/cloudflare/cfssl/cmd/cfssl
	go get -u github.com/cloudflare/cfssl/cmd/cfssljson
	go get -u github.com/mattn/goreman

ca:
	mkdir -p certs
	$(CFSSL) gencert -initca config/ca-csr.json | $(JSON) -bare certs/ca

req:
	$(CFSSL) gencert \
	  -ca certs/ca.pem \
	  -ca-key certs/ca-key.pem \
	  -config config/ca-config.json \
	  config/req-csr.json | $(JSON) -bare certs/etcd0
	$(CFSSL) gencert \
	  -ca certs/ca.pem \
	  -ca-key certs/ca-key.pem \
	  -config config/ca-config.json \
	  config/req-csr.json | $(JSON) -bare certs/etcd1
	$(CFSSL) gencert \
	  -ca certs/ca.pem \
	  -ca-key certs/ca-key.pem \
	  -config config/ca-config.json \
	  config/req-csr.json | $(JSON) -bare certs/etcd2
	$(CFSSL) gencert \
	  -ca certs/ca.pem \
	  -ca-key certs/ca-key.pem \
	  -config config/ca-config.json \
	  config/req-csr.json | $(JSON) -bare certs/etcdctl

clean:
	rm -rf certs

