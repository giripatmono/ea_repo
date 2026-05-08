# Application Portfolio Report - EA Draft

**Date Generated:** May 8, 2026
**Target Repository:** `ea_repo_clone` / output/reports/application-portfolio-report.md

## 1. Executive Summary

This report provides a snapshot of the current application portfolio, detailing architectural classification, criticality, and risk posture. The portfolio currently consists of **5 applications**. A significant portion (80%) is classified as High Criticality, with one core banking system designated as Critical. Strategic focus should be placed on modernizing or consolidating integration components to mitigate architectural complexity and security risks associated with legacy deployment models where applicable.

## 2. Application Portfolio Overview

The inventory review indicates a balanced distribution across different EA domains:
*   **Touchpoint Architecture:** 2 applications (Digital customer interfaces).
*   **Integration Architecture:** 2 applications (Communication layers, e.g., API Gateway, ESB).
*   **System of Record Architecture:** 1 application (Core business data source).

## 3. Classification by EA Domain

| EA Domain | Count | Applications | Description |
| :--- | :--- | :--- | :--- |
| Touchpoint Architecture | 2 | Mobile Banking, Internet Banking | Direct customer interfaces for digital interaction. |
| Integration Architecture | 2 | API Gateway, ESB | Systems facilitating communication between internal and external applications. |
| System of Record Architecture | 1 | Core Banking | Primary source of truth for critical business data. |

## 4. Criticality and Risk View

The portfolio exhibits a high concentration of mission-critical components:

*   **Critical (1):** Core Banking (PII + Financial Data) – Requires highest level of oversight and resilience.
*   **High (4):** Mobile Banking, Internet Banking, API Gateway, ESB – These systems are vital to daily operations and customer experience but require proactive risk management.

## 5. Authentication and Security Observations

Authentication patterns are generally modernizing:
*   **SSO/OIDC:** Used for primary external touchpoints (Mobile Banking, Internet Banking).
*   **Internal Auth / Service Account:** Used by core systems (Core Banking, ESB), indicating a potential area for standardizing security practices across the entire estate.

## 6. Data Sensitivity Observations

Data sensitivity is high across the portfolio:
*   **PII:** Present in Mobile Banking, Internet Banking, and Core Banking.
*   **Financial Data/Transactional Data:** Handled by Core Banking and ESB, requiring stringent compliance controls.
*   **Token Metadata:** Managed by the API Gateway, emphasizing the need for strong token validation protocols.

## 7. Technology and Deployment Observations

Deployment models show a mix of modern cloud practices and traditional on-premise infrastructure:
*   **Hybrid/Cloud (1):** Mobile Banking utilizes an On-prem/Cloud model.
*   **On-prem (4):** The remaining applications are primarily hosted in a legacy On-prem environment, particularly within the Integration Architecture layer (ESB). This presents operational risk regarding scalability and maintenance.

## 8. Architecture Risks

1.  **Monolithic Dependency:** Reliance on older integration components (ESB) could create single points of failure or performance bottlenecks if not modernized.
2.  **Legacy Hosting:** The high density of On-prem systems increases the technical debt and operational overhead risk profile.
3.  **Security Standardization Gap:** Inconsistent authentication methods across domains present an attack surface vulnerability that requires standardization (e.g., moving toward centralized identity providers).

## 9. Recommendations

1.  **Integration Modernization:** Prioritize replacing or refactoring the ESB with a modern, containerized service mesh solution to improve scalability and reduce technical debt.
2.  **Cloud Migration Strategy:** Develop a phased migration plan for high-criticality, on-prem applications (e.g., Core Banking services) to leverage cloud resiliency features while maintaining compliance.
3.  **Security Baseline Enforcement:** Mandate the adoption of SSO/OIDC standards for all new and refactored internal APIs, moving away from isolated service accounts where possible.

## 10. Open Questions

*   What is the current SLA/RTO/RPO for the Core Banking system?
*   Are there plans to de-commission any existing applications that are currently flagged as 'Active' but have low usage or high cost of maintenance?