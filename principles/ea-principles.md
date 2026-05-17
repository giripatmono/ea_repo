# Enterprise Architecture Principles

## Document Control

| Field | Value |
|---|---|
| Status | Draft |
| Owner | Enterprise Architecture |
| Review Cycle | Annual |
| Last Updated | 2026-05-18 |

## Principle Format

Each principle should contain:

- statement
- rationale
- implications
- compliance expectation
- exception rule

---

## EA-01: Architecture Decisions Must Be Traceable

### Statement

Major architecture decisions must be documented, justified, and traceable to business goals, risks, principles, standards, and constraints.

### Rationale

Architecture work loses value when decisions are undocumented or based only on personal preference. Traceability creates accountability and helps future teams understand why a decision was made.

### Implications

- Significant decisions require an ADR.
- Architecture reviews must record findings and recommendations.
- Exceptions must be formally documented.
- Decisions should include tradeoffs, not only the selected option.

### Compliance Expectation

Projects must provide decision records for material technology, integration, security, data, and infrastructure decisions.

### Exception Rule

Exceptions require EA approval and must include risk acceptance.

---

## EA-02: Reuse Before Build

### Statement

Teams should reuse approved enterprise capabilities before building or buying new solutions.

### Rationale

Uncontrolled duplication increases cost, risk, operational burden, and inconsistent customer experience.

### Implications

- New systems must check whether an existing capability already exists.
- Duplicate capabilities require business justification.
- Shared platforms should be preferred when fit-for-purpose.
- Reuse must not override legitimate fit, scalability, or regulatory constraints.

### Compliance Expectation

Architecture review must include capability overlap analysis.

### Exception Rule

A new capability may be approved when existing capability is not fit-for-purpose, not scalable, not compliant, or economically unreasonable to reuse.

---

## EA-03: Standards Are Guardrails, Not Decoration

### Statement

Architecture standards must be written so they can guide decisions, reviews, and exceptions.

### Rationale

Vague standards create inconsistent interpretation and governance theater.

### Implications

- Standards should be testable.
- Standards should define what is mandatory, recommended, and prohibited.
- Reviews should reference specific standards.
- Ambiguous standards should be improved.

### Compliance Expectation

Architecture review findings must reference concrete principles or standards.

### Exception Rule

Where no standard exists, reviewers must classify the finding as guidance or recommendation, not mandatory non-compliance.

---

## EA-04: Human Accountability Remains Mandatory

### Statement

AI tools may assist architecture work, but human architects remain accountable for decisions.

### Rationale

Architecture decisions affect risk, cost, resilience, security, compliance, and long-term maintainability.

### Implications

- AI outputs are drafts until reviewed.
- AI must not approve architecture exceptions.
- AI must separate facts, assumptions, risks, and recommendations.
- Humans must decide final approval.

### Compliance Expectation

AI-generated outputs must be reviewed through PR or formal architecture review.

### Exception Rule

No exception for final architecture approval.

---

## EA-05: Architecture Must Be Governable and Evolvable

### Statement

Architecture should support change while keeping risk under control.

### Rationale

Enterprise systems continuously evolve. Overly rigid architecture blocks delivery, while uncontrolled change increases risk.

### Implications

- Standards should include exception paths.
- Architecture should be modular where possible.
- Systems should have clear ownership.
- Lifecycle status must be maintained.

### Compliance Expectation

Systems must declare ownership, lifecycle stage, dependencies, and criticality.

### Exception Rule

Temporary deviations must have remediation plans.
