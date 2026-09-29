[master]
k3s-master ansible_host=${master_ip}

[workers]
k3s-worker-1 ansible_host=${worker_1_ip}
k3s-worker-2 ansible_host=${worker_2_ip}

[k8s_cluster:children]
master
workers