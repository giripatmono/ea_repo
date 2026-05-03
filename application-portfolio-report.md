# Application Portfolio Report - Draft 1.0

*Date Generated: [Current Date]*
*Source Data: input/application_inventory.csv*
*Review Status: DRAFT - Suitable for IT Planning & Strategy / EA Review.*

## Executive Summary

This report provides an initial assessment of the organization's critical applications, grouping them by architectural domain (e.g., Touchpoint Architecture, Integration Architecture, System of Record). The portfolio currently demonstrates a strong focus on digital customer interaction and core banking functions. Key observations include high reliance on centralized services like API Gateways and ESBs for integration, which are appropriately marked as 'High' criticality. Data governance and security requirements are significant, particularly concerning PII in the Mobile Banking, Internet Banking, and Core Banking applications. A proactive strategy is required to rationalize legacy components (ESB) while accelerating cloud adoption for data services (Data Warehouse).

## 1. Application Portfolio Overview

The portfolio consists of **6** key applications spanning three major architectural domains: Touchpoint Architecture, Integration Architecture, and System of Record Architecture. The majority of these systems are rated as High to Critical in criticality.

| Metric | Value | Details |
| :--- | :--- | :--- |
| Total Applications | 6 | All included in the scope. |
| Highest Criticality | Critical | Core Banking system (System of Record Architecture). |
| Key Domain Focus | Touchpoint / Integration | Indicates high customer-facing complexity and data movement needs. |

## 2. Classification by EA Domain

The applications are distributed across three distinct architectural domains:

*   **Touchpoint Architecture:** (Mobile Banking, Internet Banking) – Directly interfaces with customers; requires high uptime and modern authentication methods.
*   **Integration Architecture:** (API Gateway, ESB) – Acts as the central nervous system for data flow; failure in these components has immediate enterprise-wide impact.
*   **System of Record Architecture:** (Core Banking, Data Warehouse) – Holds authoritative, sensitive organizational data; requires utmost stability and compliance.

## 3. Criticality and Risk View

The portfolio is robustly built around high-criticality systems.

| Application | Domain | Criticality | Primary Business Impact of Failure |
| :--- | :--- | :--- | :--- |
| **Core Banking** | System of Record | **Critical** | Immediate halt to core financial operations. |
| API Gateway / ESB | Integration | High | Significant disruption to customer journeys and downstream processes. |
| Mobile/Internet Banking | Touchpoint | High | Major loss of digital revenue channels and user trust. |

*Assumption:* The current high-criticality rating for integration components (API Gateway, ESB) suggests they are single points of failure that require robust resilience planning.

## 4. Authentication and Security Observations

Authentication mechanisms are generally modern and compliant:
*   **Positive:** SSO/OIDC is implemented for customer-facing applications (Mobile & Internet Banking), which is best practice for identity management. The API Gateway also utilizes OIDC Token Validation, centralizing trust decisions.
*   **Observation:** Core Banking uses 'Internal Auth' while the ESB relies on 'Service Account.' While functional, reviewing if service accounts can be elevated to use modern delegated credentials (e.g., managed identities) would strengthen security posture.

## 5. Data Sensitivity Observations

Data sensitivity is a primary concern across multiple applications:
*   **PII Concentration:** PII is explicitly handled by Mobile Banking and Internet Banking.
*   **Financial Risk:** Core Banking handles "PII + Financial Data," mandating the highest level of compliance (e.g., PCI DSS, local banking regulations).
*   **Data Movement:** The ETL/File integration from ESB to Data Warehouse moves "Transaction summary," requiring secure data transfer protocols and robust audit logging on both ends.

## 6. Technology and Deployment Observations

The deployment model is a mix of legacy and modern infrastructure:
*   **Mixed Landscape:** Critical systems are deployed across 'On-prem' (Core Banking, API Gateway) and 'Cloud' (Data Warehouse). This requires sophisticated networking and hybrid cloud management expertise.
*   **Legacy Risk:** The presence of an ESB suggests potentially older integration technology that may present maintenance complexity and vendor lock-in risks compared to pure API mesh approaches.

## 7. Authentication and Security Observations

Authentication mechanisms are generally modern and compliant:
*   **Positive:** SSO/OIDC is implemented for customer-facing applications (Mobile & Internet Banking), which is best practice for identity management. The API Gateway also utilizes OIDC Token Validation, centralizing trust decisions.
*   **Observation:** Core Banking uses 'Internal Auth' while the ESB relies on 'Service Account.' While functional, reviewing if service accounts can be elevated to use modern delegated credentials (e.g., managed identities) would strengthen security posture.

## 8. Architecture Risks

1.  **Integration Sprawl/Coupling:** The reliance on both an API Gateway and an ESB suggests a potentially complex or bifurcated integration layer. Over time, this can lead to high technical debt and difficult troubleshooting (Observation).
2.  **Data Flow Auditability:** While the DWH is cloud-based and modern, ensuring end-to-end audit logging for data moving from transactional systems (ESB/Core Banking) into the warehouse is paramount.
3.  **Technology Obsolescence:** The ESB represents a potential modernization target due to its service account reliance and integration method (Assumption).

## 9. Recommendations

1.  **Prioritize Integration Modernization:** Develop a roadmap for rationalizing the current integration layer. Evaluate migrating core ESB functions into managed cloud services or modern API orchestration layers to reduce technical debt.
2.  **Strengthen Identity Governance:** Formally define standards for non-customer authentication (e.g., service accounts) and mandate their migration toward modern, least-privilege identity federation models.
3.  **Enhance Data Mesh Strategy:** Treat the Core Banking data as a foundational asset and develop standardized data contracts for all consuming domains (DWH, APIs) to reduce coupling risk.

## 10. Open Questions

*   What is the total cost of ownership (TCO) associated with maintaining both the ESB and the modern API Gateway?
*   Are there plans to retire any core systems in the next 3-5 years that could significantly de-risk the architecture?
*   Has a definitive standard been set for service account management across all critical applications?