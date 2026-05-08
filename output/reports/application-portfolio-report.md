# Enterprise Architecture Portfolio Report - Application Inventory Analysis (Draft)

**Date Generated:** 2026-05-08
**Prepared For:** IT Planning & Strategy / Enterprise Architecture Review Board
**Source Data:** application_inventory.csv

---

## 1. Executive Summary

This report analyzes the current state of our core applications using the provided inventory data. The portfolio consists of 6 tracked applications, predominantly classified as critical or high-risk due to handling Personally Identifiable Information (PII) and financial data. A significant portion of the architecture relies on established On-premise systems (Core Banking, ESB), presenting opportunities for modernization while also posing potential risks related to agility and operational complexity.

**Key Findings:**
*   **Risk Exposure:** 4 out of 6 applications are classified as High or Critical risk due to data sensitivity and core function criticality.
*   **Architecture Mix:** The portfolio spans three distinct EA domains: Touchpoint, Integration, and System of Record (SOR).
*   **Modernization Need:** Several legacy integration components require strategic refactoring or replacement to meet modern cloud/security standards.

## 2. Application Portfolio Overview

| Application | Domain | Criticality | Data Sensitivity | Status | Deployment Model | Technology |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Mobile Banking | Touchpoint Architecture | High | PII | Active | On-prem/Cloud | Mobile App + API |
| Internet Banking | Touchpoint Architecture | High | PII | Active | On-prem | Web App |
| Core Banking | System of Record Architecture | Critical | PII + Financial Data | Active | On-prem | Core Banking |
| ESB | Integration Architecture | High | Transactional Data | Active | On-prem | ESB |
| API Gateway | Integration Architecture | High | Token Metadata | Active | On-prem | API Gateway |

## 3. Classification by EA Domain

*   **System of Record (SOR) (1):** Core Banking is the primary source of truth, holding critical financial and PII data on a secure but legacy On-prem infrastructure.
*   **Touchpoint Architecture (2):** Mobile Banking and Internet Banking provide customer access points. They handle high volumes of PII and utilize mixed deployment models (On-prem/Cloud for Mobile).
*   **Integration Architecture (2):** The ESB and API Gateway manage data flow between systems. Both are critical, with the ESB representing a central, potentially monolithic integration choke point.

## 4. Criticality and Risk View

| Application | Criticality | Primary Risk Factor | Recommended Action Level |
| :--- | :--- | :--- | :--- |
| Core Banking | Critical | Data integrity, Business continuity (On-prem dependency) | High Priority Modernization/Resilience Plan |
| Mobile Banking / Internet Banking | High | PII leakage, Availability of customer interface | Continuous Security Audit & Cloud Migration Pathing |
| ESB | High | Single point of failure, Legacy integration complexity | Decoupling and Microservices Transition |

## 5. Authentication and Security Observations

Authentication patterns are varied:
*   **Modern:** Mobile Banking and Internet Banking utilize SSO/OIDC, which is a strong pattern for customer-facing systems.
*   **Internal/Service:** Core Banking relies on Internal Auth, while the API Gateway uses OIDC Token Validation. This suggests robust service mesh principles are in place for back-end communication.

The primary security observation is the consistent handling of PII across all layers (Touchpoint, SOR, Integration), necessitating strict adherence to data residency and encryption standards.

## 6. Data Sensitivity Observations

PII is a pervasive concern, residing not only in the Core Banking system but also being processed at the Touchpoint layer and handled as metadata by the API Gateway. This distribution requires granular access controls and end-to-end encryption policies.

## 7. Technology and Deployment Observations

The portfolio presents a classic hybrid environment:
*   **Legacy:** The ESB and Core Banking remain On-prem, suggesting high operational overhead for maintenance and scaling.
*   **Modern:** API Gateway usage indicates adoption of modern microservices/API management paradigms. Mobile apps show willingness to utilize cloud infrastructure.

## 8. Architecture Risks (Summary)

1.  **Vendor/Technology Lock-in:** High dependence on the legacy Core Banking platform makes agility and rapid feature deployment difficult.
2.  **Integration Bottleneck:** The ESB acts as a centralized, potentially brittle layer that could become a scaling bottleneck under increased load.
3.  **Security Sprawl:** While SSO is used for customer access, maintaining consistent security posture across disparate On-prem/Cloud components requires diligent governance.

## 9. Recommendations (Strategic Modernization)

1.  **Decouple Core Banking Interfaces:** Initiate a program to wrap legacy SOR functions with modern API layers, reducing direct dependency on the monolithic system and mitigating integration risk.
2.  **Modernize Integration Fabric:** Replace or significantly refactor the ESB by migrating key flows into a cloud-native, event-driven architecture (EDA) approach.
3.  **Cloud Migration Pathing:** Define clear migration criteria for customer-facing systems (Mobile/Internet Banking) to reduce On-prem operational footprint and improve disaster recovery posture.

## 10. Open Questions

*   What is the current roadmap or budget allocation for replacing the ESB?
*   Are there defined Service Level Objectives (SLOs) for Core Banking, and how are they measured against the existing infrastructure capabilities?