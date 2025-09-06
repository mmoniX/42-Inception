# 42-Inception

A Docker-based infrastructure project that sets up a complete web application stack using Docker Compose with NGINX, WordPress, and MariaDB.

## 📋 Project Overview

This project implements a complete web infrastructure using Docker containers with the following services:
- **NGINX**: Web server with SSL/TLS termination
- **WordPress**: Content Management System with PHP-FPM
- **MariaDB**: Database server

All services run in separate Docker containers and communicate through a custom Docker network.

## 🏗️ Architecture
<img src="/Users/mmonika/Inception/inception.webp" alt="Architecture Diagram" width="500" height="300" style="display: block; margin: 0 auto;">

## 📁 Project Structure

```
.
├── Makefile                              # Build automation
├── README.md                             # This file
└── srcs/
    ├── .env                              # Environment variables
    ├── docker-compose.yml                # Service orchestration
    ├── host_setup.sh                     # Host configuration script
    └── requirements/
        ├── nginx/
        │   ├── Dockerfile                # NGINX container definition
        │   ├── nginx.conf                # NGINX configuration
        │   └── ssl_certificate.txt       # SSL documentation
        ├── wordpress/
        │   ├── Dockerfile                # WordPress container definition
        │   ├── php.conf                  # PHP-FPM configuration
        │   └── wp_setup.sh               # WordPress setup script
        └── mariadb/
            ├── Dockerfile                # MariaDB container definition
            ├── db_setup.sh               # Database setup script
            └── script.txt                # MariaDB documentation
```
## ⚙️ Services Configuration

#### NGINX
- Listens on port 443 (HTTPS) with self-signed SSL certificate
- Redirects HTTP (port 80) traffic to HTTPS
- Serves as reverse proxy to WordPress PHP-FPM
- Configuration: `nginx.conf`

#### WordPress
- Uses WP-CLI for automated setup
- Runs on PHP-FPM 8.4
- Automatically creates admin user and additional user
- Setup script: `wp_setup.sh`

#### MariaDB
- Automated database and user creation
- Persistent data storage localy
- Setup script: `db_setup.sh`

## 📚 Resources

### Official Documentation
1. [NGINX HTTPS Configuration](https://nginx.org/en/docs/http/configuring_https_servers.html)
2. [WordPress CLI Installation](https://make.wordpress.org/cli/handbook/guides/installing/)

### Additional References
3. [NGINX TLS Configuration](https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/)
4. [NGINX Tutorial Video](https://youtu.be/q8OleYuqntY?si=fRhoGqt2kxg1RiO7)
5. [WP-CLI Guide](https://medium.com/@imyzf/inception-3979046d90a0)
6. [MariaDB Tutorial](https://www.youtube.com/watch?v=BN8lMesmvPw)
7. [PHP-FPM Configuration](https://www.youtube.com/watch?v=vohsuhwWvpw)
8. [Inception Project Guide](https://medium.com/@ssterdev/inception-guide-42-project-part-i-7e3af15eb671)
9. [Inception Tutorial](https://tuto.grademe.fr/inception/)