# Application Architecture Principles

## Document Control

| Field | Value |
|---|---|
| Status | Draft |
| Owner | Application Architecture |
| Review Cycle | Annual |

---

## APP-01: Every Application Must Have an Owner

### Statement

Every application must have a business owner and technical owner.

### Rationale

Ownership is required for accountability, funding, support, risk treatment, and lifecycle decisions.

### Implications

- New applications cannot be approved without named ownership.
- Orphaned applications must be remediated or decommissioned.
- Owners are responsible for inventory accuracy.

### Compliance Expectation

`application-inventory.csv` must include business and technical owner fields.

---

## APP-02: Application Capabilities Must Not Be Duplicated Without Justification

### Statement

New applications should not duplicate existing enterprise capabilities unless justified.

### Rationale

Duplicated capabilities increase cost, operational complexity, inconsistent data, and fragmented customer experience.

### Implications

- Architecture review must check capability overlap.
- Reuse should be considered before build or buy.
- Duplicate capability requires explicit rationale.

### Compliance Expectation

Project proposals must include capability fit assessment.

---

## APP-03: Applications Should Integrate Through Approved Integration Channels

### Statement

Applications should use approved integration mechanisms rather than unmanaged point-to-point connections.

### Rationale

Uncontrolled integrations create hidden dependencies, inconsistent security, and operational fragility.

### Implications

- External-facing APIs should go through API Gateway.
- Service orchestration should use approved middleware or platform.
- Direct access to System of Record should be restricted.

### Compliance Expectation

Integration design must be represented in `integration-inventory.csv`.

---

## APP-04: Applications Must Be Secure by Design

### Statement

Security requirements must be considered during design, not added after development.

### Rationale

Late security remediation is expensive and often incomplete.

### Implications

- Authentication, authorization, audit logging, data protection, and monitoring must be designed early.
- Security review is required for systems processing restricted data.
- Threat modeling should be performed for high-risk applications.

### Compliance Expectation

Architecture review must include security and data classification assessment.

---

## APP-05: Applications Must Be Observable

### Statement

Applications must produce enough telemetry to support monitoring, incident response, and service reliability.

### Rationale

Systems that cannot be observed cannot be operated safely.

### Implications

- Logs, metrics, traces, and health checks should be defined.
- Critical journeys must be monitored.
- Ownership for alert response must be clear.

### Compliance Expectation

High and critical systems must define monitoring and incident ownership.

---

## APP-06: Applications Must Have Lifecycle Status

### Statement

Each application must have a clear lifecycle status.

### Rationale

Lifecycle visibility supports modernization, decommissioning, budget planning, and risk management.

### Implications

- Lifecycle status must be maintained in the application inventory.
- End-of-life technologies must be tracked.
- Decommission plans should exist for retired or redundant systems.

### Compliance Expectation

Inventory must classify applications as Proposed, Active, Modernizing, Sunset, Retired, or Archived.
