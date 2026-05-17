# Application Portfolio Report

**Status:** Draft — requires review and approval by an Enterprise Architect.

**Source inputs:** `inventories/application-inventory.csv`, `inventories/technology-inventory.csv`, `inventories/data-inventory.csv`, `inventories/risk-register.csv`.

## 1. Executive Summary

This draft report summarizes 8 applications across 5 EA domains using the provided application, technology, data, and risk inventories. The portfolio is dominated by high or critical banking, integration, data, and security capabilities. All application records include named business and technical ownership, deployment model, criticality, authentication pattern, data classification, status, and lifecycle stage.

Key attention areas are technology lifecycle uncertainty, ESB concentration risk, authentication exceptions for service-account/internal-auth patterns, and privacy controls for the proposed Customer Onboarding App. No secrets or customer data are included in this report.

## 2. Application Inventory Overview

| Metric | Count / Observation |
|---|---|
| Total applications | 8 |
| Active applications | 7 |
| Proposed applications | 1 |
| Critical applications | 2 |
| High criticality applications | 6 |
| EA domains represented | 5 |
| Restricted data classifications in application inventory | 7 |
| Cloud or hybrid deployments | 3 |
| Open risks | 5 |
| Technology EOL dates recorded as TBD | 6 of 6 technologies |

## 3. EA Domain Classification

| EA Domain | Applications | Count |
|---|---|---|
| Data / Analytics Architecture | Data Warehouse | 1 |
| Integration Architecture | API Gateway, ESB | 2 |
| Security Architecture | Fraud Detection | 1 |
| System of Record Architecture | Core Banking | 1 |
| Touchpoint Architecture | Mobile Banking, Internet Banking, Customer Onboarding App | 3 |

## 4. Criticality and Business Impact

| Criticality | Applications | Risk Observation |
|---|---|---|
| Critical | ESB, Core Banking | Direct business impact if unavailable; resilience, monitoring, and recovery evidence should be maintained. |
| High | Mobile Banking, Internet Banking, API Gateway, Data Warehouse, Fraud Detection, Customer Onboarding App | Important customer, analytics, security, or channel capability; service objectives and support model should be confirmed. |

## 5. Data Sensitivity

| Classification | Applications | Required Attention |
|---|---|---|
| Confidential - Token Metadata | API Gateway | Confirm protection for metadata, aggregation, and reporting access; validate audit and monitoring requirements. |
| Restricted - Aggregated Customer Data | Data Warehouse | Maintain privacy controls, retention alignment, access controls, and auditability; confirm data-flow evidence for proposed or changed applications. |
| Restricted - Customer PII | Mobile Banking, Internet Banking, Customer Onboarding App | Maintain privacy controls, retention alignment, access controls, and auditability; confirm data-flow evidence for proposed or changed applications. |
| Restricted - Customer and Financial Data | Core Banking | Maintain privacy controls, retention alignment, access controls, and auditability; confirm data-flow evidence for proposed or changed applications. |
| Restricted - Risk Data | Fraud Detection | Maintain privacy controls, retention alignment, access controls, and auditability; confirm data-flow evidence for proposed or changed applications. |
| Restricted - Transactional Data | ESB | Maintain privacy controls, retention alignment, access controls, and auditability; confirm data-flow evidence for proposed or changed applications. |

Related data inventory facts: Restricted data assets include Customer Profile, Account Data, Transaction Data, and Fraud Risk Score. Confidential data assets include API Token Metadata and Portfolio Reporting Data. Retention is recorded as `Per policy`; exact retention periods are not provided.

## 6. Authentication and Access Pattern

| Authentication Pattern | Applications | Observation |
|---|---|---|
| AD/LDAP | Data Warehouse | Aligned to centralized identity or token validation pattern based on provided inventory. |
| Internal Auth | Core Banking | Requires access review, least-privilege validation, credential rotation, and exception/migration plan where centralized identity is expected. |
| OIDC | Customer Onboarding App | Aligned to centralized identity or token validation pattern based on provided inventory. |
| OIDC Token Validation | API Gateway | Aligned to centralized identity or token validation pattern based on provided inventory. |
| SSO/OIDC | Mobile Banking, Internet Banking | Aligned to centralized identity or token validation pattern based on provided inventory. |
| Service Account | ESB, Fraud Detection | Requires access review, least-privilege validation, credential rotation, and exception/migration plan where centralized identity is expected. |

## 7. Technology and Deployment View

