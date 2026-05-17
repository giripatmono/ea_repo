# EA Repository Policy

## 1. Policy Statement

This repository is governed as an Enterprise Architecture source of truth. It contains principles, standards, guidelines, inventories, decisions, and generated architecture outputs.

The repository may be used by AI agents to generate draft outputs, but all changes to approved content require human review.

## 2. Repository Classification

| Item | Classification |
|---|---|
| Repository content | Internal / Confidential |
| Architecture diagrams | Confidential |
| Application inventory | Confidential |
| Security findings | Restricted |
| Customer data | Not allowed |
| Secrets and credentials | Not allowed |

## 3. Change Control

| Change Type | Required Review |
|---|---|
| Principles | Enterprise Architecture owner |
| Standards | Enterprise Architecture owner and relevant domain owner |
| Security standards | Security Architecture |
| Integration standards | Integration Architecture |
| Inventory changes | Application / platform owner |
| Architecture reviews | EA reviewer |
| ADRs | ARB or delegated architecture authority |
| AI-generated outputs | Human reviewer before merge |

## 4. Branching Policy

| Branch | Purpose | Rule |
|---|---|---|
| `main` | Approved source of truth | Protected |
| `draft/*` | AI or human draft work | PR required |
| `review/*` | Review and refinement work | PR required |
| `archive/*` | Historical snapshots | Restricted |

## 5. Pull Request Policy

Every pull request should include:

- summary of changes
- affected files
- input sources used
- assumptions
- risks
- reviewer checklist
- approval from relevant CODEOWNER

## 6. AI Usage Policy

AI agents may:

- read repository files
- generate draft reports
- generate Mermaid diagrams
- draft ADRs
- perform first-pass review
- produce QA findings

AI agents must not:

- approve their own output
- merge directly to `main`
- invent standards not present in the repository
- mark missing evidence as compliant
- expose secrets or sensitive data
- override human governance decisions

## 7. Evidence and Traceability

Architecture review outputs must reference:

- relevant principle or standard
- input design or inventory element
- risk rationale
- recommended remediation
- open questions where evidence is missing

## 8. Exception Handling

Architecture exceptions must be documented with:

| Field | Required |
|---|---|
| Exception ID | Yes |
| Related principle or standard | Yes |
| Business justification | Yes |
| Risk assessment | Yes |
| Compensating control | Yes |
| Expiry or review date | Yes |
| Approver | Yes |

## 9. Sensitive Data Rules

Do not commit:

- passwords
- tokens
- private keys
- VPN configuration files
- real customer data
- production credentials
- unapproved vulnerability details
- confidential third-party contract details

## 10. Review Cadence

| Artifact | Review Frequency |
|---|---|
| Principles | Annually |
| Standards | Semi-annually |
| Guidelines | Semi-annually |
| Inventories | Monthly or quarterly |
| Risk register | Monthly |
| ADRs | As needed |
| Generated reports | Per reporting cycle |
