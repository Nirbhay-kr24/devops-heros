# Docker Fundamental: Multi-Stack Hello World Applications

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)
![Apache](https://img.shields.io/badge/Apache-D22128?style=for-the-badge&logo=apache&logoColor=white)

A collection of **6 distinct micro-web applications** built across different languages and web servers, all containerized using Docker. Designed to showcase multi-stage builds, runtime configurations, and port mapping across varying backend and frontend environments.


## Applications

The following applications were created:

1. Node.js
2. Python
3. Java
4. Apache
5. React
6. Nginx

Each application has its own folder, application code, and Dockerfile.

---

## 1. Node.js Application

### Folder

```text
nodejs-app/
```

### Dockerfile

```dockerfile
FROM node:20-alpine

WORKDIR /app

COPY server.js .

EXPOSE 3000

CMD ["node", "server.js"]
```

### Build

```bash
docker build -t nodejs-hello .
```

### Run

```bash
docker run -d --name nodejs-hello-container -p 3000:3000 nodejs-hello
```

### Webpage

```text
http://localhost:3000
```

### Output

<img width="959" height="576" alt="image" src="https://github.com/user-attachments/assets/679c336b-ee91-46f1-8fa5-a6e257eecf5b" />

---

## 2. Python Application

### Folder

```text
python-app/
```

### Dockerfile

```dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
```

### Build

```bash
docker build -t python-hello .
```

### Run

```bash
docker run -d --name python-hello-container -p 5000:5000 python-hello
```

### Webpage

```text
http://localhost:5000
```

### Output

<img width="959" height="537" alt="image" src="https://github.com/user-attachments/assets/9604ea90-7548-4778-83d9-81fd4e9d3b1e" />

---

## 3. Java Application

### Folder

```text
java-app/
```

### Dockerfile

```dockerfile
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

COPY Main.java .

RUN javac Main.java

EXPOSE 8080

CMD ["java", "Main"]
```

### Build

```bash
docker build -t java-hello .
```

### Run

```bash
docker run -d --name java-hello-container -p 8080:8080 java-hello
```

### Webpage

```text
http://localhost:8080
```

### Output

<img width="958" height="561" alt="image" src="https://github.com/user-attachments/assets/5254caa5-83ac-4770-a208-306b522e7917" />

---

## 4. Apache Application

### Folder

```text
Apache-app/
```

### Dockerfile

```dockerfile
FROM httpd:2.4-alpine

COPY index.html /usr/local/apache2/htdocs/

EXPOSE 80
```

### Build

```bash
docker build -t apache-hello .
```

### Run

```bash
docker run -d --name apache-hello-container -p 8081:80 apache-hello
```

### Webpage

```text
http://localhost:8081
```

### Output

<img width="957" height="580" alt="image" src="https://github.com/user-attachments/assets/7fcc763f-5bc9-4290-9ea4-87cfc23bb160" />

---

## 5. React Application

### Folder

```text
React-app/
```

### Dockerfile

```dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 5173

CMD ["npm", "start"]
```

### Build

```bash
docker build -t react-hello .
```

### Run

```bash
docker run -d --name react-hello-container -p 5173:5173 react-hello
```

### Webpage

```text
http://localhost:5173
```

### Output

<img width="955" height="533" alt="image" src="https://github.com/user-attachments/assets/4fa5e2f2-6b1b-4221-ae36-a946d8f851c8" />

---

## 6. Nginx Application

### Folder

```text
nginx-app/
```

### Dockerfile

```dockerfile
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/

EXPOSE 80
```

### Build

```bash
docker build -t nginx-hello .
```

### Run

```bash
docker run -d --name nginx-hello-container -p 8082:80 nginx-hello
```

### Webpage

```text
http://localhost:8082
```

### Output

<img width="957" height="550" alt="image" src="https://github.com/user-attachments/assets/3633f123-6f61-498e-812d-2f69f9802e05" />

---

# Docker Containers Verification

The following command was used to verify that all applications were running:

```bash
docker ps
```

The containers were running on the following ports:

| Application | Container Port | Local Port | URL                     |
| ----------- | -------------: | ---------: | ----------------------- |
| Node.js     |           3000 |       3000 | `http://localhost:3000` |
| Python      |           5000 |       5000 | `http://localhost:5000` |
| Java        |           8080 |       8080 | `http://localhost:8080` |
| Apache      |             80 |       8081 | `http://localhost:8081` |
| React       |           5173 |       5173 | `http://localhost:5173` |
| Nginx       |             80 |       8082 | `http://localhost:8082` |

### Docker PS Output

<img width="1777" height="166" alt="image" src="https://github.com/user-attachments/assets/fdb319c2-7202-4980-a43f-3a0efcfaefbe" />

---

# Result

All six Hello World web applications were successfully created, Dockerized, built as Docker images, and run as containers.

The applications were verified through their respective localhost URLs.
