# DPoD on Ubuntu

This setup helps to access a DPOD-partition via the tools supplied with a DPOD service client.

## Prepare

To be able to build the solution, you must first place the service client package into the `service-client` directory with the name `dpod-service.zip`.

## Build, Run and Use

Use the provided docker compose file to easily build and run a shell in the container.

```shell
# Go into the path of this directory
cd <path/to/this/project/directory>
# Start the docker compose setup
docker compose run dpod-client
# You are now entering a bash on the ubuntu image within the directory of the DPOD service client
# Happy Hacking on DPOD!
```

## Useful commands with gem engine

```shell
# Generate a new private key and store its reference in a file
openssl genrsa -engine gem 4096 > /root/private.key
# Create a selfsigned certificate with the reference file of the private key
openssl req -engine gem -x509 -key /root/private.key -out /root/cert.pem -sha256 -days 365 -subj "/C=AT/CN=TestSigner"
# Create a selfsigned certificate with the HSM object's label
openssl req -engine gem -x509 -key <PRIVATE_KEY_HSM_LABEL> -keyform engine -out /root/cert.pem -sha256 -days 365 -subj "/C=AT/CN=TestSigner"
```

## How to create Brainpool keys

```shell
openssl ecparam -list_curves
openssl ecparam -out brainpoolP256r1_ecparam.pem -name brainpoolP256r1
sautil -v -s 3 -i 0:0 -m OID_:brainpoolP256r1_ecparam.pem -f brainpoolP256r1.key.pem -l brainpoolP256r1 -o -q -c

openssl ecparam -out brainpoolP384r1_ecparam.pem -name brainpoolP384r1
sautil -v -s 3 -i 0:0 -m OID_:brainpoolP384r1_ecparam.pem -f brainpoolP384r1.key.pem -l brainpoolP384r1 -o -q -c
```
