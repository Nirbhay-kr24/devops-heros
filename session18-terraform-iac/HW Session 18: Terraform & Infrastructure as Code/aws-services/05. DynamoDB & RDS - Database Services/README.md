# AWS Database Services - DynamoDB & RDS

A concise overview covering core architecture, features, security, scaling options, and use cases for Amazon DynamoDB and Amazon RDS.

---

## 1. Amazon DynamoDB (NoSQL)

* **What is DynamoDB?**
  Amazon DynamoDB is a fully managed NoSQL database service supporting key-value and document data models. It is designed to provide low-latency performance and automatic scaling for applications of any size.

### Core Components

* **Tables:** Collections of items stored in DynamoDB.
* **Items:** Individual data records stored in a table, similar to rows in a relational database.
* **Attributes:** Data elements within an item, similar to columns. Items can have different attributes, except that required key attributes must follow the table's key schema.

### Key Concepts & Data Modeling

* **Partition Key:** A primary key consisting of a single attribute. DynamoDB uses the partition key value to determine how data is distributed across its storage infrastructure.

* **Sort Key:** An optional second key attribute used with the partition key to create a **composite primary key**. Items with the same partition key are logically grouped and ordered by their sort key.

### Use Cases

* High-scale web applications.
* Real-time gaming and leaderboards.
* Shopping carts and session management.
* Serverless applications and AWS Lambda integrations.
* Applications requiring high-throughput, low-latency key-value access.

---

## 2. Amazon RDS (Relational Database Service)

* **What is RDS?**
  Amazon Relational Database Service (RDS) is a managed relational database service that simplifies database administration tasks such as provisioning, patching, backups, monitoring, and recovery.

### Supported Engines

* PostgreSQL
* MySQL
* MariaDB
* Oracle
* Microsoft SQL Server
* Amazon Aurora, a fully managed relational database engine compatible with MySQL and PostgreSQL.

### Core Features & Architecture

* **DB Instances:** Managed database environments with configurable compute, memory, storage, and networking resources.

* **Security:** RDS databases can be secured using VPC networking, Security Groups, IAM features where supported, and encryption at rest using AWS KMS. Connections can also use SSL/TLS encryption.

* **Backups:**
  * **Automated Backups:** Automatically creates backups and transaction logs, supporting point-in-time recovery within the configured retention period.
  * **Manual Snapshots:** User-created database snapshots that remain available until explicitly deleted.

### High Availability & Performance Scaling

* **Multi-AZ Deployment:** Provides high availability by maintaining a standby database in another Availability Zone and supporting automatic failover when required.

* **Read Replicas:** Creates read-only replicas of a database to scale read-heavy workloads and reduce read traffic on the primary database. Replication is generally asynchronous.

* **Scaling:** RDS supports increasing compute capacity, storage scaling, and read replicas depending on the database engine and workload requirements.

### Use Cases

* Traditional relational applications.
* Applications requiring complex SQL queries and joins.
* Financial and transactional systems requiring ACID properties.
* Enterprise ERP and CRM applications.
* Applications requiring managed relational database infrastructure.

---

## 3. Quick Comparison: DynamoDB vs. RDS

| Feature | DynamoDB | Amazon RDS |
| :--- | :--- | :--- |
| **Data Model** | Key-Value / Document (NoSQL) | Relational / Structured (SQL) |
| **Scaling** | Horizontal scaling with on-demand or provisioned capacity | Compute/storage scaling and Read Replicas |
| **Schema** | Flexible item attributes with defined key schema | Defined relational table schema |
| **Query Model** | Key-based access and DynamoDB query operations | SQL queries, joins, indexes, and transactions |
| **Primary Use** | High-throughput, low-latency NoSQL workloads | Complex queries, relational data, and transactional applications |
| **Management** | Fully managed NoSQL service | Fully managed relational database service |
