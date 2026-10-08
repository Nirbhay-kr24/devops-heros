# AWS VPC - Cloud Networking

A concise overview covering core networking concepts, routing, gateways, and security mechanisms in Amazon Virtual Private Cloud (VPC).

---

## 1. Core Concepts

* **What is VPC?**
  Amazon Virtual Private Cloud (VPC) is a logically isolated virtual network in AWS. It provides control over IP address ranges, subnets, route tables, network gateways, and network security.

* **CIDR (Classless Inter-Domain Routing)**
  A method used to define IP address ranges using prefix notation:
  * Example: `10.0.0.0/16` contains 65,536 IPv4 addresses.
  * The CIDR block defines the IP address range of a VPC or subnet.

* **Subnets**
  Logical subdivisions of a VPC's IP address range. Each subnet belongs to a single Availability Zone (AZ).
  * AWS reserves 5 IPv4 addresses in each subnet for networking and management purposes.

---

## 2. Subnet Types & Routing

* **Public Subnet vs. Private Subnet**
  * **Public Subnet:** A subnet whose route table has a route to an Internet Gateway. Resources can communicate with the internet when they also have appropriate public addressing and security rules.
  * **Private Subnet:** A subnet without a direct route to an Internet Gateway. It is commonly used for application servers, databases, and internal services.

* **Route Tables**
  A collection of routes that determine where network traffic from a subnet or gateway is directed.
  * Every subnet is associated with a route table.
  * If no explicit association is configured, the subnet uses the VPC's main route table.

---

## 3. Network Gateways

* **Internet Gateway (IGW)**
  A highly available VPC component that enables communication between resources in a VPC and the internet.
  * A route to the IGW is required for a subnet to be considered public.
  * Resources also require appropriate public addressing and security rules for internet communication.

* **NAT Gateway (Network Address Translation)**
  A managed service that allows resources in private subnets to initiate outbound connections to the internet without allowing unsolicited inbound connections.
  * Typically deployed in a public subnet.
  * The private subnet's route table sends internet-bound traffic to the NAT Gateway.

---

## 4. Network Security Layers

```text
Internet
    |
    v
[ Network ACL ]  (Subnet Level)
    |
    v
[ Security Group ]  (Network Interface / Instance Level)
    |
    v
[ EC2 Instance ]
```

* **Security Groups vs. Network ACLs (NACLs)**

| Feature | Security Group (SG) | Network ACL (NACL) |
| --- | --- | --- |
| **Operating Level** | Network interface / instance | Subnet |
| **Type** | Stateful | Stateless |
| **Rule Processing** | All applicable rules are evaluated | Rules evaluated in rule-number order |
| **Actions** | Allow rules only | Allow and Deny rules |
| **Return Traffic** | Automatically allowed for permitted connections | Must be explicitly allowed in both directions |

---

## 5. Typical Architecture Overview

* **Public Subnet:** Commonly hosts public-facing load balancers, NAT Gateways, bastion hosts, and other resources requiring direct internet connectivity.
* **Private Subnet:** Commonly hosts application servers, backend microservices, databases, and internal caches.

### Example Architecture

```text
                    Internet
                       |
                       v
                [ Internet Gateway ]
                       |
          +------------+------------+
          |                         |
    Public Subnet              Private Subnet
          |                         |
   [Load Balancer]          [Application Server]
          |                         |
   [NAT Gateway]          [Database / Cache]
          |
          +------> Outbound Internet
```
