# 🚀 DevOps Assignment - Laravel Application Deployment

## 📌 Project Overview

This project demonstrates deploying a Laravel application using Docker, implementing CI/CD automation, and hosting the application on AWS EC2.

---

# 🏗️ 1. Architecture Overview

```
[User Browser]
      ↓
[EC2 Instance (Docker Container)]
      ↓
[Laravel Application]
      ↓
[SQLite Database]
      ↓
[Storage & Logs]
```

---

# 💻 2. Local Development Setup

## Clone Repository

```
git clone https://github.com/yourusername/devops-demo
cd devops-demo
```

## Setup Environment

```
cp .env.example .env
```

## Start Application using Docker

```
docker-compose up
```

## Run Laravel Commands

```
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan migrate
```

## Access Application

```
http://localhost:8000
```

---

# ⚙️ 3. CI/CD Pipeline Explanation

## Tool Used

* GitHub Actions

## Trigger

* Pipeline runs automatically on push to `main` branch

## Pipeline Steps

1. Checkout source code
2. Set up Docker build environment
3. Build Docker image
4. Push Docker image to Docker Hub

## Docker Image

```
abhivishwakarma9874/laravel-app
```

## Secrets Management

* DOCKER_USERNAME
* DOCKER_PASSWORD

These are stored securely in GitHub Secrets.

---

# ☁️ 4. Production Deployment (AWS EC2)

## Platform Chosen

* AWS EC2 (Free Tier)

## Reason

* Full control over server
* Real-world deployment experience
* Widely used in industry

---

## Steps Performed

### 1. Launch EC2 Instance

* Ubuntu 22.04
* Instance type: t2.micro

### 2. Configure Security Group

* Port 22 (SSH)
* Port 80 (HTTP)
* Port 8000 (App access)

### 3. Connect to Server

```
ssh -i key.pem ubuntu@<ec2-public-ip>
```

### 4. Install Docker

```
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
```

### 5. Pull Docker Image

```
docker pull abhivishwakarma9874/laravel-app:latest
```

### 6. Run Container

```
docker run -d -p 80:8000 \
-e APP_ENV=production \
-e APP_KEY=base64:your_key \
-e DB_CONNECTION=sqlite \
-e DB_DATABASE=/var/www/database/database.sqlite \
-e SESSION_DRIVER=file \
-e CACHE_STORE=file \
abhivishwakarma9874/laravel-app
```

---

## 🌐 Live Application

```
http://<your-ec2-public-ip>
```

---

# 🧩 5. Challenges & Solutions

## Issue 1: Docker Build Failure

* Cause: Missing PHP extensions
* Solution: Installed required dependencies in Dockerfile

## Issue 2: Laravel Not Working (Blank Page)

* Cause: Wrong session/cache driver using database
* Solution: Switched to file-based drivers

## Issue 3: SQLite Database Not Found

* Cause: Database file missing
* Solution: Created SQLite file and ran migrations

## Issue 4: AWS vCPU Limit Error

* Cause: Free tier CPU restriction
* Solution: Switched region and used t2.micro instance

## Issue 5: 502 / Application Not Responding

* Cause: Incorrect port binding
* Solution: Configured application to run on correct port

---

# 🔐 6. Security & Improvements

## Current State

* Application runs over HTTP

## Future Improvements

* Enable HTTPS using Let's Encrypt
* Use Nginx reverse proxy
* Add monitoring (UptimeRobot)
* Implement auto-deploy to EC2

---

# 📦 7. Environment Variables

Key variables used:

```
APP_ENV=production
APP_KEY=base64:...
DB_CONNECTION=sqlite
SESSION_DRIVER=file
CACHE_STORE=file
QUEUE_CONNECTION=sync
```

---

# 🎯 Conclusion

This project successfully demonstrates:

* Containerization using Docker
* CI/CD automation with GitHub Actions
* Deployment on AWS EC2
* Debugging and problem-solving in real scenarios

---

# 🚀 Author

Abhishek Vishwakarma


----------------------

For jenkins

http://35.154.194.132:8080/

<img width="1356" height="725" alt="image" src="https://github.com/user-attachments/assets/108bdd59-abf8-4c2b-85c2-2242aebb62da" />


http://35.154.194.132
<img width="1350" height="767" alt="image" src="https://github.com/user-attachments/assets/247d8769-0ad8-470c-8254-42aa360d4878" />
