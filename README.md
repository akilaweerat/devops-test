
## 🚀 DevOps Challenge: Productionize an Application - Solution


### Optimizations

Updated dockerfile to use official python image and removed unnecessary dependencies

#### k8s manifest changes
Fix syntax errors in k8s manifest files (values -> value)
changed incorrect port in healthcheck
fixed image name
fixed deployment strategy to rollingupdate
fix resource allocations

### Setting Up

Create a docker image out of the application. This will create the docker image booli-targets:1.0

Note - docker daemon should be running

```
chmod +x build.sh
./build.sh
```

Then we should load the image to the k8s cluster image repo. For minikube use

```
minikube image load booli-targets:1.0
```

We can now deploy helm charts to the k8s cluster

```
cd helm-charts
helm install booli-targets .
```

---

### Your Mission

Your task is to take this basic app and make it **production-ready** for deployment into a Kubernetes cluster.

### Key Requirements

* **Helm Chart:** Both parts of the application must be packaged and installable using a **Helm chart**.
* **Kubernetes Deployment:** The application must be configured to start and run successfully within the k8s cluster.
* **Network Accessibility:** The app must be accessible at the domain `https://target.example.com`.
    * **Note:** We know this domain won't actually resolve. However, your cluster configuration (e.g., an Ingress resource) must be set up correctly *as if* it would.

---

### CI/CD Pipeline Update

The repository also contains a CI/CD tool. You must **update the CI/CD pipeline** with the necessary steps to support this new deployment.

* **Goal:** The pipeline steps themselves do not need to be fully functional. The objective is to demonstrate a basic understanding of how to **structure and set up the pipeline** for this kind of deployment.



### How to make the Test


- Download ore fork this repo
- Update and make your changes
- Submit back by zipping the folder and send to contact point


### You will need 

- Docker
- Helm
- k8s cluster (minikube will work)