# Architecture Review Guideline

## 1. Purpose

This guideline explains how to perform architecture reviews using the EA repository.

Architecture review should help teams make better decisions, reduce risk, and align with enterprise standards. It should not become a bureaucratic ritual.

## 2. Review Objectives

Architecture review should answer:

- Is the solution aligned with EA principles?
- Does it comply with mandatory standards?
- Are risks understood and managed?
- Are dependencies visible?
- Are security and data concerns addressed?
- Are operational responsibilities clear?
- Is an ADR required?

## 3. Review Triggers

Review is required when a solution:

- introduces a new application
- changes critical integration
- connects to System of Record
- processes restricted data
- uses new technology
- exposes APIs externally
- changes authentication pattern
- has high or critical business impact
- requires exception from standard

## 4. Required Inputs

| Input | Required? |
|---|---|
| Solution overview | Yes |
| Context diagram | Yes for material change |
| Integration design | Yes when integration exists |
| Data classification | Yes |
| Authentication and authorization design | Yes |
| Deployment model | Yes |
| Operational model | Yes for production systems |
| Risk assessment | Yes for high or critical systems |
| ADR draft | When major decision exists |

## 5. Review Process

```text
1. Confirm review scope
2. Identify relevant principles and standards
3. Check inventory impact
4. Assess solution against standards
5. Identify risks and missing evidence
6. Define required actions
7. Decide whether ADR or ARB decision is needed
8. Record findings
```

## 6. Review Status

| Status | Meaning |
|---|---|
| Compliant | Evidence shows alignment with relevant standard |
| Partially Compliant | Some requirements are met, gaps remain |
| Non-Compliant | Evidence shows violation of mandatory standard |
| Not Enough Information | Evidence is missing or unclear |
| Not Applicable | Standard does not apply to this scope |

## 7. Risk Level

| Risk | Meaning |
|---|---|
| Low | Minor concern, manageable within team |
| Medium | Material concern requiring follow-up |
| High | Significant business, security, operational, or compliance risk |
| Critical | Severe risk requiring escalation or decision authority |

## 8. Review Output

Architecture review should produce:

- review summary
- applicable principles and standards
- findings
- risk level
- required actions
- open questions
- ARB decision requirement
- assumptions

## 9. Good Review Behavior

A good review:

- identifies risks early
- gives practical alternatives
- distinguishes facts from assumptions
- avoids personal preference disguised as standard
- records exceptions formally
- supports delivery while protecting the enterprise

## 10. Anti-Patterns

Avoid:

- late-stage review only after build is complete
- vague findings without source standard
- blocking without alternative
- approving missing evidence
- treating AI-generated review as final decision
