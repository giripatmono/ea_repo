# Integration Architecture Principles

## Document Control

| Field | Value |
|---|---|
| Status | Draft |
| Owner | Integration Architecture |
| Review Cycle | Annual |

---

## INT-01: Integration Must Be Explicitly Designed

### Statement

Application integration must be intentionally designed, documented, and governed.

### Rationale

Hidden integrations create operational, security, and change-management risk.

### Implications

- All integrations must be recorded in the integration inventory.
- Integration ownership must be defined.
- Critical integrations must have resilience and monitoring requirements.

### Compliance Expectation

Every integration must declare source, target, protocol, data, frequency, criticality, and owner.

---

## INT-02: Use API Gateway for Managed API Exposure

### Statement

APIs exposed to channels, partners, or external consumers must use an approved API Gateway.

### Rationale

API Gateway provides central control for authentication, authorization, throttling, monitoring, and lifecycle management.

### Implications

- Direct exposure of backend services should be avoided.
- APIs must be registered and versioned.
- Consumers must be onboarded formally.

### Compliance Expectation

Customer-facing and partner-facing APIs must go through the approved gateway.

---

## INT-03: Avoid Unmanaged Point-to-Point Integration

### Statement

Point-to-point integration must be avoided unless explicitly approved.

### Rationale

Point-to-point connections increase coupling and make dependency management difficult.

### Implications

- Integration patterns should be selected based on criticality, latency, volume, and reliability needs.
- Middleware, event broker, API Gateway, or managed file exchange should be preferred.
- Exceptions must be documented.

### Compliance Expectation

Architecture review must identify unmanaged direct connections.

---

## INT-04: Integration Contracts Must Be Stable and Versioned

### Statement

Integration contracts must be documented, versioned, and managed through change control.

### Rationale

Changing contracts without governance can break consuming systems.

### Implications

- API contracts should use OpenAPI or equivalent.
- Event schemas should be versioned.
- Breaking changes must follow migration rules.

### Compliance Expectation

High and critical integrations must have documented contracts.

---

## INT-05: Critical Integrations Must Be Resilient

### Statement

Critical integrations must include resilience patterns appropriate to the integration type.

### Rationale

Integration failure can cascade across enterprise systems.

### Implications

- Define timeout, retry, circuit breaker, idempotency, and fallback behavior.
- Monitor integration health.
- Avoid infinite retries and duplicate transactions.

### Compliance Expectation

Critical real-time integrations must include failure-handling design.
