# Kubernetes Architecture Guide

A practical guide to understanding the main components that make up a Kubernetes cluster, including the control plane, worker nodes, and container runtime.

## Introduction

Kubernetes is an open-source platform used to manage containerized applications. When Kubernetes is deployed, it forms a cluster.

A Kubernetes cluster is mainly divided into two parts:

* **Control Plane** – Manages the cluster and makes decisions about where and how workloads should run.
* **Worker Nodes** – Run the application workloads inside Pods.

Every Kubernetes cluster requires at least one worker node to run Pods.

---

## Kubernetes Cluster Overview

The overall architecture can be represented as:

```text
                    Kubernetes Cluster
                           │
             ┌─────────────┴─────────────┐
             │                           │
       Control Plane                 Worker Node
             │                           │
     ┌───────────────┐             ┌─────┴─────────┐
     │       │       │             │       │       │
 API Server  etcd  Scheduler     kubelet kube-proxy Runtime
     │
 Controller Manager
     │
 Cloud Controller Manager
                           │
                          Pods
```

The control plane manages the state of the cluster, while worker nodes provide the environment in which application Pods execute.

---

## Control Plane

The control plane is responsible for managing the Kubernetes cluster. It makes cluster-wide decisions, schedules Pods, and responds when the actual state of the cluster differs from the desired state.

### 1. `kube-apiserver`

The `kube-apiserver` is the main entry point to the Kubernetes control plane.

#### Responsibilities

* Exposes the Kubernetes API.
* Receives and validates API requests.
* Provides the interface through which Kubernetes components communicate.
* Handles operations involving resources such as Pods and Services.
* Can be scaled horizontally by running multiple instances.

#### In simple terms

> `kube-apiserver` = Communication gateway of Kubernetes

---

### 2. `etcd`

`etcd` is the key-value datastore used to store Kubernetes cluster information.

#### Responsibilities

* Stores cluster configuration and state.
* Keeps information required by the Kubernetes control plane.
* Acts as the backing store for Kubernetes cluster data.

Because important cluster state is stored in `etcd`, maintaining backups is important.

#### In simple terms

> `etcd` = Database / source of cluster state

---

### 3. `kube-scheduler`

The `kube-scheduler` is responsible for deciding which worker node should run a newly created Pod.

It watches for Pods that do not yet have a node assigned.

#### Scheduling considerations

The scheduler can consider:

* CPU and memory requirements
* Hardware and software constraints
* Policy constraints
* Affinity and anti-affinity
* Data locality
* Workload interference
* Deadlines

#### In simple terms

> `kube-scheduler` = Decides where a Pod should run

---

### 4. `kube-controller-manager`

The `kube-controller-manager` runs Kubernetes controller processes.

Controllers continuously observe the cluster and help move it toward the desired state.

#### Important Controllers

| Controller                | Responsibility                                                  |
| ------------------------- | --------------------------------------------------------------- |
| Node Controller           | Detects and responds to node failures                           |
| Job Controller            | Manages Jobs and creates Pods for one-time tasks                |
| EndpointSlice Controller  | Maintains EndpointSlice objects for Service-to-Pod connectivity |
| ServiceAccount Controller | Creates default ServiceAccounts for new namespaces              |

#### In simple terms

> Controller Manager = Keeps the cluster in the desired state

---

### 5. `cloud-controller-manager`

The `cloud-controller-manager` contains cloud-provider-specific logic.

It allows Kubernetes to interact with APIs provided by cloud platforms while keeping cloud-specific functionality separate from the core Kubernetes components.

#### Examples

It can provide controllers related to:

* Nodes
* Network routes
* Cloud load balancers

For local or on-premises learning environments, a cloud controller manager is generally not required.

#### In simple terms

> `cloud-controller-manager` = Connects Kubernetes with cloud infrastructure

---

## Worker Node Components

Worker nodes are the machines where Kubernetes workloads actually run.

Each node provides the environment required to execute Pods and their containers.

### 1. `kubelet`

The `kubelet` is an agent that runs on each Kubernetes node.

Its primary responsibility is to make sure that the containers described by Pod specifications are running and healthy.

#### Responsibilities

* Receives Pod specifications.
* Ensures required containers are running.
* Monitors container health.
* Maintains the desired state of Pods on the node.

The kubelet does not manage containers that were not created by Kubernetes.

#### In simple terms

> `kubelet` = Makes sure Pods are running correctly

---

### 2. `kube-proxy`

`kube-proxy` is a network component that runs on nodes and implements part of the Kubernetes Service functionality.

#### Responsibilities

* Maintains network rules on nodes.
* Helps route network traffic to Pods.
* Enables communication with Pods from inside or outside the cluster.
* Uses the operating system's packet-filtering capabilities when available.

#### In simple terms

> `kube-proxy` = Helps route Service traffic to Pods

---

### 3. Container Runtime

The container runtime is responsible for actually running containers.

Kubernetes communicates with the container runtime through the Container Runtime Interface (CRI).

#### Examples

* `containerd`
* `CRI-O`
* Other CRI-compatible runtimes

The runtime handles the execution and lifecycle of containers.

#### In simple terms

> Container Runtime = Runs the containers

---

## How the Components Work Together

A simplified request flow looks like this:

```text
User / kubectl
      │
      ▼
kube-apiserver
      │
      ├──────────► etcd
      │
      ▼
kube-scheduler
      │
      ▼
Worker Node
      │
      ├── kubelet
      │
      ├── kube-proxy
      │
      └── Container Runtime
                 │
                 ▼
                Pod
```

### Example

Suppose a user creates a Deployment containing three replicas.

1. The request reaches the `kube-apiserver`.
2. Cluster information is stored in `etcd`.
3. The controller manager ensures the requested replicas exist.
4. The scheduler selects suitable worker nodes.
5. The kubelet on those nodes ensures the Pods are running.
6. The container runtime starts the containers.
7. `kube-proxy` helps provide the required Service networking.

---

## Component Comparison

| Component                  | Runs On       | Main Purpose               |
| -------------------------- | ------------- | -------------------------- |
| `kube-apiserver`           | Control Plane | Kubernetes API             |
| `etcd`                     | Control Plane | Stores cluster state       |
| `kube-scheduler`           | Control Plane | Assigns Pods to nodes      |
| `kube-controller-manager`  | Control Plane | Maintains desired state    |
| `cloud-controller-manager` | Control Plane | Cloud-specific integration |
| `kubelet`                  | Worker Node   | Manages Pods on a node     |
| `kube-proxy`               | Worker Node   | Service networking         |
| Container Runtime          | Worker Node   | Runs containers            |

---

## Key Takeaways

* Kubernetes is organized as a cluster.
* The control plane manages the cluster.
* Worker nodes run application Pods.
* `kube-apiserver` is the main API entry point.
* `etcd` stores cluster state.
* `kube-scheduler` decides where Pods should run.
* `kube-controller-manager` maintains the desired cluster state.
* `kubelet` manages Pods on individual nodes.
* `kube-proxy` handles part of Kubernetes Service networking.
* The container runtime executes containers.
* Cloud-specific functionality can be provided through `cloud-controller-manager`.

---

## Reference

The concepts in this guide are based on the provided Kubernetes architecture material and the official Kubernetes documentation.

### Official Kubernetes Documentation

https://kubernetes.io/docs/concepts/architecture/
