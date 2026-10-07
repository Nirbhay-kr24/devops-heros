# Session 15: Helm
This session covers `Helm`, the package manager for Kubernetes. The assignment demonstrates
Helm chart creation, installation, upgrades, release history, rollback, repositories,
searching charts, and a complete Helm mini project.

## 1: Helm Commands

### helm create
`helm create` generates a starter Helm chart with the standard directory structure and default templates.
<img width="1561" height="896" alt="image" src="https://github.com/user-attachments/assets/5f431edf-bc58-4ca0-a85f-5c81cc770a45" />
<img width="1551" height="453" alt="image" src="https://github.com/user-attachments/assets/7e5e0aea-d4cf-4c97-b807-c861fc085fc7" />


### helm install
<img width="1559" height="507" alt="image" src="https://github.com/user-attachments/assets/4732a549-55ce-40fe-a93d-d1ef708891f6" />

### helm list
<img width="1519" height="96" alt="image" src="https://github.com/user-attachments/assets/725295ae-904d-420a-9b3c-af9ab0fa0eb3" />

### helm status
<img width="1521" height="289" alt="image" src="https://github.com/user-attachments/assets/6706aaa4-3f61-4a1a-b999-4ee602874c9c" />

### helm get
<img width="1509" height="253" alt="image" src="https://github.com/user-attachments/assets/f00dfbc2-2cca-44fc-873b-e250698d4408" />
<img width="1523" height="578" alt="image" src="https://github.com/user-attachments/assets/d8445ee7-71e0-4c44-ad45-bd183bc98ab2" />


### helm upgrade
<img width="1526" height="701" alt="image" src="https://github.com/user-attachments/assets/d4cc4245-c9a0-4ff6-a250-221c25b0f056" />

### helm history
<img width="1520" height="118" alt="image" src="https://github.com/user-attachments/assets/6d6327a4-db95-420b-b124-af70e4f8ceda" />

### helm rollback
<img width="1522" height="492" alt="image" src="https://github.com/user-attachments/assets/bb906c70-ebe0-473a-bbc5-8750e1456c86" />

### helm uninstall
<img width="1518" height="142" alt="image" src="https://github.com/user-attachments/assets/0f80a1c2-84a9-4ac4-a683-c96afdb11b0e" />

### helm repo
<img width="1512" height="340" alt="image" src="https://github.com/user-attachments/assets/f55369c9-0b52-401e-bc2f-fd66daa82023" />

### helm search
<img width="1514" height="142" alt="image" src="https://github.com/user-attachments/assets/ecc22145-3ff9-432a-8cd0-8dfa67afdac0" />


## 2: Helm Rollback
### Step 1: Install and Verify
<img width="1507" height="531" alt="image" src="https://github.com/user-attachments/assets/73fefa3a-dc40-4f0d-90d2-5721d280e45f" />

   ↓
   
### Step 2: Upgrade to 2 Replicas
<img width="1519" height="394" alt="image" src="https://github.com/user-attachments/assets/6dd97178-bc61-4962-8c26-c0140188f982" />


   ↓
### Step 3: Upgrade to 3 Replicas
<img width="1515" height="441" alt="image" src="https://github.com/user-attachments/assets/1dd15d56-afff-4185-83eb-ff9c1bea265c" />

   ↓
### Step 4: Rollback to Revision 2
<img width="1518" height="397" alt="image" src="https://github.com/user-attachments/assets/837b9b74-aac4-4987-a20d-56921e203e99" />

The release was successfully rolled back from revision 3 to revision 2.
Helm created revision 4 for the rollback operation, and the application returned to the configuration with 2 replicas.


# 3. Mini Project

Complete Helm mini project.
<img width="1524" height="841" alt="image" src="https://github.com/user-attachments/assets/93300194-e34e-4895-a8f7-a6d7d54c0aa3" />

<img width="1525" height="908" alt="image" src="https://github.com/user-attachments/assets/f202a0ec-1b2c-42b0-9bb4-b463e3f2f12e" />

<img width="1511" height="319" alt="image" src="https://github.com/user-attachments/assets/d7ba4406-1e79-4545-8249-5580a30d5125" />

<img width="1519" height="614" alt="image" src="https://github.com/user-attachments/assets/c5926e55-58e0-4a44-9c4d-d772bd9bf986" />

<img width="1520" height="402" alt="image" src="https://github.com/user-attachments/assets/7533c907-4ec3-49ff-9541-a41a5ac7bcf1" />

<img width="1514" height="353" alt="image" src="https://github.com/user-attachments/assets/2488f9f6-8812-4f0d-86f6-92c98aaec701" />

<img width="1509" height="340" alt="image" src="https://github.com/user-attachments/assets/0ad85a0f-ec40-47dc-a708-e92add346422" />









