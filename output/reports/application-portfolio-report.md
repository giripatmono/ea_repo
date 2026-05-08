# Application Portfolio Report - Q2 2026 (Draft)

*Generated on Fri, 08 May 2026 by EA Agent.*

## 1. Executive Summary

This report provides an Enterprise Architecture review of the current application portfolio comprising five key systems. The portfolio is highly critical, with four out of five applications designated as High or Critical in risk posture. Data sensitivity levels are elevated across the board, requiring strict governance over PII and financial data. Most core services operate on-premise, indicating a continued reliance on legacy infrastructure for critical functions, though modern mobile/API solutions leverage hybrid cloud capabilities. Strategic focus must be placed on hardening authentication practices and accelerating modernization efforts for legacy System of Record components.

## 2. Application Portfolio Overview
A total of **5** applications were inventoried. The distribution across EA domains is as follows:

| Domain | Application Count | Percentage | Description |
| :--- | :--- | :--- | :--- |
| Touchpoint Architecture | 2 | 40% | Customer-facing interfaces (Web/Mobile). |
| Integration Architecture | 2 | 40% | Connectivity layers and middleware (API Gateway, ESB). |
| System of Record Architecture | 1 | 20% | Primary data storage and business logic engine (Core Banking). |

## 3. Classification by EA Domain

*   **Touchpoint Architecture**: Mobile Banking and Internet Banking provide critical external access to the customer base. They maintain High Criticality and utilize modern SSO/OIDC authentication patterns.
*   **Integration Architecture**: The API Gateway and ESB form the backbone of inter-application communication, rated High Criticality. The presence of both dedicated integration components suggests a mature (though possibly complex) service mesh structure.
*   **System of Record Architecture**: Core Banking is the single most critical component, housing PII and Financial Data on-premise. Its stability is paramount to business operations.

## 4. Criticality and Risk View

The portfolio exhibits a strong concentration of High/Critical risk:
*   Core Banking (Critical): Single point of failure for financial data.
*   Mobile Banking / Internet Banking (High): Direct customer interaction, high exposure to public-facing vulnerabilities.
*   API Gateway / ESB (High): Infrastructure layer risk; compromise here could lead to widespread lateral movement or data exfiltration.

**Architecture Risks:** The primary architectural risk is the reliance on an on-premise System of Record for core financial functions, which can impede agility and scalability compared to cloud-native patterns.

## 5. Authentication and Security Observations

Authentication mechanisms are generally robust:
*   The customer touchpoints use modern **SSO/OIDC** flows.
*   The integration layers utilize specialized token validation (API Gateway) or service account authentication (ESB).
*   Core Banking uses an **Internal Auth** mechanism, which requires rigorous internal auditing to ensure it meets modern compliance standards equivalent to external SSO controls.

## 6. Data Sensitivity Observations

PII is prevalent across three critical applications (Mobile, Internet, Core Banking). The ESB handles 'Transactional Data', and the API Gateway manages token metadata. This confirms that data classification efforts are broad but emphasizes the need for encryption-in-transit and at-rest policies across all components.

## 7. Technology and Deployment Observations

The portfolio uses a mixed deployment model:
*   Four of five applications (80%) are deployed on-premise, which is common for high-compliance financial systems but creates operational overheads regarding patching, scaling, and disaster recovery.
*   Mobile Banking shows hybrid capability (`On-prem/Cloud`), suggesting ongoing migration efforts.

## 8. Recommendations

1.  **Decouple SOR (Core Banking):** Begin planning the phased cloud migration or microservices decomposition of Core Banking to reduce operational risk associated with monolithic, on-premise critical systems.
2.  **Standardize Auth:** Review and standardize the authentication methods used by Core Banking to align with modern industry SSO/OIDC practices for consistency and reduced security attack surface.
3.  **Strengthen Integration Security:** Audit the ESB’s internal access controls to ensure service account privileges are strictly limited (Principle of Least Privilege).

## 9. Open Questions
*   What is the current Disaster Recovery (DR) RTO/RPO for Core Banking?
*   Are there plans to sunset any existing integration technologies (e.g., ESB)?
