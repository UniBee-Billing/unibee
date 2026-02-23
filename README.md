<div align="center">
  <img width="80px" src="/docs/logo.png" alt="UniBee logo" />
  <h3>UniBee</h3>
  <p>Open-source universal billing for SaaS</p>
  <div>
    <a href="https://www.conventionalcommits.org/en/v1.0.0/"><img src="https://img.shields.io/github/actions/workflow/status/UniBee-Billing/unibee/commit-message-linter.yml?style=flat&label=Conventional%20Commits" alt="Conventional Commits" /></a>
    <a href="https://docs.unibee.dev/"><img src="https://img.shields.io/badge/Documentation-%23F8CD0F?style=flat&logo=readthedocs&logoColor=black" alt="Documentation" /></a>
    <a href="https://www.linkedin.com/company/unibee-billing/"><img src="https://img.shields.io/badge/%40unibee--billing-%230A66C2?style=flat&logo=linkedin" alt="LinkedIn" /></a>
    <a href="https://x.com/UniBee_Billing"><img src="https://img.shields.io/badge/%40UniBee__Billing-black?style=flat&logo=x" alt="X" /></a>
    <a href="https://unibee.dev/"><img src="https://img.shields.io/website?url=https%3A%2F%2Funibee.dev%2Fwhy-unibee%2F&up_message=active&down_message=offline&style=flat&label=Website" alt="Website" /></a>
    <a href="https://t.me/+KC_L87uFTl82NDI0"><img src="https://img.shields.io/badge/-community-%2326A5E4?style=flat&logo=telegram&logoColor=white" alt="Community" /></a>
    <a href="https://t.me/+xncwy-uZFE1lMTI0"><img src="https://img.shields.io/badge/-official%20channel-%2326A5E4?style=flat&logo=telegram&logoColor=white" alt="Official channel" /></a>
  </div>
</div>

---

## Overview

