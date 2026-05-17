# Application Portfolio Report

**Status:** Draft — pending review by an Enterprise Architect.

**Input files reviewed:** `inventories/application-inventory.csv`, `inventories/technology-inventory.csv`, `inventories/data-inventory.csv`, `inventories/risk-register.csv`.

## 1. Executive Summary

This draft report summarizes 8 applications, 6 technology records, 6 data assets, and 5 architecture risks from the provided inventory files. The portfolio covers customer touchpoints, integration, system of record, data/analytics, and security domains.

Facts: 7 applications are active and 1 is proposed. 2 applications are Critical and 6 are High. 7 applications process restricted data classifications. Application business and technical owners are populated in the provided data.

Key risks are ESB concentration, incomplete data classification evidence, authentication exceptions, technology lifecycle uncertainty, and privacy gaps for the proposed Customer Onboarding App. Recommended actions focus on resilience, lifecycle completion, authentication governance, privacy controls, and inventory traceability.

## 2. Application Inventory Overview

| Metric | Count / Observation |
|---|---|
| Total applications | 8 |
| Active applications | 7 |
| Proposed applications | 1 |
| Critical applications | 2 |
| High criticality applications | 6 |
| EA domains represented | 5 |
| Applications with Restricted data classification | 7 |
| Applications with Confidential data classification | 1 |
| Cloud or hybrid deployments | 3 |
| Open risks | 5 |
| Technology records with TBD version | 6 of 6 |
| Technology records with TBD EOL date | 6 of 6 |
| Application ownership gaps | None evidenced |
| Technology ownership gaps | None evidenced |
| Data ownership gaps | None evidenced |

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
| Critical | ESB, Core Banking | Material business disruption if unavailable; resilience, recovery, monitoring, and continuity evidence should be explicit. |
| High | Mobile Banking, Internet Banking, API Gateway, Data Warehouse, Fraud Detection, Customer Onboarding App | High business/customer impact; service objectives, support ownership, and incident procedures should be confirmed. |

## 5. Data Sensitivity

| Classification | Applications | Required Attention |
|---|---|---|
| Confidential - Token Metadata | API Gateway | Validate access controls, token/metadata handling, auditability, and monitoring requirements. |
| Restricted - Aggregated Customer Data | Data Warehouse | Validate privacy controls, least-privilege access, retention, auditability, and data-flow evidence. |
| Restricted - Customer PII | Mobile Banking, Internet Banking, Customer Onboarding App | Validate privacy controls, least-privilege access, retention, auditability, and data-flow evidence. |
| Restricted - Customer and Financial Data | Core Banking | Validate privacy controls, least-privilege access, retention, auditability, and data-flow evidence. |
| Restricted - Risk Data | Fraud Detection | Validate privacy controls, least-privilege access, retention, auditability, and data-flow evidence. |
| Restricted - Transactional Data | ESB | Validate privacy controls, least-privilege access, retention, auditability, and data-flow evidence. |

Data inventory facts: Restricted data assets are Customer Profile, Account Data, Transaction Data, Fraud Risk Score. Confidential data assets are API Token Metadata, Portfolio Reporting Data. Retention is recorded as `Per policy`; exact retention periods are not provided.

## 6. Authentication and Access Pattern

| Authentication Pattern | Applications | Observation |
|---|---|---|
| AD/LDAP | Data Warehouse | Centralized identity or token validation pattern is evidenced in the inventory. |
| Internal Auth | Core Banking | Potential exception pattern; confirm approval, least privilege, rotation, monitoring, and migration or compensating controls. |
| OIDC | Customer Onboarding App | Centralized identity or token validation pattern is evidenced in the inventory. |
| OIDC Token Validation | API Gateway | Centralized identity or token validation pattern is evidenced in the inventory. |
| SSO/OIDC | Mobile Banking, Internet Banking | Centralized identity or token validation pattern is evidenced in the inventory. |
| Service Account | ESB, Fraud Detection | Potential exception pattern; confirm approval, least privilege, rotation, monitoring, and migration or compensating controls. |

## 7. Technology and Deployment View

| Technology / Deployment | Applications | Observation |
|---|---|---|
| Deployment: Cloud | Data Warehouse, Customer Onboarding App | Deployment model is recorded; environment topology, DR design, and operational controls are not detailed in the inventory. |
| Deployment: Hybrid | Mobile Banking | Deployment model is recorded; environment topology, DR design, and operational controls are not detailed in the inventory. |
| Deployment: On-prem | Internet Banking, API Gateway, ESB, Core Banking, Fraud Detection | Deployment model is recorded; environment topology, DR design, and operational controls are not detailed in the inventory. |
| Technology: API Gateway | API Gateway | Technology inventory record found; owner: API Platform Team; lifecycle status: Active; version: TBD; EOL date: TBD. |
| Technology: Core Banking Platform | Core Banking | Technology inventory record found; owner: Core Banking Team; lifecycle status: Active; version: TBD; EOL date: TBD. |
| Technology: Data Warehouse | Data Warehouse | Technology inventory record found; owner: Data Platform Team; lifecycle status: Active; version: TBD; EOL date: TBD. |
| Technology: ESB / Middleware | ESB | Technology inventory record found; owner: Middleware Team; lifecycle status: Active; version: TBD; EOL date: TBD. |
| Technology: Fraud Engine | Fraud Detection | Technology inventory record found; owner: Fraud Platform Team; lifecycle status: Active; version: TBD; EOL date: TBD. |
| Technology: Mobile App + API | Mobile Banking | No matching technology inventory record found; confirm mapping to approved platform or add a technology inventory record. |
| Technology: Web Application | Internet Banking | No matching technology inventory record found; confirm mapping to approved platform or add a technology inventory record. |
| Technology: Web/Mobile | Customer Onboarding App | No matching technology inventory record found; confirm mapping to approved platform or add a technology inventory record. |

