# Application Portfolio Report - Draft EA Review
**Generated on:** 2026-05-08
**Source Inventory:** application_inventory.csv

## 1. Executive Summary
This report provides an initial analysis of the current enterprise application portfolio, derived from the input inventory. The portfolio consists of six applications covering three distinct architectural domains: Touchpoint Architecture, Integration Architecture, and System of Record Architecture. High criticality is noted across most applications, underscoring a need for focused risk management and strategic modernization planning to ensure business resilience.

## 2. Application Portfolio Overview
The current portfolio shows a balanced distribution across critical functional areas. The presence of both monolithic core systems (System of Record) and modern API/Mobile components indicates a transition state, requiring careful governance over integration layers.

| Total Applications | Domains Represented | Criticality Levels High |
| :---: | :---: | :---: |
| 6 | 3 | 6 / 6 |

## 3. Classification by EA Domain
The portfolio is segmented into three primary architectural types, each presenting unique operational and strategic concerns.

*   **Touchpoint Architecture (2):** Includes Mobile Banking and Internet Banking. These are customer-facing applications with high PII exposure, requiring stringent security protocols (SSO/OIDC).
*   **Integration Architecture (2):** Consists of the API Gateway and ESB. These systems manage data flow between internal services and external consumers, representing a key risk area if not properly governed or modernized.
*   **System of Record Architecture (2):** Includes Core Banking and Data Warehouse. These are mission-critical systems handling the most sensitive financial and PII data.

## 4. Criticality and Risk View
All applications in the current inventory are classified as High criticality, indicating they directly support core business functions. This uniform high risk suggests a systemic vulnerability that requires enterprise-wide resilience planning. The primary risks identified stem from:
1.  **System Dependency:** Heavy reliance on On-prem infrastructure for critical systems (Core Banking).
2.  **Integration Sprawl:** Use of legacy components like ESB alongside modern gateways introduces complexity and potential failure points.

## 5. Authentication and Security Observations
All applications utilize robust authentication patterns, primarily SSO/OIDC or Internal Auth (for Core Systems). The data sensitivity levels are consistently high (PII, Financial Data, Token Metadata), requiring ongoing compliance audits for all in-scope systems.

## 6. Data Sensitivity Observations
Data exposure is uniformly sensitive across the portfolio (PII, Financial Data). Specific attention must be paid to the "Core Banking" and "Data Warehouse," as they hold combined PII + Financial Data, making them high-value targets for threat actors. Cloud usage for the DWH suggests a potential opportunity for enhanced security controls there.

## 7. Technology and Deployment Observations
The portfolio shows a mixed deployment model (On-prem/Cloud). While this demonstrates modernization efforts, managing heterogeneous environments introduces operational overhead. The API Gateway and Mobile Banking demonstrate modern cloud/API capabilities, contrasting sharply with the on-prem nature of Core Banking.

## 8. Architecture Risks
*   **Technical Debt:** Potential risk associated with maintaining legacy ESB infrastructure.
*   **Vendor Lock-in (Implied):** The proprietary nature of some On-prem core systems may pose long-term agility risks.
*   **Interoperability Risk:** Ensuring secure and scalable communication between modern Touchpoint apps and older System of Record components via the Integration layer is a continuous challenge.

## 9. Recommendations
1.  **Accelerated Modernization (SoR):** Begin planning for migrating critical, high-risk On-prem Systems of Record to resilient cloud-native architectures where feasible, reducing physical infrastructure overhead.
2.  **Integration Layer Review:** Conduct a formal assessment and roadmap for retiring or significantly upgrading the ESB component in favor of modern service mesh/API standards to reduce complexity (Target: Integration Architecture).
3.  **Security Automation:** Implement automated security monitoring across both On-prem and Cloud environments to manage high PII exposure efficiently.

## 10. Open Questions
*   What is the current planned end-of-life for the ESB component?
*   What are the long-term scalability requirements for the Core Banking system under increased load?