# Kubernetes in Virtual Machines

This repository provides a set of files that allows the deployment of a kubernetes cluster formed by VirtualBox vms.
The information used to create these files was retrieved from [here](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/).

## Software requirements

* VirtualBox - 6.0.14r133895
* Ansible - 2.9.1
* Python - 3.7.5

The operating system was MacOS Mojave - 10.14.6.

## Steps for k8s deployment 

* Retrieve git repository `git clone https://github.com/josanabr/ansible-k8s`
* Visit directory `cd ansible-k8s`
* Execute `vagrant up`

## Test the deployment

* Go to `k8s-master` via ssh. `vagrant ssh k8s-master`
* Check if nodes are up and running `kubectl get nodes`
