# AWS EC2 - Compute Basics

A concise overview covering core concepts, components, and the lifecycle of Amazon Elastic Compute Cloud (EC2).

---

## 1. Core Concepts

* **What is EC2?**
  Amazon Elastic Compute Cloud (EC2) provides scalable and resizable compute capacity in the AWS cloud. EC2 instances are virtual servers used to run applications and workloads.

* **AMI (Amazon Machine Image)**
  A pre-configured template used to launch EC2 instances. It contains the information required to create an instance, such as the operating system, software, and configuration.

* **Instance Types**
  Configurations of CPU, memory, storage, and networking capacity optimized for different workloads:
  * **General Purpose:** Balanced compute, memory, and networking (e.g., `t3`, `m5`).
  * **Compute Optimized:** High-performance processors for compute-intensive applications (e.g., `c5`).
  * **Memory Optimized:** Designed for workloads that process large datasets in memory (e.g., `r5`).
  * **Storage Optimized:** Designed for workloads requiring high local storage and I/O performance.
  * **Accelerated Computing:** Uses GPUs or specialized accelerators for graphics, machine learning, and parallel workloads.

---

## 2. Access & Security

* **Key Pairs**
  A public/private key pair used to securely authenticate to an EC2 instance. The public key is associated with the instance, while the private key (`.pem` or `.ppk`) must be securely stored by the user.

* **Security Groups**
  A virtual, stateful firewall that controls inbound and outbound traffic for EC2 instances.
  * **Inbound:** Traffic must be explicitly allowed by configured rules.
  * **Outbound:** Controlled through outbound rules.
  * Security groups are **stateful**, so return traffic for an allowed connection is automatically permitted.

---

## 3. Storage & Networking

* **EBS (Elastic Block Store)**
  Persistent block storage volumes that can be attached to EC2 instances.
  * Data generally persists when an instance is stopped.
  * Volumes can be backed up using EBS Snapshots.
  * EBS volumes are associated with a specific Availability Zone.

* **Public IP vs. Private IP**
  * **Private IP:** Used for communication within the VPC and connected networks.
  * **Public IP:** Internet-routable IPv4 address that can be used for internet communication when the network configuration allows it.
  * Public IPv4 addresses can change when an instance is stopped and started. An **Elastic IP** can be used when a persistent public IPv4 address is required.

---

## 4. Instance Lifecycle

```text
[ Pending ] ──> [ Running ] ──┬──> [ Stopping ] ──> [ Stopped ] ──> [ Starting ]
                              │
                              └──> [ Shutting-down ] ──> [ Terminated ]
```

* **Pending:** Instance is being launched and initialized.
* **Running:** Instance is active and available for workloads.
* **Stopping / Stopped:** Instance is shut down. Compute charges stop, but attached EBS storage continues to incur storage charges.
* **Shutting-down / Terminated:** Instance is being permanently shut down and then terminated. The root EBS volume is normally deleted if its `DeleteOnTermination` setting is enabled.

---

## 5. Common Use Cases

* Hosting web applications and REST APIs.
* Running backend application servers and microservices.
* Enterprise application hosting such as SAP, CRM, and ERP systems.
* Data processing and batch workloads.
* CI/CD build and deployment environments.
* Machine learning and GPU-based workloads.
```
