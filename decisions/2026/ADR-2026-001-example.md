# ADR-2026-001: Use API Gateway and ESB for Customer Onboarding Integration

## Status

Proposed

## Date

2026-05-18

## Decision Owner

Digital Delivery Team

## Reviewers

- Enterprise Architecture: TBD
- Security Architecture: TBD
- Data Architecture: TBD
- Integration Architecture: TBD
- Infrastructure Architecture: TBD

## Context

A new Customer Onboarding Application is proposed to support customer onboarding through digital channels. The application needs to integrate with enterprise systems including API Gateway, ESB, Core Banking, Fraud Detection, and Data Warehouse.

The design must support:

- controlled API exposure
- secure authentication
- integration governance
- System of Record protection
- auditability
- data classification
- operational monitoring

## Decision

The Customer Onboarding Application will expose and consume APIs through the approved API Gateway. Downstream orchestration to Core Banking, Fraud Detection, and Data Warehouse will be routed through ESB or approved integration patterns.

The application must not directly access Core Banking databases or bypass approved integration controls.

## Options Considered

| Option | Description | Pros | Cons | Risk |
|---|---|---|---|---|
| Option A | Direct integration from onboarding app to Core Banking | Simple initial build | Tight coupling, high security and change risk | High |
| Option B | API Gateway to ESB to Core Banking | Controlled, governed, observable | More integration design effort | Medium |
| Option C | Event-driven onboarding flow | Decoupled, scalable | More complex, may not fit real-time account creation | Medium |

## Rationale

Option B is preferred because it aligns with API and integration standards. It avoids direct System of Record access from the channel layer and supports centralized authentication, throttling, monitoring, and integration governance.

## Consequences

### Positive Consequences

- Stronger control over API exposure
- Better integration visibility
- Reduced direct dependency on Core Banking
- Easier monitoring and governance

### Negative Consequences

- More dependency on API Gateway and ESB availability
- Requires clear ownership between digital, integration, and core teams
- Requires proper API and integration contract documentation

### Neutral / Operational Consequences

- Integration inventory must be updated
- Monitoring and alert ownership must be defined
- Data classification and consent rules must be reviewed

## Risks and Mitigations

| Risk | Impact | Mitigation | Owner |
|---|---|---|---|
| ESB concentration risk | High | Define resilience and monitoring | Middleware Team |
| Missing consent handling | High | Define privacy and retention requirements | Digital Delivery Team |
| Unclear RBAC model | Medium | Define roles, claims, and authorization rules | Security Architecture |

## Related Principles and Standards

| Source | Relevance |
|---|---|
| `principles/integration-principles.md` | Use approved integration channels |
| `standards/api-standards.md` | API Gateway and API governance |
| `standards/authentication-standards.md` | OIDC and authorization expectations |
| `standards/data-classification-standards.md` | Restricted personal data handling |

## Related Artifacts

| Artifact | Path |
|---|---|
| Architecture review | `outputs/reviews/architecture-review-result.md` |
| Diagram | `outputs/diagrams/application-integration-diagram.md` |
| Inventory | `inventories/application-inventory.csv` |
| Integration inventory | `inventories/integration-inventory.csv` |

## Approval

| Role | Name | Decision | Date |
|---|---|---|---|
| Enterprise Architect | TBD | Pending | |
| Security Architect | TBD | Pending | |
| Integration Architect | TBD | Pending | |
| Data Owner | TBD | Pending | |
