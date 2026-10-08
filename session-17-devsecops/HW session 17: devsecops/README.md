# Complete CI/CD & DevSecOps


## DevSecOps Pipeline

The GitHub Actions workflow performs the following stages:

- **Unit Tests** – Validates the application.
- **SAST** – Static Application Security Testing using CodeQL.
- **SCA** – Dependency security scanning.
- **Docker Build** – Builds the application container image.
- **Image Scan** – Scans the Docker image using Trivy.
- **Security Gate** – Security checks are completed before the image is pushed and deployed.
- **Push Image** – Pushes the image to Docker Hub.
- **Deploy to Kubernetes** – Deploys the application to Kubernetes.

## Project Structure

<img width="1766" height="756" alt="image" src="https://github.com/user-attachments/assets/53868c78-ee35-4498-9ba5-b762b61098eb" />

<img width="1907" height="927" alt="image" src="https://github.com/user-attachments/assets/d190ad3c-2ea1-4002-8d09-15b8c816f081" />




### API manual Test

<img width="1773" height="550" alt="image" src="https://github.com/user-attachments/assets/b0b83f7b-8869-4e65-98df-a38e2c35d787" />



# Successful Pipeline Execution

<img width="1902" height="929" alt="image" src="https://github.com/user-attachments/assets/113b19de-aa9b-4b13-a77b-6b238a92d9ed" />
