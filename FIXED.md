# Issues found in original blog

This [blog post](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/) shows how to deploy kubernetes on a multi-node cluster. 
However it has some problems that can not allow its correct reproducibility.

As follows it is presented how to fix those issues.

## Issue 1

In `kubernetes-setup/master-playbook.yml` change line 

```
    command: kubectl create -f https://docs.projectcalico.org/v3.4/getting-started/kubernetes/installation/hosted/calico.yaml
```

for this line:

```
    command: kubectl create -f https://docs.projectcalico.org/v3.8/getting-started/kubernetes/installation/hosted/calico.yaml
```

## Issue 2

In `kubernetes-setup/master-playbook.yml`, look for:

```
  - name: Copy join command to local file
    local_action: copy content="{{ join_command.stdout_lines[0] }}" dest="./join-command"
```

and change it for:

```
  - name: Copy join command to local file
    become: false
    local_action: copy content="{{ join_command.stdout_lines[0] }}" dest="./join-command"
```

## Issue 3

In `kubernetes-setup/master-playbook.yml`, look for:

```
  - name: Configure node ip
    lineinfile:
      path: /etc/default/kubelet
      line: KUBELET_EXTRA_ARGS=--node-ip={{ node_ip }
```
  
and change it for:

```
  - name: Configure node ip
    lineinfile:
      create: yes
      path: /etc/default/kubelet
      line: KUBELET_EXTRA_ARGS=--node-ip={{ node_ip }
```
