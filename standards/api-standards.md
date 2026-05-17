# API Standards

## Document Control

| Field | Value |
|---|---|
| Status | Draft |
| Owner | Integration Architecture |
| Review Cycle | Semi-annual |

## 1. Scope

This standard applies to APIs exposed between enterprise applications, digital channels, partners, and external consumers.

## 2. API Exposure

| Requirement | Rule |
|---|---|
| Customer-facing APIs | Must go through approved API Gateway |
| Partner-facing APIs | Must go through approved API Gateway |
| Internal APIs | Should use approved service discovery or gateway where applicable |
| Backend service exposure | Must not be directly exposed externally |

## 3. API Authentication

| API Type | Required Authentication |
|---|---|
| Customer-facing | OAuth2 / OIDC or approved equivalent |
| Partner-facing | OAuth2 client credentials, mTLS, signed request, or approved equivalent |
| Internal service | Service account, token-based auth, or approved platform identity |
| Public unauthenticated | Requires explicit approval |

## 4. API Design

APIs should follow:

- resource-oriented naming where applicable
- consistent HTTP method usage
- JSON payloads unless another format is justified
- explicit request and response schema
- clear error response model
- pagination for list endpoints
- idempotency for retry-prone operations
- versioning for breaking changes

## 5. API Versioning

Recommended version format:

```text
/api/v1/<resource>
/api/v2/<resource>
```

Breaking changes require:

- new version
- migration notice
- consumer impact assessment
- retirement plan for old version

## 6. Error Handling

Standard error response should include:

| Field | Description |
|---|---|
| code | Machine-readable error code |
| message | Human-readable message |
| correlation_id | Trace identifier |
| details | Optional validation details |

Example:

```json
{
  "code": "CUSTOMER_NOT_FOUND",
  "message": "Customer record was not found.",
  "correlation_id": "trace-123",
  "details": []
}
```

## 7. Rate Limiting and Throttling

APIs must define:

- consumer identity
- rate limit
- burst limit where applicable
- throttling behavior
- error response for throttling
- escalation process for limit increase

## 8. Observability

APIs must capture:

- request count
- error rate
- latency
- consumer identity where appropriate
- correlation ID
- upstream and downstream dependency health

## 9. Documentation

API documentation should include:

- purpose
- owner
- endpoint
- authentication
- request schema
- response schema
- error codes
- rate limits
- lifecycle status
- consumer onboarding process

## 10. Prohibited Patterns

Unless approved by exception:

- undocumented API
- direct external access to backend services
- API without owner
- API without authentication where sensitive data is involved
- breaking change without versioning
- API exposing unnecessary sensitive data
