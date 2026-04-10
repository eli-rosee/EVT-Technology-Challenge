# EVT Technology Challenge 2026

## Overview
This project implements a containerized HTTPS web server using Docker and Nginx. It serves a static webpage over a secure, self-signed certificate on port 443, automatically redirecting all HTTP traffic to HTTPS. A single command (`setup.sh`) handles certificate generation, image building, and container startup. Everything is automated from setup to teardown.

## Prerequisites
- Docker installed and running
- OpenSSL (usually pre-installed)
- Bash shell

## Quick Start
```bash
cd scripts/
./setup.sh
```

## Directory Structure
```
.
├── Dockerfile
├── .gitignore
├── README.md
├── configs/
│   ├── nginx.conf
│   └── openssl.conf
├── resources/
│   ├── index.html
│   └── doom.mp4
├── scripts/
│   ├── setup.sh
│   ├── shutdown.sh
│   ├── test.sh
│   └── logs.sh
└── certs/ (generated on first run)
    ├── server.key
    └── server.crt
```
## Scripts Guide
- **setup.sh** → Generates certs, builds image, runs container
- **test.sh** → Verifies HTTP/HTTPS are functional
- **logs.sh** → Debug the container
- **shutdown.sh** → Clean teardown

## Tech Stack & Design Decisions

### Docker
Docker was chosen because it improves automation and portability. The pre-configured nginx container from Docker Hub simplifies the setup drastically, and containerization ensures anyone can run this server on any system without worrying about dependencies or environment differences.

**Alternatives considered:**
- Vagrant/VirtualBox (VM is much heavier in setup and resources when compared to a container)
- Kubernetes (Massively overkill for a single container)
- Cloud services (Requires log in credentials which complicates automation)

### Nginx
Nginx was chosen because it is the lightest weight, fastest server architecture when it comes to serving static webpages. The configuration is also far simpler than the alternatives, and it plays really nice with Docker.

**Alternatives considered:**
- Httpd/Apache (Slightly older, slower, and more complex configurations)
- Tomcat (Built for Java applications, not used for static webpages)
- IIS (Entire internet claims it is unusable)

### Self-signed Certificates
I initially considered using a CA-signed certificate to stand out, but quickly realized it was impractical for this project:
- Requires domain registration (overkill when localhost works)
- Adds delay during authorization (iterative runs take much longer)
- Complicates the one command requirement (seemingly unnecessarily)

After considering the complexity of a signed certificate, self-signed seemed like the optimal choice.

### Bash Scripting

Bash scripts were chosen because the automation needed with this setup is simple. The entire workflow is already automated by Docker (dependencies included), and we simply need to automate: 
- Self-signed certificate generation
- Docker image build
- Docker image run

This can easily be done using Bash. Configuration management tools like Ansible or Puppet are rendered unnecessary given the lack of dependencies needed.
