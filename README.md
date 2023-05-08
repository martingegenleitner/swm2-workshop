# swm2-workshop

Nur ein Demo-Repo für ein paar Tests mit Vagrant und Docker

## How to create the setup

Prerequisites:

* Installed Hypervisor (either VirtualBox, VMware Workstation or Hyper-V)
* Installed Vagrant

```shell
# Spin up the setup
vagrant up

# Enter the two machines either via putty or direct ssh
vagrant putty docker-host
# or
vagrant ssh client

# Reprovision the setup
vagrant provision

# Destroy the setup
vagrant destroy
```

## Use the Docker system to interact with DPOD

Prerequisites:

* Download a new service client package, name it `dpod-service.zip` and place it into the `<REPO>/lab-setup/dpod-ubuntu/service-client` directory
* Download the Gem-Engine files from the Thales support portal and place it into the `<REPO>/lab-setup/dpod-ubuntu/service-client` directory

```shell
# Run the setup interactivly
docker compose run dpod-client

# Remove the setup with all traces
docker compose down --remove-orphans --rmi local
```
