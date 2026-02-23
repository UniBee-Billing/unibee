# Deployment guide

This page describes how to run the UniBee stack from this repository: **Docker Compose** (single host) and **Kubernetes** (example manifests). For UniBee Cloud (hosted SaaS), see [unibee.dev](https://unibee.dev).

## Docker Compose (recommended for local / single-server)

The root [docker-compose.yaml](../../docker-compose.yaml) runs:

| Service | Image | Purpose |
|---------|--------|---------|
| `db` | mysql:8.0.37 | MySQL database |
| `redis` | redis:6 | Redis (sessions/cache) |
| `api` | unibee/api:v1.9.0 | UniBee REST API |
| `licenseApi` | unibee/license-api:v1.0.2-premium | License API (enterprise) |
| `userPortal` | unibee/user-portal:v1.9.0 | User / checkout portal |
| `adminPortal` | unibee/admin-portal:v1.9.0 | Admin portal |
| `nginx` | nginx:1.27.2 | Reverse proxy (entrypoint) |

### Ports (defaults)

| Port (host) | Service | Env override |
|-------------|---------|--------------|
| 80 | Nginx (main entry) | `NGINX_PORT` |
| 443 | Nginx SSL | `NGINX_SSL_PORT` |
| 8081 | Admin portal (direct) | — |
| 8082 | User portal (direct) | — |
| 8083 | License API (direct) | — |
| 8088 | API (direct) | `API_PORT` |
| 3306 | MySQL | `DB_PORT` |
| 6379 | Redis | `REDIS_PORT` |

### Environment variables

Create a `.env` in the repo root to override defaults. Common ones:

| Variable | Default | Description |
|----------|---------|-------------|
| `DB_DATABASE` | unibee | MySQL database name |
| `DB_USER` / `DB_PASSWORD` | unibee / changeme | DB credentials |
| `DB_ROOT_PASSWORD` | changeme | MySQL root password |
| `REDIS_PASSWORD` | changeme | Redis password |
| `UNIBEE_API_URL` | http://127.0.0.1/api | Base URL of the API (used by portals) |
| `UNIBEE_LICENSE` | (empty) | License key for enterprise features |
| `ENV` | prod | Environment (e.g. prod, staging) |

For production, set strong passwords and a correct `UNIBEE_API_URL` (e.g. `https://your-domain.com/api`).

### Commands

```bash
# Start in background
docker compose up -d

# View logs
docker compose logs -f

# Stop
docker compose down

# Stop and remove volumes (resets DB/Redis data)
docker compose down -v
```

### Nginx configuration

The stack mounts `./nginx.conf/` into the Nginx container. If the repo has a single file `nginx.conf` in the project root, ensure the Compose volume matches: either create a directory `nginx.conf/` and place the config file inside it (e.g. `nginx.conf/nginx.conf`), or change the volume in `docker-compose.yaml` to mount the file directly, e.g. `./nginx.conf:/etc/nginx/nginx.conf`.

## Kubernetes

Example manifests are in [kubernetes/](../../kubernetes/). Use them as a starting point; adjust namespaces, secrets, and resource limits for your cluster.

| File | Purpose |
|------|---------|
| `unibee_config.yaml` | ConfigMap for API URL and shared config |
| `unibee_mysql.yaml` | MySQL StatefulSet and Service |
| `unibee_redis.yaml` | Redis Deployment and Service |
| `unibee_api.yaml` | UniBee API Deployment and Service |
| `unibee_admin_portal.yaml` | Admin portal Deployment and Service |
| `unibee_user_portal.yaml` | User portal Deployment and Service |
| `unibee-license-api.yaml` | License API Deployment and Service |
| `unibee_nginx.yaml` | Nginx Config and Service |

Apply in an order that respects dependencies (e.g. config and DB first, then API, then portals, then nginx). Store secrets (DB password, Redis password, license key) in Kubernetes Secrets.

## Health checks

- **API:** The compose file defines a healthcheck for the API service (e.g. `curl -f http://127.0.0.1/health`).
- **MySQL / Redis:** Compose healthchecks are defined for `db` and `redis`; you can enable `depends_on` with `condition: service_healthy` if you want strict startup order.

## Upgrading

To use a newer UniBee version, update the image tags in `docker-compose.yaml` (and in Kubernetes manifests if you use them), e.g.:

- `unibee/api:v1.9.0` → `unibee/api:v1.10.0`
- Same for `unibee/user-portal` and `unibee/admin-portal`.

Then recreate the containers:

```bash
docker compose pull
docker compose up -d
```

Back up the database before major upgrades. For schema migrations, refer to the [unibee-api](https://github.com/UniBee-Billing/unibee-api) or official documentation.
