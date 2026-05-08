# Enterprise Architecture Portfolio Report Draft

**Date Generated:** May 8, 2026
**Report Version:** 1.0 (Draft)

---

## 1. Executive Summary

This report provides a comprehensive overview of the current application portfolio across the enterprise, derived from an inventory of 6 active applications. The portfolio is characterized by a strong presence in **Touchpoint Architecture**, critical systems residing in the **System of Record** domain, and reliance on **Integration Architecture** components (APIs/ESB).

The majority of the applications are classified as High or Critical criticality and handle sensitive data (PII, Financial Data). While core functionality is stable, strategic review should focus on modernizing legacy integration patterns (ESB) and ensuring consistent authentication standards across all touchpoints.

## 2. Application Portfolio Overview

| Metric | Count | Detail |
| :--- | :--- | :--- |
| **Total Applications** | 6 | All active applications inventoried. |
| Domains Represented | 3 | Touchpoint, Integration, System of Record. |
| High Criticality Apps | 4 | Requires continuous monitoring and high SLA adherence. |
| Critical Criticality Apps | 1 | Core business function; requires highest level of resilience. |

## 3. Classification by EA Domain

The applications are distributed across three key architectural domains:

*   **Touchpoint Architecture (2):** Mobile Banking, Internet Banking. These represent customer-facing interfaces and require high availability and modern UX/security standards.
*   **Integration Architecture (2):** API Gateway, ESB. These components facilitate inter-system communication but present risk due to potential technical debt (e.g., ESB).
*   **System of Record Architecture (1):** Core Banking. This is the single source of truth for financial and customer data; its stability is paramount.

## 4. Criticality and Risk View

| Application | Domain | Criticality | Notes |
| :--- | :--- | :--- | :--- |
| Core Banking | SoR | **Critical** | Business continuity relies on this system. Highest priority for resilience planning. |
| Mobile Banking | Touchpoint | High | Direct customer exposure; requires strict security compliance. |
| Internet Banking | Touchpoint | High | Primary digital access point; depends heavily on underlying APIs/ESB. |
| API Gateway | Integration | High | Key control plane for external and internal communication. Vulnerability here impacts everything else. |
| ESB | Integration | High | Legacy component, potential bottleneck or single point of failure. Requires modernization review. |

## 5. Authentication and Security Observations

The portfolio currently utilizes two primary authentication patterns:

*   **SSO/OIDC:** Used by customer-facing applications (Mobile Banking, Internet Banking), indicating alignment with modern identity standards for end-users.
*   **Service Account / Internal Auth:** Utilized in backend systems (ESB) and Core Banking. This suggests reliance on internal trust boundaries, which must be rigorously controlled to prevent lateral movement risk if compromised.

## 6. Data Sensitivity Observations

The data handled ranges from **Token Metadata** (API Gateway) to highly sensitive categories: **PII**, **Transactional Data**, and **Financial Data**. The concentration of PII in Touchpoint applications means that security incident response must prioritize these systems for containment and notification protocols.

## 7. Technology and Deployment Observations

*   **Deployment Diversity:** There is a mix of On-premise (Core Banking, ESB) and Cloud/Hybrid deployment (Mobile Banking + API). This hybrid nature increases operational complexity and requires standardized governance across environments.
*   **Technology Debt Focus:** The presence of an ESB suggests potential technological debt that could be addressed by transitioning toward modern microservices or event-driven architectures to simplify integration patterns.

## 8. Architecture Risks

1.  **Integration Complexity Risk (Medium/High):** Reliance on the current Integration Architecture (ESB) may introduce latency, maintenance overhead, and scalability limits compared to modern API meshes.
2.  **Data Concentration Risk (High):** Core Banking holds all PII and Financial Data. Any failure or security breach in this system has maximum business impact.
3.  **Boundary Sprawl Risk (Medium):** The mix of on-prem and cloud solutions increases the attack surface area and complicates unified compliance monitoring.

## 9. Recommendations

1.  **Modernize Integration Layer:** Prioritize a phased migration away from the ESB to a more modern, containerized API management layer to reduce technical debt and increase scalability.
2.  **Strengthen Core Banking Perimeter:** Implement enhanced monitoring and Zero Trust principles specifically around the Core Banking system's internal authentication mechanisms.
3.  **Standardize Security Posture:** Push for standardizing non-customer facing systems (ESB, backend APIs) toward OIDC/OAuth where practical to align security posture with customer-facing applications.

## 10. Open Questions

*   What is the current lifecycle status of the ESB component? Is a replacement plan defined?
*   Are there any dependency mappings between Touchpoint apps and non-inventoried services?
*   What are the formal Disaster Recovery (DR) and Business Continuity Plan (BCP) SLAs for Core Banking vs. Mobile Banking?