Technology lifecycle gap: all technology records have `version` and `eol_date` set to `TBD`, so lifecycle exposure cannot be fully assessed from the provided fields.

Ownership gap facts: application business and technical owner fields are populated for all application records. Technology owner and data owner fields are populated for all provided records. Formal RACI/accountability beyond owner fields is not provided.

## 8. Architecture Risks

| Risk | Level | Related Application | Recommendation |
|---|---|---|---|
| ESB concentration risk | High | ESB | Define resilience monitoring and failover plan |
| Incomplete data classification | Medium | Portfolio-wide | Complete application and data inventory classification |
| Local authentication exception | High | ESB, Core Banking, Fraud Detection; legacy scope not fully evidenced | Create migration or exception plan |
| Technology lifecycle uncertainty | High | Portfolio-wide technology inventory | Update lifecycle data and remediation roadmap |
| Proposed onboarding app privacy gap | High | Customer Onboarding App | Define privacy data flow and retention controls |

## 9. Modernization Opportunities

| Opportunity | Candidate Applications | Rationale |
|---|---|---|
| Reduce ESB concentration exposure | ESB; dependent transaction flows involving Core Banking, Fraud Detection, and Data Warehouse | Risk register identifies critical transaction-flow dependency on ESB availability. |
| Complete technology lifecycle baseline | API Gateway; ESB; Core Banking; Data Warehouse; OIDC Provider; Fraud Engine | All technology records have TBD version and EOL values, limiting lifecycle and modernization planning. |
| Strengthen authentication exception governance | ESB; Core Banking; Fraud Detection | Service Account and Internal Auth patterns require approval evidence, least-privilege validation, rotation, and compensating controls. |
| Define onboarding privacy controls before approval | Customer Onboarding App | Proposed application has restricted customer PII and an open privacy risk for consent and retention requirements. |
| Improve application-to-technology traceability | Mobile Banking, Internet Banking, Customer Onboarding App | Application technologies without matching technology inventory records: Mobile App + API, Web Application, Web/Mobile. |

## 10. Recommendations

| Priority | Recommendation | Owner | Expected Benefit |
|---|---|---|---|
| High | Define ESB resilience monitoring, failover plan, and dependency view for critical transaction flows. | Middleware Team | Lower concentration risk and improved recoverability for critical integration services. |
| High | Populate technology version and EOL dates, then create a lifecycle remediation roadmap. | Infrastructure Architecture | Improved lifecycle visibility, risk prioritization, and modernization planning. |
| High | Define consent, retention, and privacy data-flow controls for Customer Onboarding App before architecture approval. | Digital Delivery Team | Reduced privacy and regulatory risk for proposed customer-facing capability. |
| Medium | Review Service Account and Internal Auth patterns and record approved exceptions or migration plans. | Security Architecture | Stronger identity governance and reduced access-control risk. |
| Medium | Complete classification validation across application and data inventories. | Data Governance | Improved alignment of controls to restricted and confidential data. |
| Medium | Add missing technology records or mappings for application technologies not represented in the technology inventory. | Technical Owners / Enterprise Architecture | Better standards traceability and portfolio reporting quality. |

## 11. Open Questions

- What EA principles, standards, and reference architectures should be used for formal compliance review?
- What are the actual versions and EOL dates for each technology record currently marked `TBD`?
- Are Service Account and Internal Auth patterns approved exceptions, and what compensating controls apply?
- What are the availability, RTO/RPO, monitoring, and DR requirements for Critical and High applications?
- What exact retention periods are represented by `Per policy` for each data asset?
- Should Mobile App + API, Web Application, and Web/Mobile be added to the technology inventory or mapped to approved platform records?
- What consent and retention requirements apply to the proposed Customer Onboarding App?
- Is there a formal RACI/accountability model beyond the owner fields in the inventories?

## 12. Assumptions

- The report is based only on the four provided CSV inventory/risk files.
- `Restricted` and `Confidential` classifications require explicit access control, retention, privacy, and audit evidence.
- Service Account and Internal Auth patterns are treated as potential exceptions until approved standards are confirmed.
- `TBD` version and EOL fields indicate missing lifecycle evidence, not confirmed obsolescence.
- Application, technology, and data ownership is considered populated where owner fields are non-empty; role accountability beyond those fields is not evidenced.
- This report remains draft until reviewed by an Enterprise Architect.
