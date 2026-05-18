# Application Portfolio Report

**Status:** Draft - pending Enterprise Architect review  
**Generated:** 2026-05-18 07:45 Europe/Berlin  
**Input sources:** `inventories/application-inventory.csv`, `inventories/technology-inventory.csv`, `inventories/data-inventory.csv`, `inventories/risk-register.csv`

## 1. Executive Summary

This draft report summarizes the current application portfolio inventory across application, technology, data, and risk sources. The portfolio contains 8 applications: 7 active and 1 proposed. The highest concentration of applications is in Touchpoint Architecture, followed by Integration Architecture.

Key facts:

- 2 applications are marked Critical: ESB and Core Banking.
- 6 applications are marked High criticality.
- All application records include business owner and technical owner fields.
- All application records involve Restricted or Confidential data classifications.
- Technology inventory lifecycle data is incomplete: all technology versions and EOL dates are recorded as `TBD`.
- The risk register contains 5 open risks, including ESB concentration risk, technology lifecycle uncertainty, authentication exceptions, incomplete classification, and onboarding privacy gaps.

Primary recommendations are to close lifecycle data gaps, validate authentication exceptions, complete privacy and retention controls for the proposed onboarding application, and define resilience planning for critical integration dependencies.

## 2. Application Inventory Overview

| Metric | Count / Observation |
|---|---|
| Total applications | 8 |
| Active applications | 7 |
| Proposed applications | 1 |
| Critical applications | 2: ESB; Core Banking |
| High criticality applications | 6 |
| EA domains represented | 5 |
| Applications with business owner populated | 8 |
| Applications with technical owner populated | 8 |
| Applications with Restricted data classification | 7 |
| Applications with Confidential data classification | 1 |
| Applications using centralized OIDC or SSO pattern | 4: Mobile Banking; Internet Banking; API Gateway; Customer Onboarding App |
| Applications using service accounts | 2: ESB; Fraud Detection |
| Applications using internal auth or AD/LDAP | 2: Core Banking; Data Warehouse |
| On-prem applications | 5 |
| Cloud applications | 2 |
| Hybrid applications | 1 |
| Technology lifecycle completeness | Versions and EOL dates are `TBD` for all listed technologies |
| Open risks in risk register | 5 |

## 3. EA Domain Classification

| EA Domain | Applications | Count |
|---|---|---|
| Touchpoint Architecture | Mobile Banking; Internet Banking; Customer Onboarding App | 3 |
| Integration Architecture | API Gateway; ESB | 2 |
| System of Record Architecture | Core Banking | 1 |
| Data / Analytics Architecture | Data Warehouse | 1 |
| Security Architecture | Fraud Detection | 1 |

## 4. Criticality and Business Impact

| Criticality | Applications | Risk Observation |
|---|---|---|
| Critical | ESB; Core Banking | ESB concentration risk is open. Core Banking is the authoritative account and transaction system and supports customer, account, and transaction data. |
| High | Mobile Banking; Internet Banking; API Gateway; Data Warehouse; Fraud Detection; Customer Onboarding App | High criticality spans customer touchpoints, integration access, analytics, fraud screening, and proposed onboarding capabilities. Authentication, data protection, and lifecycle controls should be validated before changes or expansion. |

## 5. Data Sensitivity

| Classification | Applications | Required Attention |
|---|---|---|
| Restricted - Customer PII | Mobile Banking; Internet Banking; Customer Onboarding App | Validate privacy, consent, access, and retention controls. The proposed onboarding app has an open privacy and retention risk. |
| Confidential - Token Metadata | API Gateway | Confirm token metadata handling, audit retention, and access controls align with identity and security architecture requirements. |
| Restricted - Transactional Data | ESB | Ensure resilience, monitoring, failover, and privileged service account controls are defined for critical transaction flows. |
| Restricted - Customer and Financial Data | Core Banking | Maintain strict system-of-record governance, internal authentication controls, and data ownership alignment. |
| Restricted - Aggregated Customer Data | Data Warehouse | Confirm aggregated data handling, AD/LDAP access governance, and reporting consumer access reviews. |
| Restricted - Risk Data | Fraud Detection | Validate service account governance, risk score lineage, and downstream use by fraud operations and integration consumers. |

