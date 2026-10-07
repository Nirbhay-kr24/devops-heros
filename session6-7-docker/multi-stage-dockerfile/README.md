# Docker Multi-Stage Build Homework

Name: Nirbhay Kumar

Enrollment Number: 24bcs10030

---

## Task 1: Run Multi-Stage Dockerfile

### 1. Clone Repository

The repository was cloned using:

```bash
git clone https://github.com/Nirbhay-kr24/devops-heros.git
```

The `Assignments` branch was checked out:

```bash
git checkout -b Assignments origin/Assignments
```

The multi-stage Dockerfile is located at:

```text
session6-7-docker/multi-stage-dockerfile/
```

### 2. Multi-Stage Dockerfile

The Dockerfile uses two stages:

* **Stage 1 – Builder:** Installs dependencies and prepares the application.
* **Stage 2 – Production:** Creates the final production image and copies the required application files from the builder stage.

### 3. Build Docker Image

```bash
cd ~/devops-heros/session6-7-docker/multi-stage-dockerfile

docker build -t multi-stage-hello .
```

The image was successfully built.

### 4. Run Docker Container

The application runs on port `3000` inside the container. Port `8080` on the host was mapped to it:

```bash
docker run -d --name multi-stage-container -p 8080:3000 multi-stage-hello
```

### 5. Verify Application

```bash
curl http://localhost:8080
```

Output:

```text
<h1>Hello World from Docker Multi-Stage Build!</h1>
```

The application was also opened in the browser at:

```text
http://localhost:8080
```

### Screenshot

<img width="1919" height="1029" alt="image" src="https://github.com/user-attachments/assets/bedfeece-21a5-4605-8d6c-9596fc200e6e" />

---

### 6. Verify Running Container

Command:

```bash
docker ps
```

Relevant output:

```text
CONTAINER ID   IMAGE               STATUS         PORTS
cd2075c1edd8   multi-stage-hello   Up             0.0.0.0:8080->3000/tcp
```

This confirms that the multi-stage Docker application is running and accessible through host port `8080`.

<img width="1919" height="160" alt="image" src="https://github.com/user-attachments/assets/2b27cf98-00a1-465f-8c99-9e22a91feaf4" />


---

# Task 2: Documentation

### Application Output

The Docker multi-stage application successfully displayed:

```text
Hello World from Docker Multi-Stage Build!
```

Application URL:

```text
http://localhost:8080
```

### Docker Container

The container was successfully started using Docker and verified using:

```bash
docker ps
```

Port mapping:

```text
8080 -> 3000
```

---

# Task 3: Docker Application Deployment

Three different types of applications were deployed using Docker:

1. Node.js
2. Python
3. Java

## Node.js Application

Docker image:

```text
nodejs-hello:latest
```

Build command:

```bash
docker build -t nodejs-hello .
```

Run command:

```bash
docker run -d --name nodejs-hello-container -p 3000:3000 nodejs-hello
```

Application:

```text
http://localhost:3000
```

The Node.js Docker image was successfully created and the container was running.

---

## Python Application

Docker image:

```text
python-hello:latest
```

Build command:

```bash
docker build -t python-hello .
```

Run command:

```bash
docker run -d --name python-hello-container -p 5000:5000 python-hello
```

Application:

```text
http://localhost:5000
```

The Python Docker image was successfully created and the container was running.

---

## Java Application

Docker image:

```text
java-hello:latest
```

Build command:

```bash
docker build -t java-hello .
```

Run command:

```bash
docker run -d --name java-hello-container -p 8080:8080 java-hello
```

Application:

```text
http://localhost:8080
```

The Java Docker image was successfully created.

> **Note:** The Java container was stopped temporarily because port `8080` was required for the multi-stage Docker application.

---

# Docker Images Verification

The following Docker images were successfully created:

```text
java-hello:latest
nodejs-hello:latest
python-hello:latest
multi-stage-hello:latest
```

Command used:

```bash
docker images
```

---

# Result

The Docker multi-stage application was successfully built and deployed.

The application displayed:

```text
Hello World from Docker Multi-Stage Build!
```

The application was successfully accessed through port `8080`.

Additionally, Node.js, Python, and Java applications were successfully built and deployed using Docker.
