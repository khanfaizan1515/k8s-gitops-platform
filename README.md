# Capstone Project 5 — Kubernetes GitOps Platform

## 📌 Project Overview

This project implements a GitOps-based Kubernetes deployment platform on **AWS EKS**.

The platform uses **Terraform** to provision AWS infrastructure, **Docker** to containerize microservices, **Amazon ECR** to store container images, **Kubernetes** to run the applications, **Helm** to package and manage Kubernetes deployments, **HPA** for automatic scaling, and **Argo CD** to implement GitOps-based continuous deployment from GitHub.

The project contains three microservices:

* User Service
* Product Service
* Order Service

---

## 🏗️ Architecture

```text
                        GitHub
                          |
             +------------+------------+
             |                         |
      Application Code            GitOps Manifests
                                       |
                                       v
                                    Argo CD
                                       |
                                       v
                              AWS EKS Cluster
                                       |
                    +------------------+------------------+
                    |                  |                  |
                  Node 1             Node 2             Node 3
                    |                  |                  |
                    +------------------+------------------+
                                       |
                  +--------------------+--------------------+
                  |                    |                    |
             User Service        Product Service       Order Service
                  |                    |                    |
                 HPA                  HPA                  HPA
```

---

## 🚀 Technologies Used

| Technology | Purpose                           |
| ---------- | --------------------------------- |
| AWS EKS    | Managed Kubernetes cluster        |
| AWS EC2    | Kubernetes worker nodes           |
| Amazon ECR | Container image registry          |
| Terraform  | Infrastructure as Code            |
| Docker     | Containerization                  |
| Kubernetes | Container orchestration           |
| Helm       | Kubernetes application packaging  |
| HPA        | Horizontal Pod Autoscaling        |
| Argo CD    | GitOps continuous deployment      |
| GitHub     | Source code and GitOps repository |
| Linux      | Development and administration    |

---

# 📁 Project Structure

```text
k8s-gitops-platform/
│
├── services/
│   ├── user-service/
│   ├── product-service/
│   └── order-service/
│
├── helm/
│   ├── user-service/
│   ├── product-service/
│   └── order-service/
│
├── gitops/
│   ├── user-service.yaml
│   ├── product-service.yaml
│   └── order-service.yaml
│
└── terraform/
    ├── main.tf
    ├── variables.tf
    ├── terraform.tfvars
    └── ...
```

---

# ☁️ AWS Infrastructure

The Kubernetes platform is deployed on Amazon EKS.

### AWS Region

```text
ap-south-1
```

### EKS Cluster

```text
capstone-platform
```

### Kubernetes Version

```text
1.36
```

### Worker Node Instance Type

```text
t3.small
```

### Worker Nodes

The final EKS cluster contains three healthy worker nodes.

```text
Node 1    Ready
Node 2    Ready
Node 3    Ready
```

---

# 🏗️ Infrastructure with Terraform

Terraform is used to provision and manage the AWS infrastructure.

The Terraform configuration manages resources including:

* EKS cluster
* EKS managed node group
* IAM roles and policies
* Security groups
* KMS encryption
* EKS add-ons
* OIDC provider
* Cluster access configuration

### Terraform Validation

The configuration was validated successfully:

```text
Success! The configuration is valid.
```

### Final Terraform Plan

The final infrastructure verification returned:

```text
No changes. Your infrastructure matches the configuration.
```

This confirms that the deployed AWS infrastructure matches the Terraform configuration.

---

# 🐳 Docker and Amazon ECR

The three microservices are containerized using Docker.

Docker images were pushed to Amazon ECR.

### ECR Repositories

```text
user-service
product-service
order-service
```

### Image Tag

```text
1.0
```

Example ECR image:

```text
977232999886.dkr.ecr.ap-south-1.amazonaws.com/user-service:1.0
```

---

# ☸️ Kubernetes

Kubernetes is used to deploy and manage the microservices inside the EKS cluster.

The three applications deployed are:

```text
user-service
product-service
order-service
```

Each application has its own:

* Deployment
* Service
* Resource configuration
* HPA configuration

---

# ⎈ Helm

Helm is used to package and deploy the Kubernetes applications.

Helm charts are located under:

```text
helm/
```

Structure:

```text
helm/
├── user-service/
├── product-service/
└── order-service/
```

Helm allows application configuration such as:

* Container image
* Image tag
* Replica count
* Service configuration
* CPU and memory resources
* Autoscaling settings

to be managed through chart values.

---

# 📈 Horizontal Pod Autoscaling

Horizontal Pod Autoscaling (HPA) is configured for all three services.

The HPA uses CPU utilization to automatically increase or decrease the number of application replicas.

### User Service

```text
Minimum replicas: 3
Maximum replicas: 8
CPU target: 70%
```

### Product Service

```text
Minimum replicas: 2
Maximum replicas: 8
CPU target: 70%
```

### Order Service

