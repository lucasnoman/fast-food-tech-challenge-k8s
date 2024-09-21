# fast-food-tech-challenge-k8s

Repository containing the K8S manifests (yml) used to build the Postgresql database and Node.js backend for the FIAP Fast Food Tech Challenge.

## Getting Started

### With Kubernetes

1. Pull the image.

   - Run in the terminal

     ```bash
     sudo docker pull lucasnoman/fast-food-tech-challenge:v1.3
     ```

2. Create the database and application via K8S.

   - Run in the terminal

     ```bash
     kubectl apply -f /db && kubectl apply -f /app
     ```
