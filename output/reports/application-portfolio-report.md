# Application Portfolio Report - Draft 2026-05

## 1. Executive Summary

This report provides a comprehensive review of the current application portfolio, comprising 6 applications across three primary Enterprise Architecture (EA) domains: Touchpoint, Integration, and System of Record. The portfolio demonstrates strong dependency on highly critical systems (e.g., Core Banking), which are primarily deployed On-premise. While security standards like SSO/OIDC are widely utilized for customer-facing touchpoints, the presence of legacy integration layers (ESB) alongside modern API Gateways represents an opportunity for strategic modernization and risk reduction.

## 2. Application Portfolio Overview

**Total Applications in Scope:** 6

The portfolio is characterized by a mix of mission-critical systems handling sensitive financial data, balanced against modernized customer interfaces. The criticality level distribution shows a heavy concentration in the High to Critical range.

## 3. Classification by EA Domain

| Architecture Type | Applications | Count | Key Functions |
| :--- | :--- | :--- | :--- |
| **System of Record (SoR)** | Core Banking, Data Warehouse | 2 | Primary source of truth for financial data and analytics. Highest criticality. |
| **Touchpoint Architecture** | Mobile Banking, Internet Banking | 2 | Direct customer interfaces; high exposure to PII. |
| **Integration Architecture** | API Gateway, ESB | 2 | Manages internal communication between SoRs and Touchpoints. |

## 4. Criticality and Risk View

The portfolio features one 'Critical' application (Core Banking) and five 'High' criticality applications. The primary architectural risk is the reliance on legacy components within the Integration Architecture (`ESB`) for critical data flows, which could present maintenance and security vulnerabilities compared to a modern microservices or event-driven mesh approach.

## 5. Authentication and Security Observations

Customer-facing systems (Mobile/Internet Banking) utilize robust authentication patterns (SSO/OIDC). The internal landscape uses varied methods: Service Account for the ESB, while newer components leverage standard tokens. Data sensitivity is uniformly high across key applications, requiring strict compliance controls.

## 6. Data Sensitivity Observations

PII and highly sensitive Financial Data are handled by Core Banking and Mobile/Internet Banking. All data handling requires adherence to stringent privacy standards, emphasizing the need for consistent tokenization or encryption policies across all layers.

## 7. Technology and Deployment Observations

The portfolio is hybrid:
*   **On-premise:** Dominates critical systems (Core Banking, ESB), suggesting high operational overhead and limited elasticity.
*   **Cloud/Modern:** Utilized for the Data Warehouse and API Gateway, indicating a successful shift toward cloud capabilities in ancillary services.

## 8. Architecture Risks

1.  **Integration Sprawl/Coupling:** The co-existence of an ESB and an API Gateway suggests potential architectural duplication or complex routing logic, increasing cognitive load and maintenance cost.
2.  **Technical Debt (On-prem):** Critical systems running On-premise expose the organization to infrastructure scaling limits and heightened physical security risks compared to modern cloud deployment models.

## 9. Recommendations

1.  **Integration Modernization:** Initiate a project to phase out legacy ESB components in favor of standardized, service mesh patterns managed by the API Gateway layer.
2.  **SoR Migration Strategy:** Develop a roadmap for migrating high-criticality SoRs (e.g., Core Banking) to containerized/cloud environments to improve resilience and scalability.
3.  **Standardization:** Enforce uniform authentication standards across all remaining integration components.

## 10. Open Questions

*   What is the projected timeline and budget for migrating critical On-premise systems?
*   Are there specific requirements or compliance mandates that necessitate the current ESB deployment, despite its risks?