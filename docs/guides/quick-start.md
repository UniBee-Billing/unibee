# Quick start: run UniBee and do a basic integration

This guide uses **only** this GitHub repository and the official documentation so that a new developer can run UniBee and complete a basic integration.

## 1. Run UniBee locally

### Prerequisites

- [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/)
- Git

### Steps

```bash
git clone https://github.com/UniBee-Billing/unibee
cd unibee
docker compose up -d
# Or: docker-compose up -d
```

Wait until all containers are up (MySQL, Redis, API, admin portal, user portal, nginx). Then open:

- **http://localhost** — Admin Portal (main entry for setup)

On first use you will register an admin account (owner) and configure your merchant.

### Optional: run in foreground

```bash
docker compose up
```

Leave the terminal open; logs will stream. Use `Ctrl+C` to stop.

## 2. Get your API key

1. In the Admin Portal (http://localhost), sign in.
2. Go to **Merchant / Profile** (or equivalent) and find **API Key** (or generate one).
3. Copy the key; you will use it as a Bearer token for the REST API.

Details: [docs.unibee.dev](https://docs.unibee.dev/) — look for “API key” or “Generate New APIKey” in the API reference.

## 3. Basic integration path

Follow the official **[Integration Workflow Guide](https://docs.unibee.dev/documentation/business-integration/integration-workflow)**. It typically covers:

1. **Sandbox / testing** — Use test mode and test cards so you don’t charge real cards.
2. **Webhooks** — Register a webhook endpoint so your backend gets subscription and payment events.
3. **Checkout** — Use hosted checkout or API to create subscriptions.
4. **Customer portal** — Let users manage subscriptions and payment methods via the hosted portal or API.

### Example: call the API

With your API key, you can call any endpoint with a standard HTTP client. Example (conceptual):

```bash
curl -X GET "http://localhost/api/merchant/profile" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

Replace `YOUR_API_KEY` and the base URL (e.g. `https://api.unibee.dev` for production). Exact paths and request/response formats are in the [API Reference](https://docs.unibee.dev/api-reference).

**Other languages:** Use the same `Authorization: Bearer YOUR_API_KEY` header with your language’s HTTP client (e.g. Python `requests`, Node `fetch`/`axios`, Go `http.Client`, etc.). No official SDKs are required; the REST API works from any language.

## 4. Next steps

- **Products & plans:** [Products and plans](https://docs.unibee.dev/documentation/product-and-plan/what-is-product-and-plan) on docs.unibee.dev.
- **Checkout and portal:** [Checkout purchases](https://docs.unibee.dev/documentation/business-integration/checkout-purchases), [Customer portal](https://docs.unibee.dev/documentation/business-integration/customer-portal-after-purchases).
- **Webhooks:** [UniBee webhooks](https://docs.unibee.dev/documentation/webhooks/webhooks) and [Webhook events](https://docs.unibee.dev/documentation/webhooks/webhook-events).

For deployment on servers or Kubernetes, see [Deployment](deployment.md).
