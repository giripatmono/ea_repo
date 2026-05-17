# Application Architecture Standards

## Document Control

| Field | Value |
|---|---|
| Status | Draft |
| Owner | Application Architecture |
| Review Cycle | Semi-annual |

## 1. Mandatory Application Metadata

Every application must be recorded in `inventories/application-inventory.csv` with:

| Field | Required |
|---|---|
| application_id | Yes |
| application_name | Yes |
| ea_domain | Yes |
| business_owner | Yes |
| technical_owner | Yes |
| users | Yes |
| data_classification | Yes |
| deployment_model | Yes |
| criticality | Yes |
| authentication | Yes |
| technology | Yes |
| status | Yes |
| lifecycle_stage | Yes |

## 2. EA Domain Classification

Allowed EA domains:

| Domain | Meaning |
|---|---|
| Touchpoint Architecture | User-facing channels and interaction systems |
| Integration Architecture | API, middleware, messaging, file exchange, orchestration |
| System of Record Architecture | Authoritative transaction or master data systems |
| Data / Analytics Architecture | Reporting, warehouse, analytics, data platforms |
| Security Architecture | Identity, fraud, monitoring, security enforcement |
| Infrastructure Architecture | Hosting, platform, runtime, network, storage |

## 3. Criticality Classification

| Criticality | Meaning |
|---|---|
| Critical | Failure may severely disrupt core business, regulatory obligations, or customer access |
| High | Failure has significant operational or customer impact |
| Medium | Failure affects internal process or limited business scope |
| Low | Failure has limited impact |

## 4. Architecture Review Triggers

Architecture review is required when:

- new application is introduced
- existing application changes critical integration path
- system processes confidential or restricted data
- system connects to System of Record
- system introduces new technology
- system is externally exposed
- system changes authentication or authorization model
- system becomes high or critical

## 5. Application Design Requirements

Every new or materially changed application must define:

- business capability
- owner
- users
- data classification
- authentication pattern
- authorization model
- integrations
- deployment model
- monitoring approach
- availability requirement
- recovery expectation
- lifecycle expectation

## 6. Application Lifecycle Status

Allowed lifecycle stages:

| Stage | Meaning |
|---|---|
| Plan | Planned but not implemented |
| Build | Under development |
| Run | Active production system |
| Modernize | Active system with modernization plan |
| Sunset | Planned for retirement |
| Retired | No longer active |
| Archived | Retained only for historical reference |

## 7. Prohibited Patterns

Unless approved by exception:

- production application without named owner
- unmanaged direct database integration
- local user store for enterprise SSO-capable applications
- critical application without monitoring
- application using unsupported technology without remediation plan
- application processing restricted data without security review

## 8. Exception Requirements

Exceptions must document:

- violated standard
- justification
- risk impact
- compensating control
- target remediation date
- approving authority
