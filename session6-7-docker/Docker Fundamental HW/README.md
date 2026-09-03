# Docker Fundamental: Multi-Stack Hello World Applications

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)
![Apache](https://img.shields.io/badge/Apache-D22128?style=for-the-badge&logo=apache&logoColor=white)

A collection of **6 distinct micro-web applications** built across different languages and web servers, all containerized using Docker. Designed to showcase multi-stage builds, runtime configurations, and port mapping across varying backend and frontend environments.

---

## Project Architecture


```

.
├── nodejs-app/       # Express.js web server returning dynamic HTML
├── python-app/       # WSGI application running Flask
├── java-app/         # Native Java HTTP server containerized with OpenJDK
├── Apache-app/       # Apache HTTPD container serving static assets
├── React-app/        # Vite-powered React SPA with multi-stage Nginx build
└── nginx-app/        # Lightweight Nginx alpine container

```

---

## 🌐 Active Services & Network Map

> [!NOTE]
> Ensure host ports `3000`, `5000`, `8080`, `8081`, `8082`, and `8083` are open on your host machine before starting containers.


```

+-------------------------------------------------------------------------------+
| CONTAINER           | CONTAINER PORT | HOST PORT | ACCESSIBLE ENDPOINT       |
+---------------------+----------------+-----------+---------------------------+
| Node.js Server      | 3000           | 3000      | http://localhost:3000     |
| Python Flask        | 5000           | 5000      | http://localhost:5000     |
| Java HTTP Server    | 8080           | 8080      | http://localhost:8080     |
| Apache Web Server   | 80             | 8081      | http://localhost:8081     |
| Nginx Web Server    | 80             | 8082      | http://localhost:8082     |
| React SPA (Vite)    | 80             | 8083      | http://localhost:8083     |
+-------------------------------------------------------------------------------+

```

---

## Build & Run Walkthrough

Run these commands from the root directory to build each image and spin up the corresponding container:

### 1. Node.js
```bash
# Build image
docker build -t nodejs-app ./nodejs-app

# Launch container
docker run -d -p 3000:3000 nodejs-app

```
<img width="1919" height="1032" alt="image" src="https://github.com/user-attachments/assets/141dff0c-2e11-436d-85c7-df729fdb50d7" />

### 2. Python

```bash
# Build image
docker build -t python-app ./python-app

# Launch container
docker run -d -p 5000:5000 python-app

```

### 3. Java

```bash
# Build image
docker build -t java-app ./java-app

# Launch container
docker run -d -p 8080:8080 java-app

```

### 4. Apache

```bash
# Build image
docker build -t apache-app ./Apache-app

# Launch container
docker run -d -p 8081:80 apache-app

```

### 5. Nginx Engine

```bash
# Build image
docker build -t nginx-app ./nginx-app

# Launch container
docker run -d -p 8082:80 nginx-app

```

### 6. React

```bash
# Build image
docker build -t react-app ./React-app

# Launch container
docker run -d -p 8083:80 react-app

```

---

## 🛠️ Verification & Teardown

To verify all services are running smoothly, execute:

```bash
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

```

To stop and remove all 6 running containers at once:

```bash
docker stop $(docker ps -q) && docker rm$(docker ps -a -q)

```

```

```
