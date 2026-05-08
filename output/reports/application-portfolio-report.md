## Application Portfolio Report (Draft)

This report summarizes the current state of the application portfolio, providing insights into architectural domains, criticality, security posture, and strategic recommendations for EA review.

---

### 1. Executive Summary

The current portfolio consists of **7** actively managed applications. The majority of applications fall under the **System of Record Architecture (3/7)**, indicating a high reliance on foundational systems. Criticality is distributed across both High and Critical levels, demanding focused risk mitigation efforts. A notable finding is the mixed deployment model (On-premise and Cloud), which presents potential complexity in operational governance and modernization strategies.

### 2. Application Portfolio Overview
| Count | Description |
| :---: | --- |
| 7 | Total applications analyzed in the portfolio inventory. |

### 3. Classification by EA Domain
The portfolio is distributed across three primary architectural domains:

| Architecture Type | Count | Applications |
| :--- | :---: | :--- |
| System of Record Architecture | 3 | Core Banking, Data Warehouse, Joint Financing |
| Touchpoint Architecture | 2 | Mobile Banking, Internet Banking |
| Integration Architecture | 2 | API Gateway, ESB |

### 4. Criticality and Risk View
The portfolio demonstrates a high overall criticality, with 7 applications assessed as either High or Critical risk:

*   **Critical:** 2 (Core Banking, Joint Financing) - These systems are vital to core business operations and require immediate, robust protective measures.
*   **High:** 5 (Mobile Banking, Internet Banking, API Gateway, ESB, Data Warehouse) - Significant operational importance requiring continuous monitoring.

### 5. Authentication and Security Observations
The portfolio utilizes a blend of modern and traditional authentication patterns:

*   **SSO/OIDC Driven (2):** Mobile Banking and Internet Banking leverage industry-standard Single Sign-On protocols for user access, which is highly recommended practice.
*   **Internal Auth (3):** Core Banking, Data Warehouse, and Joint Financing rely on internal authentication mechanisms (AD/LDAP or similar), requiring careful internal security governance.
*   **API Validation (1):** The API Gateway uses OIDC Token Validation to secure integrations.

### 6. Data Sensitivity Observations
Data sensitivity varies significantly across the portfolio:

*   **PII Exposure (4):** Four applications handle Personally Identifiable Information, demanding stringent compliance controls (Mobile Banking, Internet Banking, Core Banking, Joint Financing).
*   **Financial & Aggregated Data (2):** The core banking and data warehouse systems manage sensitive financial figures.
*   **Transactional Metadata (1):** API Gateway manages token metadata.

### 7. Technology and Deployment Observations
The deployment landscape is hybrid:

*   **On-premise (2):** Internet Banking, ESB. These applications may pose challenges regarding scalability and access to modern cloud services.
*   **Cloud/Hybrid (3):** Mobile Banking, Data Warehouse, Joint Financing utilize the cloud or a hybrid model, offering agility but increasing network complexity.

### 8. Architecture Risks & Strategic Recommendations

**Risks Identified:**

1.  **Monolithic Core Reliance:** The heavy concentration in System of Record applications (3/7) suggests potential coupling risk; modernization efforts should focus on isolating and abstracting core functions.
2.  **Hybrid Complexity:** Managing security, patching, and compliance across both legacy On-premise systems (ESB) and modern Cloud services is operationally demanding.
3.  **Security Divergence:** While front-ends use SSO/OIDC, critical internal systems rely on older authentication methods, creating potential weak points in the overall security posture.

**Recommendations:**

*   **Standardize Authentication:** Prioritize migrating all critical system authentication (Internal Auth) to modern identity standards (e.g., OIDC/SAML).
*   **Decouple Core Systems:** Begin architectural decomposition of highly critical System of Record applications to improve resilience and allow for targeted modernization.
*   **Cloud Strategy Review:** Formalize governance and cost management policies specifically addressing the hybrid deployment environment, focusing on migrating appropriate legacy systems to managed cloud services where possible.

***
*(End of Draft Report)*