Data inventory facts:

| Data Asset | Classification | Contains Personal Data | Consumers |
|---|---|---|---|
| Customer Profile | Restricted | Yes | Mobile Banking; Internet Banking; Customer Onboarding App |
| Account Data | Restricted | Yes | Mobile Banking; Internet Banking; Data Warehouse |
| Transaction Data | Restricted | Yes | ESB; Fraud Detection; Data Warehouse |
| API Token Metadata | Confidential | May include user identifiers | API Gateway; Security Monitoring |
| Fraud Risk Score | Restricted | Yes | ESB; Fraud Operations |
| Portfolio Reporting Data | Confidential | Aggregated | Analytics Users; Management Reporting |

## 6. Authentication and Access Pattern

| Authentication Pattern | Applications | Observation |
|---|---|---|
| SSO/OIDC | Mobile Banking; Internet Banking | Centralized customer-facing authentication pattern is present for two active touchpoint applications. |
| OIDC Token Validation | API Gateway | Gateway validates tokens; depends on identity platform and token metadata controls. |
| OIDC | Customer Onboarding App | Proposed application uses OIDC; privacy, consent, and retention controls are not yet defined in the risk register. |
| Service Account | ESB; Fraud Detection | Requires service account ownership, credential rotation, least privilege, and monitoring controls. |
| Internal Auth | Core Banking | Potential exception to centralized authentication; should be assessed against RISK-003. |
| AD/LDAP | Data Warehouse | Requires access review, group ownership, and reporting consumer governance. |

## 7. Technology and Deployment View

| Technology / Deployment | Applications | Observation |
|---|---|---|
| Mobile App + API / Hybrid | Mobile Banking | Active high-criticality customer touchpoint using Restricted customer PII. |
| Web Application / On-prem | Internet Banking | Active high-criticality customer touchpoint using Restricted customer PII. |
| API Gateway / On-prem | API Gateway | Active high-criticality integration control point; technology lifecycle version and EOL are `TBD`. |
| ESB / Middleware / On-prem | ESB | Critical central integration layer; concentration risk is open. Technology lifecycle version and EOL are `TBD`. |
| Core Banking Platform / On-prem | Core Banking | Critical system of record. Technology lifecycle version and EOL are `TBD`. |
| Data Warehouse / Cloud | Data Warehouse | Active high-criticality analytics platform. Technology lifecycle version and EOL are `TBD`. |
| Fraud Engine / On-prem | Fraud Detection | Active high-criticality fraud screening platform. Technology lifecycle version and EOL are `TBD`. |
| Web/Mobile / Cloud | Customer Onboarding App | Proposed high-criticality application; privacy, consent, and retention requirements remain open. |
| OIDC Provider / Hybrid | Identity capability used by OIDC/SSO patterns | Listed as active and critical in technology inventory; no direct application row maps to it as an application. Version and EOL are `TBD`. |

Technology lifecycle facts:

| Technology | Hosting Model | Owner | Lifecycle Status | EOL Date | Criticality |
|---|---|---|---|---|---|
| API Gateway | On-prem | API Platform Team | Active | TBD | High |
| ESB / Middleware | On-prem | Middleware Team | Active | TBD | Critical |
| Core Banking Platform | On-prem | Core Banking Team | Active | TBD | Critical |
| Data Warehouse | Cloud | Data Platform Team | Active | TBD | High |
| OIDC Provider | Hybrid | Security Architecture | Active | TBD | Critical |
| Fraud Engine | On-prem | Fraud Platform Team | Active | TBD | High |

## 8. Architecture Risks

