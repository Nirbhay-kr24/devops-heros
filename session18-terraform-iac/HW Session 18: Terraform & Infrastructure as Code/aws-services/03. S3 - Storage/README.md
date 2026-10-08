# AWS S3 - Scalable Object Storage

A concise overview covering core concepts, features, security, and use cases for Amazon Simple Storage Service (S3).

---

## 1. Core Concepts

* **What is S3?**
  Amazon Simple Storage Service (S3) is an object storage service designed to store and retrieve any amount of data with high scalability, availability, security, and performance.

* **Buckets**
  Containers for objects stored in S3.
  * Bucket names are **globally unique** across AWS.
  * S3 uses a flat object namespace; folders are represented using key prefixes.

* **Objects**
  The fundamental entities stored in S3, consisting of:
  * **Data:** The actual file. A single object can be up to 5 TB.
  * **Key:** The unique identifier of the object (e.g., `images/photo.jpg`).
  * **Metadata:** System-defined and user-defined key-value information associated with the object.

---

## 2. Storage Classes & Lifecycle

* **Storage Classes**
  Designed for different data access patterns and cost requirements:
  * **S3 Standard:** Designed for frequently accessed data with high availability and low latency.
  * **S3 Intelligent-Tiering:** Automatically moves objects between access tiers based on changing access patterns.
  * **S3 Standard-IA / S3 One Zone-IA:** Designed for infrequently accessed data that still requires rapid retrieval.
  * **S3 Glacier Flexible Retrieval / S3 Glacier Deep Archive:** Low-cost storage classes for long-term archival data.

* **Lifecycle Policies**
  Automated rules used to manage objects throughout their lifecycle:
  * **Transitions:** Move objects to different storage classes based on age or other conditions.
  * **Expirations:** Automatically delete objects after a specified period.

---

## 3. Data Protection & Security

* **Versioning**
  Maintains multiple versions of an object in the same bucket. It helps protect against accidental overwrites and deletions and allows previous versions to be restored.

* **Encryption**
  Protects S3 data at rest and in transit:
  * **In Transit:** HTTPS/TLS protects data while being transferred.
  * **At Rest:**
    * `SSE-S3`: Server-side encryption using Amazon S3 managed keys.
    * `SSE-KMS`: Server-side encryption using AWS Key Management Service (KMS) keys.
    * `SSE-C`: Server-side encryption using customer-provided encryption keys.

* **Bucket Policies**
  JSON-based resource policies attached to buckets to control access to objects and bucket resources. They can be used to grant or restrict permissions based on users, services, IP addresses, and other conditions.

---

## 4. Common Use Cases

* **Static Website Hosting:** Hosting HTML, CSS, JavaScript, and media assets.
* **Backup & Disaster Recovery:** Storing backups and other recovery data with high durability.
* **Data Lakes & Analytics:** Central storage for raw and processed data used in analytics pipelines.
* **Media Storage & Distribution:** Storing images, videos, documents, and other assets for applications and content delivery.