**UniBee** is open-source billing software built for SaaS. It helps you manage subscriptions, invoices, payments, and usage-based billing in one place. You can run it yourself (community or enterprise) or use [UniBee Cloud](https://unibee.dev) as a managed service.

UniBee is a practical alternative to closed-source platforms like Recurly, Chargebee, and Paddle—with transparent pricing and full control over your stack.

## Core capabilities

| Area | Description |
|------|-------------|
| **Subscriptions** | Create, update, cancel, and renew subscriptions; configurable billing cycles and trials. |
| **Invoicing** | Automatic invoice generation, PDFs, and delivery; credit notes and refunds. |
| **Products & plans** | Define products, subscription and one-time plans, add-ons, and pricing. |
| **Billable metrics** | Usage-based and limit-based metrics with reporting and overage handling. |
| **Payments** | Multiple gateways (e.g. Stripe, PayPal, wire transfer, crypto); payment methods and refunds. |
| **Webhooks** | Real-time events for subscriptions, payments, and invoices. |
| **User & admin** | User/customer management; admin portal with roles and permissions. |
| **Discounts** | Discount codes and batch codes; promo credits. |
| **Reports & export** | Reports and data export for analytics and accounting. |

## Main use cases

- **SaaS subscription billing** — Recurring plans, trials, upgrades/downgrades, proration.
- **Usage-based pricing** — Metered and limit-based metrics with flexible pricing.
- **Self-serve checkout** — Hosted checkout and customer portal, or full API integration.
- **Multi-currency & tax** — Multiple currencies and VAT/tax handling (e.g. TaxJar).
- **Developer integration** — REST API and webhooks to plug billing into your app.

## Documentation

| Where | What |
|-------|------|
| **In this repo** | [docs/](docs/README.md) — Quick start, deployment (Docker & Kubernetes), and links. |
| **Full docs & API** | [docs.unibee.dev](https://docs.unibee.dev/) — Concepts, guides, API reference (OpenAPI), integration workflow. |

New to UniBee? Start with the [Integration Workflow Guide](https://docs.unibee.dev/documentation/business-integration/integration-workflow) on the official docs, then use this repo to run your own instance.

## API and supported integrations (SDKs)

UniBee exposes a **REST API** that you can call from **any language** with a standard HTTP client. There are no separate, language-specific SDK packages; integration is via the REST API and optional hosted UI.

| Integration | Description |
|-------------|-------------|
| **REST API** | Full billing API. Use with any HTTP client (cURL, fetch, axios, requests, etc.). [API Reference (OpenAPI)](https://docs.unibee.dev/api-reference). |
| **Hosted checkout & portal** | Embed or link to UniBee-hosted checkout and customer portal with minimal code. |
| **Webhooks** | Subscribe to events (subscription, payment, invoice, etc.) for server-to-server sync. |

**Supported “SDK” languages:** Any language that can send HTTP requests (e.g. JavaScript/TypeScript, Python, Go, Java, C#, Ruby, PHP). Use your **API key** in the `Authorization: Bearer <key>` header. See [Make Billing API calls](https://docs.unibee.dev/documentation/business-integration/billing-api-call) and the [API Reference](https://docs.unibee.dev/api-reference) for request/response formats and examples.

## Getting started (standalone deployment)

This repository runs the full UniBee stack with Docker Compose: API, Admin Portal, User Portal, MySQL, Redis, and Nginx.

### Prerequisites

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/) (v2: `docker compose`; v1: `docker-compose`)
- [Git](https://git-scm.com/downloads)

### Deploy with Docker Compose

```bash
# Clone the repository
git clone https://github.com/UniBee-Billing/unibee
cd unibee

# Start all services
docker compose up -d
# Or with Compose V1: docker-compose up -d

# Wait until containers are healthy, then open:
# http://localhost — Admin Portal (default)
```

Default ports: `80` (Nginx), `8081` (admin portal), `8082` (user portal), `8088` (API), `8083` (license API), `3306` (MySQL), `6379` (Redis). See [docs/guides/deployment.md](docs/guides/deployment.md) for details and Kubernetes.

### Development

To run and contribute to individual services from source:

- [unibee-api](https://github.com/UniBee-Billing/unibee-api) — Backend API
- [unibee-admin-portal](https://github.com/UniBee-Billing/unibee-admin-portal) — Admin UI
- [unibee-user-portal](https://github.com/UniBee-Billing/unibee-user-portal) — User/checkout portal

Follow each repo’s README for local setup.

## UniBee Cloud (hosted SaaS)

For a fully managed option, see [UniBee Cloud](https://unibee.dev). It is a paid service; this repository is for self-hosted deployment.

## Repository structure

| Path | Purpose |
|------|---------|
| `docker-compose.yaml` | Standalone stack: API, portals, MySQL, Redis, Nginx. |
| `kubernetes/` | Example Kubernetes manifests for the same stack. |
| `nginx.conf/` | Nginx configuration used by the Compose stack. |
| `mysql/` | DB init scripts for local/K8s. |
| `docs/` | In-repo documentation (guides, quick start, deployment). |

## Contributing

Contributions are welcome. Open issues and PRs in this repo or in [unibee-api](https://github.com/UniBee-Billing/unibee-api) and the portal repos. For new features, document usage in the README or at [docs.unibee.dev](https://docs.unibee.dev/) where appropriate.

## Community

UniBee was born from real-world SaaS billing challenges. We use open-source principles to keep billing flexible and under your control.

- [Telegram community](https://t.me/+KC_L87uFTl82NDI0)
- [Telegram official channel](https://t.me/+xncwy-uZFE1lMTI0)

## License

This project is licensed under the **AGPLv3** License. See the [LICENSE](LICENSE) file for details.

## Contact

- **Support:** [help@unibee.dev](mailto:help@unibee.dev)
- **Website:** [unibee.dev](https://unibee.dev)
