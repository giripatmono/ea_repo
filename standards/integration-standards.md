# Integration Standards

## Document Control

| Field | Value |
|---|---|
| Status | Draft |
| Owner | Integration Architecture |
| Review Cycle | Semi-annual |

## 1. Scope

This standard governs integration between applications, platforms, data stores, external systems, and enterprise services.

## 2. Approved Integration Patterns

| Pattern | Use When | Notes |
|---|---|---|
| API / REST | Real-time request-response integration | Use API Gateway where exposed to channels or partners |
| Event Streaming | Asynchronous event propagation | Use approved broker and schema management |
| Messaging / Queue | Decoupled reliable processing | Use for workload buffering and resilience |
| Managed File Transfer | Batch or regulated file exchange | Use secure transport and reconciliation |
| ETL / ELT | Data movement for analytics | Must follow data classification and retention rules |
| Service Orchestration | Process coordination across systems | Avoid business logic duplication |

## 3. Integration Inventory

Every integration must be recorded in `inventories/integration-inventory.csv`.

Required fields:

- integration_id
- source_application
- target_application
- integration_type
- protocol
- data_subject
- frequency
- criticality
- owner
- status

## 4. Integration Ownership

Every integration must have:

- business owner or process owner
- technical owner
- support owner
- escalation path for incidents

## 5. Direct System of Record Access

Direct access to System of Record must be restricted.

Allowed only when:

- approved by architecture review
- access pattern is secure
- data ownership is clear
- performance impact is understood
- audit logging is defined

## 6. Resilience Requirements

Critical real-time integrations must define:

- timeout behavior
- retry policy
- idempotency strategy
- error handling
- fallback behavior
- monitoring
- alert ownership

## 7. Data Movement

Integration design must state:

- data classification
- whether personal data is involved
- required fields
- data minimization rationale
- retention or persistence behavior
- masking or encryption controls where needed

## 8. Change Management

Breaking integration changes require:

- consumer impact analysis
- versioning or compatibility strategy
- migration window
- rollback plan
- communication plan

## 9. Prohibited Patterns

Unless approved by exception:

- undocumented point-to-point integration
- shared database integration between applications
- production integration without owner
- high or critical integration without monitoring
- batch file exchange without reconciliation
- sensitive data movement without classification
