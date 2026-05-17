# Authentication Standards

## Document Control

| Field | Value |
|---|---|
| Status | Draft |
| Owner | Security Architecture |
| Review Cycle | Semi-annual |

## 1. Scope

This standard applies to authentication for enterprise applications, APIs, administrative access, service-to-service access, and integration accounts.

## 2. Approved Authentication Patterns

| Use Case | Approved Pattern |
|---|---|
| Internal workforce application | SSO using approved identity provider |
| Customer-facing application | Approved customer identity provider / OIDC |
| Partner API | OAuth2 client credentials, mTLS, signed request, or approved equivalent |
| Service-to-service | Scoped service account, workload identity, or token-based mechanism |
| Privileged access | MFA and privileged access control |
| Legacy application | Exception with remediation plan |

## 3. SSO Requirement

Applications should use centralized authentication unless:

- application is technically incompatible
- migration risk is temporarily unacceptable
- application is isolated and low risk
- exception is approved with remediation plan

## 4. Local Authentication

Local authentication is prohibited for new enterprise applications unless approved by exception.

Exception must define:

- why centralized authentication cannot be used
- password policy
- account lifecycle process
- audit logging
- migration plan

## 5. Authorization

Applications must define authorization model:

| Area | Requirement |
|---|---|
| Role model | Required |
| Privilege mapping | Required |
| Administrative access | Must be restricted |
| Segregation of duties | Required for sensitive functions |
| Access review | Required for sensitive systems |

## 6. Service Accounts

Service accounts must:

- have clear owner
- use least privilege
- avoid shared human use
- be rotated according to policy
- be stored in approved secret management mechanism
- be disabled when no longer needed

## 7. MFA

MFA is required for:

- privileged access
- administrative portals
- remote access
- high-risk applications
- systems processing restricted data where applicable

## 8. Audit Logging

Authentication events should log:

- user or service identity
- timestamp
- source
- success or failure
- application
- correlation ID where available

## 9. Prohibited Patterns

Unless approved by exception:

- shared user accounts
- hardcoded credentials
- default passwords
- local user store for new SSO-capable application
- administrative access without MFA
- service account without owner
