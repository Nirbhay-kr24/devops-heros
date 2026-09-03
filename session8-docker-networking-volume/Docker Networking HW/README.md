# Docker Networking & Volume Homework

## Task 1: Docker Container Networking

Three containers were created:

* Frontend — Nginx
* Backend — Alpine
* Database — MySQL

Three different Docker networks were created:

* `frontend-net`
* `backend-net`
* `database-net`

## Create Networks

```bash
docker network create frontend-net
docker network create backend-net
docker network create database-net
```

## Create Database Container

```bash
docker run -d \
  --name database \
  --network database-net \
  -e MYSQL_ROOT_PASSWORD=root123 \
  -e MYSQL_DATABASE=students \
  mysql:8.0
```

## Create Backend Container

```bash
docker run -d \
  --name backend \
  --network backend-net \
  alpine:latest \
  sleep infinity
```

Connect the backend to the database network:

```bash
docker network connect database-net backend
```

Connect the backend to the frontend network:

```bash
docker network connect frontend-net backend
```

## Create Frontend Container

```bash
docker run -d \
  --name frontend \
  --network frontend-net \
  nginx:alpine
```

## Network Configuration

The final network configuration was:

```text
frontend-net → backend, frontend
backend-net  → backend
database-net → backend, database
```

Command used:

```bash
docker network inspect frontend-net --format '{{range .Containers}}{{.Name}} {{end}}'
docker network inspect backend-net --format '{{range .Containers}}{{.Name}} {{end}}'
docker network inspect database-net --format '{{range .Containers}}{{.Name}} {{end}}'
```

Output:

```text
backend frontend
backend
backend database
```

This shows that the backend container is connected to multiple networks and can communicate with both the frontend and database.

## Check Container Connectivity

### Backend → Frontend

```bash
docker exec backend ping -c 3 frontend
```

Output:

```text
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max = 0.082/0.099/0.108 ms
```

### Backend → Database

```bash
docker exec backend ping -c 3 database
```

Output:

```text
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max = 0.136/0.161/0.188 ms
```

### Screenshot

<img width="1919" height="474" alt="image" src="https://github.com/user-attachments/assets/712fa336-103b-4feb-9030-20bd9835edde" />

<img width="1919" height="391" alt="image" src="https://github.com/user-attachments/assets/08550e95-012f-4155-b58b-d6b46512b70b" />

---

## Task 2: Host Network

Apache HTTP Server was pulled from Docker Hub:

```bash
docker pull httpd:2.4-alpine
```

The Apache container was created using the host network:

```bash
docker run -d \
  --name apache-host \
  --network host \
  httpd:2.4-alpine
```

## Verify Host Network

```bash
docker inspect apache-host --format '{{.HostConfig.NetworkMode}}'
```

Output:

```text
host
```

This confirms that the Apache container is using the Docker host network.

## Verify Apache

```bash
docker exec apache-host sh -c "wget -qO- http://localhost:80"
```

Output:

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>It works! Apache httpd</title>
</head>
<body>
<p>It works!</p>
</body>
</html>
```

Apache was successfully running on port `80` inside the host network.

<img width="1916" height="269" alt="image" src="https://github.com/user-attachments/assets/74a75882-ca8a-42dd-bc48-4bb87610a4b9" />

---

## Task 3: Bind Mount

A local directory was created:

```bash
mkdir -p ~/docker_networking_homework/nginx-bind
cd ~/docker_networking_homework/nginx-bind
```

An `index.html` file was created:

```bash
echo "Hello students" > index.html
```

## Initial Content

```bash
cat index.html
```

Output:

```text
Hello students
```

## Run Nginx with Bind Mount

```bash
docker run -d \
  --name nginx-bind \
  -p 8083:80 \
  -v ~/docker_networking_homework/nginx-bind:/usr/share/nginx/html \
  nginx:alpine
```

The local directory was mounted to:

```text
/usr/share/nginx/html
```

inside the Nginx container.

## Verify Initial Website

```bash
curl http://localhost:8083
```

Output:

```text
Hello students
```

<img width="951" height="42" alt="image" src="https://github.com/user-attachments/assets/cb1fa310-f62c-4e69-baf2-8aaccf0ef8b8" />
<img width="1919" height="886" alt="image" src="https://github.com/user-attachments/assets/d1c2caec-2a9a-4ef7-a183-d885e16ddb30" />



## Modify the File

The `index.html` file was modified without restarting the container:

```bash
echo "Hello students - Updated!" > index.html
```

Verify the file:

```bash
cat index.html
```

Output:

```text
Hello students - Updated!
```

Then the running Nginx container was accessed again:

```bash
curl http://localhost:8083
```

Output:

```text
Hello students - Updated!
```

The updated content was reflected immediately without restarting the container.

## Verify Container

```bash
docker ps | grep nginx-bind
```

Output:

```text
b792e27723da   nginx:alpine   ...   Up   0.0.0.0:8083->80/tcp
```
<img width="1912" height="134" alt="image" src="https://github.com/user-attachments/assets/0d243ae7-9580-4ea7-ba4d-0b41be14ebf3" />

<img width="1919" height="868" alt="image" src="https://github.com/user-attachments/assets/42b72f64-9a2c-4a2e-ab05-a72493bb3646" />

---

## Task 4: Overlay Network

Docker overlay networks are used to connect containers or services across multiple Docker hosts.

An overlay network was created after initializing Docker Swarm.

## Initialize Docker Swarm

```bash
docker swarm init
```

Output confirmed that the current node became a Swarm manager.

## Create Overlay Network

```bash
docker network create -d overlay overlay-net
```

## Verify Overlay Network

```bash
docker network ls
```

Relevant output:

```text
NETWORK ID     NAME          DRIVER    SCOPE
mqqeqo3ekfj3   overlay-net   overlay   swarm
```

The network was inspected using:

```bash
docker network inspect overlay-net
```

Important configuration:

```text
Name:       overlay-net
Driver:     overlay
Scope:      swarm
Subnet:     10.0.1.0/24
Gateway:    10.0.1.1
```

## How Overlay Networks Work

An overlay network creates a virtual network that can span multiple Docker hosts participating in a Docker Swarm.

It allows containers/services running on different Docker hosts to communicate as if they are connected to the same logical network.

### Use Cases

* Connecting services across multiple Docker hosts
* Docker Swarm applications
* Microservice communication
* Distributed applications
* Service-to-service communication across cluster nodes

### Screenshot

<img width="1919" height="284" alt="image" src="https://github.com/user-attachments/assets/34fa973e-d55b-4509-b8f2-931512f9a3e2" />

<img width="1907" height="883" alt="image" src="https://github.com/user-attachments/assets/30cf9713-51ec-4149-8d6c-388f24a9c8fa" />

---

The exercises demonstrated Docker container networking, host networking, bind mounts, and overlay networking.
