**The connection to the server localhost:8080 was refused:**



. Check if the kubeconfig environment variable is exported if not exported

export KUBECONFIG=/etc/kubernetes/admin.conf or $HOME/.kube/config

2. Check your **.kube** or **config** in the home directory file. If you did not found it, then you need to move that to the home directory. using the following command

cp /etc/kubernetes/admin.conf $HOME/

chown $(id -u):$(id -g) $HOME/admin.conf

export KUBECONFIG=$HOME/admin.conf



swapoff -a

systemctl enable kubelet

systemctl start kubelet



Whenever you are starting Master Node you may require to set the environment variable. Hence it’s a repetitive task for you. It can be set permanently using the following command.

echo 'export KUBECONFIG=$HOME/admin.conf' >> $HOME/.bashrc

You can also check a discussion thread on Kubernetes form [**_here_**](https://discuss.kubernetes.io/t/the-connection-to-the-server-localhost-8080-was-refused-did-you-specify-the-right-host-or-port/1464)
