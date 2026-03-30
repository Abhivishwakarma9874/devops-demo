# 🚀 Deployment Documentation – Laravel DevOps Project

## 👨‍💻 Author
Abhishek Vishwakarma

---

## 1. 🧱 Architecture Overview

```
User → Web Server (PHP / Nginx) → Laravel Application → SQLite Database
                              ↓
                        Storage / Logs
```

This project uses a simple architecture where:
- Laravel runs inside a Docker container  
- SQLite is used as a lightweight database  
- Logs and files are stored in the storage directory  

---

## 2. 💻 Local Development Setup

### Clone and Run Locally

```bash
git clone https://github.com/Abhivishwakarma9874/devops-demo.git
cd devops-demo
cp .env.example .env
docker compose up -d
docker compose exec app php artisan key:generate
docker compose exec app php artisan migrate
```

### Access Application

```
http://localhost:8000
```

---

## 3. ⚙️ CI/CD Pipeline Explanation

### 🔹 Trigger
- Pipeline is triggered on push to the `main` branch  

### 🔹 Pipeline Steps
- Checkout code from GitHub  
- Build Docker image  
- Login to Docker Hub  
- Push image to Docker Hub  
- Deploy container on EC2  

### 🔹 Secrets Management
- Docker Hub credentials stored in Jenkins credentials  
- Environment variables managed using `.env` file  
- No sensitive data is hardcoded  

---

## 4. ☁️ Production Deployment

### 🔹 Platform Used
- AWS EC2  

### 🔹 Why EC2?
- Free tier available  
- Full control over server  
- Real-world DevOps experience  

### 🔹 Deployment Steps

```bash
# Launch EC2 (Ubuntu)

# Install Docker & Jenkins

# Configure Security Group:
# Port 22 (SSH)
# Port 80 (HTTP)
# Port 8080 (Jenkins)

# Run container
docker run -d -p 80:8000 --name laravel_app abhivishwakarma9874/laravel-app
```

### 🔹 Environment Variables

```
APP_ENV=production
APP_DEBUG=false
APP_URL=http://35.154.194.132

DB_CONNECTION=sqlite
DB_DATABASE=/var/www/database/database.sqlite

SESSION_DRIVER=file
CACHE_STORE=file
QUEUE_CONNECTION=sync
```

### 🔹 Access Application

```
http://35.154.194.132
```

---

## 5. 🐞 Challenges & Solutions

### ❌ Issue 1: 500 Internal Server Error
**Cause:** Missing `.env` and `APP_KEY`  
**Solution:** Created `.env` and generated key  

---

### ❌ Issue 2: Docker not found in Jenkins
**Cause:** Jenkins user had no Docker access  

**Solution:**
```bash
sudo usermod -aG docker jenkins
```

---

### ❌ Issue 3: Permission Issues
**Cause:** Storage not writable  

**Solution:**
```bash
chmod -R 777 storage bootstrap/cache database
```

---

### ❌ Issue 4: SQLite DB not found
**Cause:** Database file missing  

**Solution:**
```bash
touch database/database.sqlite
```

---

## 🔄 Improvements (Future)

- Use MySQL/PostgreSQL instead of SQLite  
- Add Nginx reverse proxy  
- Enable HTTPS (SSL)  
- Add monitoring tools  

---

## ✅ Conclusion

This project demonstrates:

- Docker-based containerization  
- CI/CD automation using Jenkins  
- Deployment on AWS EC2  
- Real-world debugging and troubleshooting  

The application is successfully deployed and accessible via a public URL.
