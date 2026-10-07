# Kubernetes Workloads Assignment

This assignment demonstrates the deployment and practical verification of core Kubernetes workload controllers using Minikube. The experiments cover ReplicaSets, Deployments, DaemonSets, and StatefulSets.

## 1. ReplicaSet

**What is a ReplicaSet?**  
A ReplicaSet ensures that a specified number of identical Pods are running in the cluster. If a Pod is deleted or becomes unavailable, the ReplicaSet automatically creates a replacement to maintain the desired number of replicas.

### Execution

The ReplicaSet was deployed using:

```bash
kubectl apply -f replicaset/backend-rs.yaml
```
The ReplicaSet and its Pods were verified using:
```
kubectl get rs
kubectl get pods
```
Three Pods were successfully created. One Pod was manually deleted to verify the self-healing behavior, after which Kubernetes automatically created a replacement Pod.

Output

<img width="1624" height="112" alt="image" src="https://github.com/user-attachments/assets/e629643f-d53b-4113-85e2-9a5f6111043a" />

<img width="1619" height="107" alt="image" src="https://github.com/user-attachments/assets/61fb25a2-3eb8-48f5-8fce-55e341559490" />

<img width="1621" height="202" alt="image" src="https://github.com/user-attachments/assets/5bffe0b8-9e36-4816-a361-a4704a19cc63" />



## 2. Deployment

### What is a Deployment?
A Deployment provides declarative management of Pods and ReplicaSets. It allows applications to be updated in a controlled manner and supports rolling updates.

### Execution
The initial Deployment was deployed using:
```bash
kubectl apply -f deployment/deployment-v1.yaml

```

The Deployment, ReplicaSet, and Pods were verified using:

```bash
kubectl get deployment,rs,pods

```

The rollout was verified using:

```bash
kubectl rollout status deployment/yatri-backend

```

The Deployment was then updated to version 2.0.0 using:

```bash
kubectl apply -f deployment/deployment-v2.yaml

```

The updated rollout was verified using:

```bash
kubectl rollout status deployment/yatri-backend

```

The running Pod versions were checked using:

```bash
kubectl get pods -l app=yatri-backend -L version

```

All three running Pods showed version 2.0.0. The old ReplicaSet was scaled down to zero replicas while the new ReplicaSet maintained three running Pods.

### Output

<img width="1669" height="485" alt="image" src="https://github.com/user-attachments/assets/76b5b750-96ee-4f4e-b975-8997470a0236" />

<img width="1678" height="338" alt="image" src="https://github.com/user-attachments/assets/856d8dff-08fb-41ee-aa36-621c0fe04162" />



## 3. DaemonSet

### What is a DaemonSet?
A DaemonSet ensures that a copy of a specific Pod runs on each eligible Node in the Kubernetes cluster. It is useful for workloads that need to operate at the Node level.

### Where is it used?
* Log collection agents
* Monitoring agents
* Node-level system services
* Storage-related services

### Execution
The DaemonSet was deployed using:
```bash
kubectl apply -f daemonset/node-agent-ds.yaml

```

The DaemonSet was verified using:

```bash
kubectl get daemonset

```

The running Pods were inspected using:

```bash
kubectl get pods -o wide

```

The Minikube cluster contained one Node, so one DaemonSet Pod was created on the minikube Node.

The Pod logs were checked using:

```bash
kubectl logs <pod-name>

```

The logging agent successfully generated continuous messages while running.

### Output

<img width="1685" height="431" alt="image" src="https://github.com/user-attachments/assets/f838b58f-b2ba-47b5-9e2c-319369b653aa" />


## 4. StatefulSet

### What is a StatefulSet?
A StatefulSet manages Pods that require stable identities and persistent storage. Each Pod receives a predictable name such as mysql-0, mysql-1, and mysql-2.

### Where is it used?
* Databases
* Distributed storage systems
* Message brokers
* Other stateful applications

### Execution
The MySQL StatefulSet was deployed using:
```bash
kubectl apply -f k8s-core-objects/statefulset.yml

```

The StatefulSet was verified using:

```bash
kubectl get statefulset

```

The Pods were checked using:

```bash
kubectl get pods

```

Three Pods were successfully created with stable names:

* mysql-0
* mysql-1
* mysql-2

Persistent storage was verified using:

```bash
kubectl get pvc

```

Three PersistentVolumeClaims were created and reached the Bound state, with each PVC providing 5Gi of storage.

To verify stable Pod identity, mysql-1 was deleted:

```bash
kubectl delete pod mysql-1

```

Kubernetes recreated the Pod using the same name, mysql-1.

### Output
<img width="1689" height="546" alt="image" src="https://github.com/user-attachments/assets/cd5ba7d5-6d12-475d-a683-448de6961966" />
