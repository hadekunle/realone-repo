# demo-repository
- Go to kubernetes folder and build the eks-cluster.tf 
- Make sure to include your own keypair
- After build is completed, run the commands below

```bash
aws eks update-kubeconfig --name myAppp-eks-cluster --region us-east-1
kubectl get nodes
kubectl get pods,deploy
```


## Additional setups required
- terraform apply sonarqube.tf
- Install sonarqube plugin in Jenkins
- Sonarqube default login, `{username:admin , password:admin}`
- Add webhook to sonarqube in the format `https://<jenkins_server_url>/sonarqube-webhook/`
- restart docker after usermod `sudo systemctl ...command`

