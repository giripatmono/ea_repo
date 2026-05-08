# Application Portfolio Report - Draft EA Review

## Executive Summary

This report provides a formal assessment of the current application portfolio across all defined Enterprise Architecture (EA) domains. The inventory consists of 7 applications. The portfolio is characterized by a strong reliance on critical, high-risk systems primarily focused on core banking and customer interaction. Immediate focus should be placed on modernizing legacy integration points and standardizing authentication patterns to mitigate architectural risks identified in this review.

## Application Portfolio Overview
| Count | Description |
| :---: | :--- |
| **7** | Total number of applications in the current portfolio inventory. |

## Classification by EA Domain
| Architecture Type | Number of Applications | Key Examples |
| :--- | :---: | :--- |
| System of Record Architecture | 3 | Core Banking, Data Warehouse, Joint Financing |
| Touchpoint Architecture | 2 | Mobile Banking, Internet Banking |
| Integration Architecture | 2 | API Gateway, ESB |

## Criticality and Risk View
The portfolio contains two applications classified as **Critical** (Core Banking, Joint Financing), which demand the highest level of operational scrutiny. Five other applications are rated as High criticality. A key risk is the concentration of critical financial data within On-prem systems requiring manual or proprietary authentication methods.

## Authentication and Security Observations
Authentication patterns vary significantly:
*   Two Touchpoint apps use modern standards (SSO/OIDC).
*   The two System of Record apps rely on internal, potentially siloed authentication mechanisms (Internal Auth), posing integration challenges and risk if not standardized.
*   Integration services utilize OIDC Token Validation or Service Accounts.

## Data Sensitivity Observations
PII is prevalent across both Touchpoint and System of Record applications. Two critical systems handle "PII + Financial Data," demanding rigorous compliance controls and data lineage mapping.

## Technology and Deployment Observations
The portfolio spans a mix of environments:
*   **On-prem**: Dominant for core, high-criticality systems (Core Banking, ESB). This suggests potential technical debt related to modernization.
*   **Cloud/Hybrid**: Utilized by the Data Warehouse and Joint Financing, indicating ongoing digital transformation efforts.

## Architecture Risks
1.  **Monolithic Core Risk**: High criticality applications are largely based on older On-prem technologies (Core Banking), which presents a single point of failure and limits agility.
2.  **Integration Sprawl**: The presence of both an ESB and a dedicated API Gateway suggests potential architectural complexity and redundant integration layers that require consolidation.

## Recommendations
1.  **Modernization Initiative (Phase 1)**: Prioritize migrating the Core Banking application to a cloud-native or containerized architecture to reduce operational risk and increase scalability.
2.  **Authentication Standardization**: Implement a centralized identity service across all critical applications, replacing "Internal Auth" methods with federated SSO/OIDC.
3.  **Integration Rationalization**: Review the role of ESB versus API Gateway; rationalize these components into a unified integration platform to reduce complexity and maintenance overhead.

## Open Questions
*   What is the long-term strategy for retiring legacy On-prem systems?
*   Can the Data Warehouse be leveraged as a single source of truth for risk metrics across all domains?