# k8s-playground-bootstrapper

This repo enables Proxmox users to create a kubernetes clusters on the fly. It already assumes that:

1. Whoever is gonna use it will have templates provisioned upfront and available on the target cluster to be cloned at anytime. Terraform is gonna do that by using Telmate's Proxmox Terraform provider;
2. Whoever is gonna use it will have at their disposal a self-hosted Gitlab instance with pre-configured runners that can SSH into the Kubernetes nodes created by Terraform; Ansible on the other hand, requires successfull SSH connections, so that playbooks can be executed on both master and worker nodes.
3. Whoever is gonna use it will need to adapt their Terraform backend to a regular S3 setup if they're not using MinIO. In this setup, MinIO mimics a S3 bucket by storing tf states, same thing
any cloud-based object store would naturally do. I did that to save a little bit on my cloud billing. 😁


In summary, what does this repo do?

- Terraforms master and worker nodes using Telmate's Proxmox Terraform provider; note that I'm running Terraform from a custom image with this provider already installed
so feel free to use it if you want. (renatofenrir/terraform:v4)
- Uses MinIO as Terraform backend. That's optional, use S3 instead if needed.
- Configures master and worker dependencies with ansible;
- Bootstraps Kubernetes with Rancher RKE (which is their Kubernetes distro that streamlines much of the cluster provisioning heavy lifting)
- Installs Flux on top, if you wanna GitOps around (that's also optional, on the 'run-ansible' gitlab job, just comment out 
the equivalent ansible-playbook commands if you don't need it);
- And of course, it streamlines the whole process via a Gitlab pipeline.

P.S: Please, feel free to PR with a Github Action config, I would be more than happy to pair up and review it.


If you encounter issues, don't hesitate to reach out or even PR straight away if you want to.


Happy provisioning!