| Risk | Level | Related Application | Recommendation |
|---|---|---|---|
| ESB concentration risk | High | ESB | Define resilience monitoring and failover plan; validate recovery objectives for critical transaction flows. |
| Incomplete data classification | Medium | Portfolio-wide | Complete application and data inventory classification review; confirm classifications align between application and data inventories. |
| Local authentication exception | High | Core Banking; potentially other legacy applications not explicitly identified | Create migration or exception plan; confirm whether Internal Auth and AD/LDAP patterns are approved exceptions. |
| Technology lifecycle uncertainty | High | API Gateway; ESB; Core Banking; Data Warehouse; OIDC Provider; Fraud Detection | Update technology versions, EOL dates, and remediation roadmap. |
| Proposed onboarding app privacy gap | High | Customer Onboarding App | Define privacy data flow, consent handling, retention controls, and data owner approval before production approval. |

## 9. Modernization Opportunities

| Opportunity | Candidate Applications | Rationale |
|---|---|---|
| Complete technology lifecycle baseline | API Gateway; ESB; Core Banking; Data Warehouse; OIDC Provider; Fraud Detection | All listed technologies have `TBD` version and EOL data, limiting lifecycle planning and risk prioritization. |
| Reduce integration concentration risk | ESB; API Gateway | ESB is a critical central dependency; resilience and failover planning should be prioritized. |
| Standardize authentication governance | Core Banking; Data Warehouse; ESB; Fraud Detection | Internal Auth, AD/LDAP, and service account patterns require explicit exception handling, ownership, and access reviews. |
| Strengthen privacy-by-design for onboarding | Customer Onboarding App; Mobile Banking; Internet Banking | Customer onboarding processes use Restricted customer PII and require confirmed consent, retention, and data flow controls. |
| Validate analytics and reporting access governance | Data Warehouse | Aggregated customer and reporting data requires clear consumer access review and data owner accountability. |

## 10. Recommendations

| Priority | Recommendation | Owner | Expected Benefit |
|---|---|---|---|
| High | Update technology inventory with current versions, EOL dates, and remediation roadmap. | Infrastructure Architecture | Improves lifecycle risk visibility and modernization planning. |
| High | Define ESB resilience monitoring, failover plan, and recovery validation. | Middleware Team | Reduces concentration risk for critical transaction flows. |
| High | Create authentication exception register for Internal Auth, AD/LDAP, and service account patterns. | Security Architecture | Improves access governance and supports centralized authentication roadmap. |
| High | Complete privacy, consent, retention, and data-flow definition for Customer Onboarding App. | Digital Delivery Team | Reduces privacy and compliance risk before proposed application approval. |
| Medium | Reconcile application data classifications against data asset classifications and consumers. | Data Governance | Improves consistency of data sensitivity controls and reporting confidence. |
| Medium | Confirm application, data, technology, and risk ownership review cadence. | Enterprise Architecture | Maintains accountability and reduces stale inventory risk. |

## 11. Open Questions

- Which specific applications are in scope for the local authentication exception risk beyond the patterns visible in the inventory?
- What are the current technology versions and confirmed EOL dates for all listed technology components?
- What recovery time and recovery point objectives apply to ESB, Core Banking, API Gateway, and Fraud Detection?
- Are service account rotation, vaulting, and monitoring controls documented for ESB and Fraud Detection?
- What consent, retention, and privacy data-flow requirements apply to the proposed Customer Onboarding App?
- Are Security Monitoring, Fraud Operations, Analytics Users, and Management Reporting represented in the application portfolio or managed as external consumer groups?
- What review cadence should be used for application ownership, data classification, and lifecycle updates?

## 12. Assumptions

- This report is a draft until reviewed and approved by an Enterprise Architect.
- Counts and observations are based only on the four provided inventory files.
- `TBD` values are treated as known gaps, not as missing source fields.
- Application names are used as listed in the inventory; no additional applications were inferred.
- Recommendations are based on recorded inventory fields and open risks; no secrets or customer records were reviewed or included.