```text
Minimum replicas: 2
Maximum replicas: 8
CPU target: 70%
```

### Final HPA Verification

```text
NAME                  REFERENCE                    TARGETS       MINPODS   MAXPODS   REPLICAS

order-service-hpa     Deployment/order-service     cpu: 1%/70%   2         8         2
product-service-hpa   Deployment/product-service   cpu: 1%/70%   2         8         2
user-service-hpa      Deployment/user-service      cpu: 1%/70%   3         8         3
```

---

# 🔄 GitOps with Argo CD

Argo CD is used to implement the GitOps deployment workflow.

The Kubernetes application configuration is stored in GitHub.

Argo CD monitors the Git repository and synchronizes the desired configuration with the Kubernetes cluster.

### GitOps Applications

```text
user-service
product-service
order-service
```

### Repository

```text
https://github.com/khanfaizan1515/k8s-gitops-platform
```

### Branch

```text
main
```

### Final Argo CD Status

All three applications were successfully synchronized.

```text
NAME              SYNC STATUS   HEALTH STATUS

order-service     Synced        Healthy
product-service   Synced        Healthy
user-service      Synced        Healthy
```

---

# 🔁 GitOps Workflow

The deployment workflow is:

```text
Developer
    |
    v
GitHub
    |
    v
GitOps Manifest
    |
    v
Argo CD
    |
    v
Kubernetes / EKS
    |
    v
Application Pods
```

When Kubernetes configuration is managed through Git, Git becomes the source of truth for the desired application state.

Argo CD continuously monitors the repository and keeps the Kubernetes environment synchronized with the configuration stored in Git.

---

# 🧪 Final Verification

## EKS Nodes

Final cluster verification showed three healthy nodes:

```text
ip-172-31-3-21.ap-south-1.compute.internal    Ready
ip-172-31-36-76.ap-south-1.compute.internal   Ready
ip-172-31-46-60.ap-south-1.compute.internal   Ready
```

---

## Application Deployments

```text
NAME              READY   UP-TO-DATE   AVAILABLE

order-service     2/2     2            2
product-service   2/2     2            2
user-service      3/3     3            3
```

All application replicas were running successfully.

---

## Argo CD

```text
order-service      Synced     Healthy
product-service    Synced     Healthy
user-service       Synced     Healthy
```

---

## Terraform

```text
No changes. Your infrastructure matches the configuration.
```

---

# 🛠️ Useful Verification Commands

### Check EKS nodes

```bash
kubectl get nodes
```

### Check all pods

```bash
kubectl get pods -A -o wide
```

### Check deployments

```bash
kubectl get deployment
```

### Check services

```bash
kubectl get svc
```

### Check HPA

```bash
kubectl get hpa
```

### Check Argo CD applications

```bash
kubectl get applications -n argocd
```

### Check EKS node groups

```bash
aws eks list-nodegroups \
  --cluster-name capstone-platform \
  --region ap-south-1
```

### Validate Terraform

```bash
terraform validate
```

### Check Terraform changes

```bash
terraform plan
```

---

# 🔐 Infrastructure Cleanup and Recovery

During the project, an unhealthy EKS managed node group was identified.

The affected node was safely:

1. Cordoned
2. Drained
3. Workloads were rescheduled onto healthy nodes
4. The failed node group was removed

After cleanup, the cluster contained three healthy worker nodes and all workloads were running successfully.

Final verification confirmed that only the healthy EKS node group remained.

---

# 📊 Final Project Status

| Component        | Status       |
| ---------------- | ------------ |
| Terraform        | ✅ Completed  |
| AWS EKS          | ✅ Completed  |
| EKS Worker Nodes | ✅ 3 Ready    |
| Docker           | ✅ Completed  |
| Amazon ECR       | ✅ Completed  |
| Kubernetes       | ✅ Completed  |
| Helm             | ✅ Completed  |
| HPA              | ✅ Completed  |
| Argo CD          | ✅ Completed  |
| GitOps           | ✅ Completed  |
| User Service     | ✅ Healthy    |
| Product Service  | ✅ Healthy    |
| Order Service    | ✅ Healthy    |
| Terraform Plan   | ✅ No Changes |

---

# 🎯 Conclusion

The Capstone Project successfully demonstrates an end-to-end Kubernetes GitOps platform on AWS.

Terraform is used to provision the AWS infrastructure, Docker is used to containerize the applications, Amazon ECR stores the images, Kubernetes runs the microservices, Helm manages the Kubernetes application configuration, HPA provides automatic scaling, and Argo CD implements GitOps-based continuous deployment from GitHub.

The final environment was successfully verified with:

* Three healthy EKS worker nodes
* All three microservices running
* Successful HPA configuration
* All Argo CD applications synchronized and healthy
* Terraform reporting no infrastructure changes

The project demonstrates practical implementation of modern DevOps and GitOps practices using AWS, Terraform, Docker, Kubernetes, Helm, HPA, GitHub, and Argo CD.
