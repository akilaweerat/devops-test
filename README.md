
## 🚀 DevOps Challenge: Productionize an Application - Solution


### Optimizations

Updated dockerfile to use official python image and removed unnecessary dependencies

#### k8s manifest changes
- Fixed syntax errors in Kubernetes manifest files (changed `values` to `value`)
- Updated healthcheck to use the correct port
- Corrected image name in deployment
- Set deployment strategy to RollingUpdate
- Adjusted resource allocations for containers
- Added a MySQL sidecar to seed the database
- Created a secret to store MySQL credentials; secrets can be overridden in production using `--set` with Helm

### Setting Up

Create a docker image out of the application. This will create the docker image booli-targets:1.0
-
Note - docker daemon should be running

```
docker build -t booli-targets:1.0 .
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

### CI/CD strategy

For branches and merge requests we only run build, unit tests and linting tasks to code builds properly

For master branch additional steps are added to build the docker image, scan the docker image and code
for security flaws (via sonarqube and trivy). Helm chart is also built and packaged and master branch
can be deployed to QA environment

only tags can be deployed to stage and production and they can only be manually triggered