| Technology / Deployment | Applications | Observation |
|---|---|---|
| Deployment: Cloud | Data Warehouse, Customer Onboarding App | Deployment model is recorded; environment, DR, and operational controls are not detailed in the inventory. |
| Deployment: Hybrid | Mobile Banking | Deployment model is recorded; environment, DR, and operational controls are not detailed in the inventory. |
| Deployment: On-prem | Internet Banking, API Gateway, ESB, Core Banking, Fraud Detection | Deployment model is recorded; environment, DR, and operational controls are not detailed in the inventory. |
| Technology: API Gateway | API Gateway | Technology inventory record found. Lifecycle status: Active; EOL date: TBD. |
| Technology: Core Banking Platform | Core Banking | Technology inventory record found. Lifecycle status: Active; EOL date: TBD. |
| Technology: Data Warehouse | Data Warehouse | Technology inventory record found. Lifecycle status: Active; EOL date: TBD. |
| Technology: ESB / Middleware | ESB | Technology inventory record found. Lifecycle status: Active; EOL date: TBD. |
| Technology: Fraud Engine | Fraud Detection | Technology inventory record found. Lifecycle status: Active; EOL date: TBD. |
| Technology: Mobile App + API | Mobile Banking | No matching technology inventory record found. |
| Technology: Web Application | Internet Banking | No matching technology inventory record found. |
| Technology: Web/Mobile | Customer Onboarding App | No matching technology inventory record found. |

Technology lifecycle gap: all technology inventory records list `version` and `eol_date` as `TBD`, limiting lifecycle risk assessment and modernization prioritization.

## 8. Architecture Risks

| Risk | Level | Related Application | Recommendation |
|---|---|---|---|
| ESB concentration risk | High | ESB | Define resilience monitoring and failover plan |
| Incomplete data classification | Medium | Portfolio-wide | Complete application and data inventory classification |
| Local authentication exception | High | Applications using Service Account or Internal Auth; legacy scope not fully evidenced | Create migration or exception plan |
| Technology lifecycle uncertainty | High | Portfolio-wide technology inventory | Update lifecycle data and remediation roadmap |
| Proposed onboarding app privacy gap | High | Customer Onboarding App | Define privacy data flow and retention controls |

## 9. Modernization Opportunities

| Opportunity | Candidate Applications | Rationale |
|---|---|---|
| Reduce ESB concentration risk | ESB; transaction-flow consumers including Fraud Detection and Data Warehouse | The risk register identifies multiple critical transaction flows depending on ESB availability. Prioritize resilience monitoring, failover planning, and potential flow-by-flow modernization. |
| Strengthen centralized authentication alignment | ESB; Core Banking; Fraud Detection | These applications use Service Account or Internal Auth patterns. Validate whether these are approved exceptions and define migration or compensating controls where needed. |
| Complete technology lifecycle management | API Gateway; ESB; Core Banking; Data Warehouse; OIDC Provider; Fraud Engine | Technology inventory has `TBD` version and EOL dates for all listed technologies, limiting risk and roadmap decisions. |
| Complete privacy controls for proposed onboarding flow | Customer Onboarding App | Risk register notes consent and retention requirements are not yet defined for the proposed onboarding flow. |
| Align application technologies to technology inventory | Mobile Banking, Internet Banking, Customer Onboarding App | Application technologies not found in the technology inventory: Mobile App + API, Web Application, Web/Mobile. Confirm approved technology mappings or add missing inventory records. |

## 10. Recommendations

| Priority | Recommendation | Owner | Expected Benefit |
|---|---|---|---|
| High | Define ESB resilience monitoring, failover plan, and dependency view for critical transaction flows. | Middleware Team | Reduced concentration risk and improved recoverability for critical integration flows. |
| High | Update technology versions and EOL dates for all technology inventory records. | Infrastructure Architecture | Clear lifecycle risk posture and evidence-based modernization roadmap. |
| High | Define consent, retention, and privacy data-flow controls for Customer Onboarding App before approval. | Digital Delivery Team | Reduced privacy and regulatory risk for proposed customer onboarding capability. |
| Medium | Review Service Account and Internal Auth usage and document approved exceptions or migration plans. | Security Architecture | Stronger identity governance and reduced credential/access risk. |
| Medium | Complete and validate application/data classification mappings across the portfolio. | Data Governance | Improved control alignment for restricted and confidential data assets. |
| Medium | Add missing or unmatched application technology records to the technology inventory. | Technical Owners / EA | Better portfolio traceability and standard compliance assessment. |

## 11. Open Questions

- What are the approved EA principles, standards, and reference architectures to apply to this portfolio?
- What are the exact version numbers and EOL dates for each technology platform?
- Are Service Account and Internal Auth patterns formally approved exceptions?
- What are the availability, RTO/RPO, monitoring, and DR requirements for Critical and High applications?
- What are the exact retention periods behind `Per policy` for each restricted or confidential data asset?
- Should Mobile App + API, Web Application, and Web/Mobile be added to the technology inventory or mapped to existing platforms?
- What consent and retention controls are required for the Customer Onboarding App?

## 12. Assumptions

- This report uses only the four provided inventory and risk-register files.
- `Restricted` and `Confidential` classifications are treated as requiring explicit data protection, access control, retention, and audit evidence.
- Applications with Service Account or Internal Auth are treated as potential authentication exceptions until approved patterns are confirmed.
- `TBD` technology version and EOL values are treated as lifecycle evidence gaps, not confirmed end-of-life risks.
- The report is draft and must be reviewed by an Enterprise Architect before use for governance decisions.
