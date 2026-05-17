# Data Architecture Principles

## Document Control

| Field | Value |
|---|---|
| Status | Draft |
| Owner | Data Architecture / Data Governance |
| Review Cycle | Annual |

---

## DATA-01: Data Must Have an Authoritative Source

### Statement

Enterprise data must have a declared authoritative source.

### Rationale

Multiple uncontrolled sources create inconsistent reporting, incorrect decisions, and operational risk.

### Implications

- Applications must declare data they create, read, update, and delete.
- Authoritative source must be recorded for important data assets.
- Duplicate stores must be justified.

### Compliance Expectation

`data-inventory.csv` must include authoritative source and data owner.

---

## DATA-02: Data Must Be Classified

### Statement

Data must be classified based on sensitivity, business impact, and regulatory exposure.

### Rationale

Data classification drives security controls, access controls, retention, and sharing rules.

### Implications

- Applications must declare the classification of data they process.
- Restricted data requires stronger protection.
- Data sharing must follow classification rules.

### Compliance Expectation

Applications and data assets must declare classification.

---

## DATA-03: Minimize Data Collection and Movement

### Statement

Systems should collect, store, and move only the data required for a legitimate business purpose.

### Rationale

Unnecessary data increases privacy, security, and operational risk.

### Implications

- Integration payloads should avoid unnecessary sensitive fields.
- Analytics feeds should be minimized or masked where possible.
- Data replication must be justified.

### Compliance Expectation

Architecture review must check whether sensitive data movement is necessary.

---

## DATA-04: Data Quality Must Be Owned

### Statement

Critical data must have defined ownership and quality accountability.

### Rationale

Poor data quality damages operations, reporting, compliance, and customer trust.

### Implications

- Data owner must be identified.
- Quality rules should exist for critical data.
- Data issues must have escalation paths.

### Compliance Expectation

Critical data assets must declare owner, source, and consumer.

---

## DATA-05: Data Retention Must Be Defined

### Statement

Data must have retention and disposal rules aligned with business and regulatory needs.

### Rationale

Keeping data longer than necessary increases risk and cost.

### Implications

- Applications must identify retention needs.
- Archiving and deletion should be designed.
- Data in reports, logs, and backups must be considered.

### Compliance Expectation

Systems processing restricted data must define retention expectations.
