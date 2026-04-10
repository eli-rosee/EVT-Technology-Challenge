# EVT Technology Challenge 2026

## Quick Start
```bash
cd /scripts 
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
