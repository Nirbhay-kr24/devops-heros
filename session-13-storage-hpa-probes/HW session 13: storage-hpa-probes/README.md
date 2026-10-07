# Kubernetes Storage-HPA-Probes

This session covers Kubernetes storage, persistent storage, Horizontal Pod Autoscaling (HPA), and container health probes.


# 1. Kubernetes Volumes

## Volume

A Kubernetes Volume provides storage that can be mounted inside a container.

Volumes are useful when containers need to store or share data during their lifetime.


## Volume: emptyDir

`emptyDir` provides temporary storage to containers in a Pod.

The volume is created when the Pod starts and is deleted when the Pod is deleted.

### Key Points

- Storage is created when the Pod starts.
- It can be shared between containers in the same Pod.
- Data remains available while the Pod exists.
- Data is deleted when the Pod is deleted.
- Useful for temporary files, cache, and intermediate data.

### Example

<img width="1422" height="820" alt="Screenshot 2026-10-07 203059" src="https://github.com/user-attachments/assets/b53cdc83-90cb-4036-9976-80c2c4032fa7" />


## Volume hostPath

`hostPath` mounts a directory or file from the Kubernetes node into the Pod.

The data is stored on the node rather than only inside the Pod.

Key Points
- Uses storage from the Kubernetes node.
- Data can remain after the Pod is deleted.
- The storage is tied to the particular node.
- Useful for testing, node-level data, and special workloads.
- It should be used carefully in production environments.

<img width="895" height="713" alt="Screenshot 2026-10-07 204042" src="https://github.com/user-attachments/assets/a19f61c7-3db4-4051-9b3a-32a12f73857a" />


## Persistent Storage

## Persistent Volume

A PersistentVolume (PV) is a storage resource available in the Kubernetes cluster.

Unlike temporary Pod storage, a PV can exist independently of a Pod.

Key Points
- Represents persistent storage in the cluster.
- Can be used by Pods through a PVC.
- Can be created manually or dynamically.
- Can survive Pod deletion.
- Defines storage capacity and access modes.

Persistent Volume on Given Path
A PV can use a specific path on the Kubernetes node for storage.

<img width="1001" height="886" alt="Screenshot 2026-10-07 204652" src="https://github.com/user-attachments/assets/e3007ce0-e72d-4ac5-9b3d-df75718ed63b" />

### PersistentVolumeClaim (PVC)
A PersistentVolumeClaim (PVC) is a request for storage made by a user or application.
The PVC requests storage from Kubernetes and can be bound to a suitable PersistentVolume.

Key Points
- Requests a specific amount of storage.
- Specifies access modes.
- Connects a Pod to persistent storage.
- Kubernetes binds the PVC to a suitable PV.


## Persistent Volume on Custom Path

A PV can also be mounted at a custom path inside the container.

<img width="1574" height="733" alt="image" src="https://github.com/user-attachments/assets/de5eb75a-11a3-4891-8e22-590fd61a03c2" />

<img width="1575" height="438" alt="image" src="https://github.com/user-attachments/assets/aa5ad02a-f111-488a-9bdf-e5c1a7e6f0f4" />


# 2. Horizontal Pod Autoscaler (HPA)

Horizontal Pod Autoscaler (HPA) automatically increases or decreases the number of Pod replicas based on resource usage.
For example, HPA can use CPU utilization to decide when more Pods are required.

Important HPA Fields
- scaleTargetRef — identifies the Deployment to scale.
- minReplicas — minimum number of Pods.
- maxReplicas — maximum number of Pods.
- metrics — defines the resource used for scaling.

<img width="1570" height="826" alt="image" src="https://github.com/user-attachments/assets/c88f6149-587f-42cb-9149-8280f6e408f2" />

<img width="1038" height="376" alt="image" src="https://github.com/user-attachments/assets/e4cdb53a-cbb8-40a0-9029-b416e6acb9f0" />

---

# 3. Mini Project
The mini project also uses HPA to automatically adjust the number of application Pods according to resource usage.

## Deployment

A Deployment manages and maintains the required number of application Pods.

<img width="1497" height="493" alt="image" src="https://github.com/user-attachments/assets/a55d2e18-b920-4d2f-a4a9-0fcd642d579e" />


## Storage Verification

Verifies that the application's persistent storage is working correctly.
<img width="1564" height="320" alt="image" src="https://github.com/user-attachments/assets/fa5962cd-4929-439f-b09d-3a0c3732834f" />


## Service Verification

Verifies that the Kubernetes Service is correctly exposing the application.


<img width="1550" height="141" alt="image" src="https://github.com/user-attachments/assets/beae5666-aa31-4ff3-bf18-34dc57eca3ae" />

<img width="1459" height="572" alt="image" src="https://github.com/user-attachments/assets/2d38d476-db86-4ec2-a415-69dd60973d55" />

