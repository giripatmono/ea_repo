# Application Portfolio Guideline

## 1. Purpose

This guideline defines how to maintain and analyze the application portfolio for Enterprise Architecture.

## 2. Portfolio Objectives

The application portfolio should help answer:

- What applications exist?
- Who owns each application?
- Which business capabilities do they support?
- Which systems are critical?
- Which systems process sensitive data?
- Which technologies are aging?
- Which applications are duplicated or candidates for modernization?
- Which systems need architecture review?

## 3. Required Inventory Fields

Applications must be recorded in `inventories/application-inventory.csv`.

Key fields:

- application_id
- application_name
- ea_domain
- business_owner
- technical_owner
- users
- data_classification
- deployment_model
- criticality
- authentication
- technology
- status
- lifecycle_stage

## 4. Portfolio Analysis Views

Recommended views:

| View | Purpose |
|---|---|
| EA Domain Classification | Understand distribution across architecture domains |
| Criticality View | Identify high-impact systems |
| Data Sensitivity View | Identify privacy and security exposure |
| Authentication View | Identify non-standard authentication |
| Technology View | Identify platform and lifecycle risk |
| Deployment View | Understand hosting model |
| Lifecycle View | Identify modernization and decommissioning targets |
| Ownership View | Identify orphaned systems |

## 5. Portfolio Report Structure

Recommended report sections:

1. Executive Summary
2. Portfolio Overview
3. Classification by EA Domain
4. Criticality and Business Impact
5. Data Sensitivity
6. Authentication and Access Pattern
7. Technology and Deployment View
8. Architecture Risks
9. Modernization Opportunities
10. Recommendations
11. Open Questions
12. Assumptions

## 6. Risk Indicators

Flag applications when:

- owner is missing
- criticality is high or critical
- data classification is restricted
- authentication is local or unclear
- technology lifecycle is unsupported or unknown
- application is duplicated
- application has unmanaged direct integration
- deployment model is unclear
- monitoring ownership is unclear

## 7. Recommended Portfolio Actions

| Finding | Possible Action |
|---|---|
| Missing owner | Assign owner |
| Unsupported technology | Plan remediation |
| Duplicate capability | Consolidate or justify |
| Local authentication | Migrate to SSO |
| Restricted data | Security and data review |
| Critical integration | Resilience review |
| Sunset candidate | Decommission plan |
