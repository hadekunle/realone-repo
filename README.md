# demo-repository
- Go to kubernetes folder and build the eks-cluster.tf 
- Make sure to include your own keypair
- After build is completed, run the commands below

```bash
aws eks update-kubeconfig --name myAppp-eks-cluster --region us-east-1
kubectl get nodes
kubectl get pods,deploy
```