# Kubernetes Networking & Services

This assignment demonstrates the deployment and verification of different Kubernetes Service types using Minikube. The experiments cover ClusterIP, NodePort, LoadBalancer, ExternalName, and Headless Services.

## 01. ClusterIP

`ClusterIP` is the default Kubernetes Service type. It provides a stable internal IP address and DNS name for communication between applications inside the Kubernetes cluster.

The ClusterIP Service was tested by deploying three NGINX Pods and exposing them through a ClusterIP Service. Internal communication was verified using the Service name and Kubernetes DNS.

The Service was also accessed through port forwarding to verify the NGINX application locally.

### Output

<img width="1625" height="443" alt="image" src="https://github.com/user-attachments/assets/49d0e3cc-5bc7-49f3-adb1-a7b473407a23" />

<img width="1626" height="544" alt="image" src="https://github.com/user-attachments/assets/78a3e25a-b08c-41b1-b15a-c91ee0552569" />

<img width="1633" height="628" alt="image" src="https://github.com/user-attachments/assets/034a8593-0ea6-4566-972c-95256ebff50d" />

---

## 02. NodePort

`NodePort` exposes a Kubernetes Service on a static port on each Node. It allows applications to be accessed from outside the cluster using the Node IP and the assigned NodePort.

The NodePort configuration was deployed and tested using the Minikube cluster.

### Output

<img width="1629" height="472" alt="image" src="https://github.com/user-attachments/assets/27392c78-7fdc-4d7f-9579-d4be191b3cef" />

<img width="1919" height="730" alt="image" src="https://github.com/user-attachments/assets/b64cc84c-7a90-4c57-9daf-0db356c501ea" />

---

## 03. LoadBalancer

`LoadBalancer` exposes a Service externally through a load-balancing endpoint. In a local Minikube environment, the behavior depends on the available Minikube LoadBalancer configuration.

The LoadBalancer Service was deployed and verified using Kubernetes Service commands.

### Output

<img width="1626" height="864" alt="image" src="https://github.com/user-attachments/assets/3050ce7c-d514-4d26-b715-7d1354c22be1" />

<img width="1626" height="232" alt="image" src="https://github.com/user-attachments/assets/ef506b4b-2cd2-458a-82f2-a934137828f2" />

<img width="1331" height="325" alt="image" src="https://github.com/user-attachments/assets/10408f28-6489-4b5e-a047-f7db7b38dbdc" />


---

## 04. ExternalName

`ExternalName` maps a Kubernetes Service to an external DNS name. It allows applications inside the cluster to access an external service through a Kubernetes Service name.

The ExternalName Service was tested using DNS lookup from a Pod. The configured external domain was resolved successfully.

### Output

<img width="1629" height="743" alt="image" src="https://github.com/user-attachments/assets/c563a7bf-a1e1-47ef-a92d-00eb20c940e9" />


---

## 05. Headless

A Headless Service is a Service without a ClusterIP. Instead of routing traffic through a virtual IP, it provides DNS-based discovery of the individual Pods.

The Headless Service was tested using DNS lookup from a client Pod. The DNS query returned the individual Pod IP addresses, and a specific Stateful Pod was accessed using its DNS name.

### Output

<img width="1631" height="736" alt="image" src="https://github.com/user-attachments/assets/77015be6-3c68-4766-96b3-d95d5efa25e7" />

<img width="1615" height="746" alt="image" src="https://github.com/user-attachments/assets/bda4e803-23ea-4502-98d6-cea795f19ec3" />
