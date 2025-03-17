# 🚀 Flask & React Deployment Guide

This guide outlines the steps to build, deploy, and automate your Flask and React application using Docker, GitHub Actions, and AWS.

---

## 📌 Instructions

1️⃣ **Build Docker Images**
- Build the Dockerfile for the Flask backend.
- Build the Dockerfile for the Nginx frontend.
- Build using Docker Compose.

---

## 🌍 Deployment Steps

### 1️⃣ Push Code to GitHub
```bash
git add .
git commit -m "flask-react app"
git push origin main
```

### 2️⃣ Push Docker Images to Docker Hub
```bash
docker tag nginx-backend:1.0 jeremyhuegel/nginx-backend:1.0
docker push jeremyhuegel/nginx-backend:1.0

docker tag flask-backend:1.0 jeremyhuegel/flask-backend:1.0
docker push jeremyhuegel/flask-backend:1.0
```

### 3️⃣ Create AWS Resources
- Create a `main.tf` file to provision an AWS EC2 instance.
- Manually create an **S3 bucket**.
- Manually create a **DynamoDB table**.

### 4️⃣ Set Up GitHub Actions for CI/CD
1. In the root directory, create a `.github/workflows/` directory.
2. Add a `deploy-app.yml` file.
3. Push the changes to trigger GitHub Actions:
   ```bash
   git add .
   git commit -m "github actions workflow"
   git push origin main
   ```
4. GitHub Actions will automatically start the deployment process.

---

### ✅ Your app is now ready for deployment! 🎉

---

💡 *For any issues, check GitHub Actions logs and AWS console for troubleshooting.*

