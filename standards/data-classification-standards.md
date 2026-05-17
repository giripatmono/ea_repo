# Data Classification Standards

## Document Control

| Field | Value |
|---|---|
| Status | Draft |
| Owner | Data Governance / Security Architecture |
| Review Cycle | Semi-annual |

## 1. Scope

This standard defines data classification levels used for architecture review, inventory management, integration design, and access control.

## 2. Classification Levels

| Classification | Description | Example |
|---|---|---|
| Public | Approved for public release | Published product information |
| Internal | Internal business information | Internal process documentation |
| Confidential | Sensitive business information | Contracts, internal financial reports |
| Restricted | Highly sensitive or regulated information | Customer personal data, credentials, transaction data |
| Highly Restricted | Critical sensitive information requiring special handling | Cryptographic keys, privileged secrets, severe vulnerability details |

## 3. Personal Data

Systems processing personal data must declare:

- data subject
- data categories
- purpose
- authoritative source
- retention expectation
- data sharing path
- masking or encryption controls where applicable

## 4. Data Handling Rules

| Classification | Minimum Handling |
|---|---|
| Public | Approved publication process |
| Internal | Internal access only |
| Confidential | Need-to-know access |
| Restricted | Strong access control, encryption, audit logging |
| Highly Restricted | Restricted repository or vault, special approval |

## 5. Data Movement

Any integration moving confidential or restricted data must define:

- source
- target
- fields transferred
- frequency
- purpose
- encryption in transit
- data minimization rationale
- owner
- monitoring or reconciliation need

## 6. Logs and Reports

Logs and reports must avoid exposing restricted data unless required and approved.

Architecture review should check:

- masking
- access restriction
- retention
- export controls
- operational need

## 7. Inventory Requirement

`data-inventory.csv` must record:

- data asset ID
- data asset name
- authoritative source
- data owner
- classification
- whether personal data is included
- retention expectation
- consumers

## 8. Prohibited Patterns

Unless approved by exception:

- unrestricted export of restricted data
- sensitive data in plain text logs
- unknown authoritative source for critical data
- data replication without purpose
- unclear ownership of critical data
