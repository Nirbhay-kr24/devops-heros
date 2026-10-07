# Kubernetes Ingress Assignment

This assignment introduces Kubernetes Ingress and explains how external HTTP/HTTPS traffic can be routed to services running inside a Kubernetes cluster.

## 1. Difference between Ingress and Ingress Controller

- **Ingress**: A Kubernetes API object that defines rules for routing external HTTP and HTTPS traffic to internal cluster services. It acts as a configuration or blueprint for traffic routing.

- **Ingress Controller**: The actual software application, such as NGINX, HAProxy, or Traefik, that runs inside the cluster, reads the Ingress rules, and performs the traffic routing. Without an Ingress Controller, an Ingress resource does not perform the routing itself.

 **Simple analogy**

Think of a building:

Ingress = rules/instructions saying which visitor should go to which room. 

Ingress Controller = receptionist/security guard who actually receives visitors and sends them to the correct room.



## 2. Difference between Path-based and Host-based Routing

- **Host-based Routing**: Directs incoming traffic to different services based on the domain name or hostname specified in the HTTP request.

  - Example: `api.example.com` routes to Service A, while `shop.example.com` routes to Service B.

- **Path-based Routing**: Directs incoming traffic to different services based on the URL path under a single domain.

  - Example: `example.com/api` routes to Service A, while `example.com/shop` routes to Service B.

---

## 3. Ingress Routing

Ingress can be used to provide a single entry point for multiple applications running inside a Kubernetes cluster.

For example:

```text
                         External Client
                                |
                                v
                    +-----------------------+
                    |   Ingress Controller  |
                    +-----------------------+
                         /             \
                        /               \
                       v                 v
                /api request        /shop request
                       |                 |
                       v                 v
                 API Service       Shop Service
                       |                 |
                       v                 v
                  API Pods          Shop Pods
```

# Kubernetes Configuration, Secrets & Ingress

This documentation covers the deployment and verification of core configuration and routing components in Kubernetes, including ConfigMaps, Secrets, and Ingress resources.

## ConfigMap

A `ConfigMap` is an API object used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume.

The ConfigMap was created to store application configuration properties and injected into a sample Pod. The application successfully read and printed the configuration values at startup.

### Output

<img width="1625" height="871" alt="image" src="https://github.com/user-attachments/assets/37ce2fe1-10ef-4552-a0ab-9d5515726c97" />


---

## Secrets

`Secrets` let you store and manage sensitive information, such as passwords, OAuth tokens, and ssh keys. Unlike ConfigMaps, Secrets are stored securely and only made available to nodes/pods that require them.

A Secret was created containing base64-encoded sensitive credentials and securely mounted into a Pod as environment variables and volume files.

### Output

<img width="1613" height="219" alt="image" src="https://github.com/user-attachments/assets/a05104f7-ba2c-42de-92e0-0533c6e6f81e" />


---

## Ingress

An `Ingress` exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. Traffic routing is controlled by rules defined on the Ingress resource.

An Ingress controller was enabled in Minikube, and an Ingress resource was deployed to route external traffic to internal backend services based on path-based routing rules.

### Output
<img width="1570" height="780" alt="image" src="https://github.com/user-attachments/assets/9023165c-7c0f-4760-aed6-824b2aac3d59" />

<img width="1554" height="819" alt="image" src="https://github.com/user-attachments/assets/187d7c0b-80be-4056-b7a6-f3c968317513" />

<img width="1561" height="669" alt="image" src="https://github.com/user-attachments/assets/e190ad1f-bbad-4a25-a698-8f1e098107b5" />

<img width="1626" height="550" alt="image" src="https://github.com/user-attachments/assets/bc159a67-449e-42c1-b820-5d30282bf83b" />


<img width="1554" height="538" alt="image" src="https://github.com/user-attachments/assets/2f33938b-c4f6-4705-bf86-576b14822250" />

<img width="1552" height="229" alt="image" src="https://github.com/user-attachments/assets/c984122e-123d-4a16-bca7-e6f9c225e41d" />

<img width="1558" height="224" alt="image" src="https://github.com/user-attachments/assets/ec942f1b-9c60-4211-bc00-3fd9ce61721f" />



## Full DEMO

```code
bash 04-full-demo/run-demo.sh

```

<img width="1576" height="785" alt="image" src="https://github.com/user-attachments/assets/2a52a36c-7c91-47d1-8dd8-1c6853e06b32" />
<img width="1563" height="824" alt="image" src="https://github.com/user-attachments/assets/fbf50b01-db78-402a-b2e4-3107a629e92e" />






