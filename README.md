# Agentic EA Repository

This repository is the version-controlled source of truth for Enterprise Architecture principles, standards, guidelines, inventories, architecture decisions, and AI-assisted EA outputs.

## Purpose

This repository supports an Agentic AI workflow for Enterprise Architecture where AI agents can:

- answer EA standards questions
- generate application integration diagrams
- draft application portfolio reports
- perform first-pass architecture reviews
- draft Architecture Decision Records
- produce governance QA checks

AI-generated outputs must be reviewed by humans before becoming approved EA artifacts.

## Repository Structure

```text
ea-repository/
├─ principles/      # Architecture principles by domain
├─ standards/       # Enforceable architecture standards
├─ guidelines/      # How-to guidance and review procedures
├─ inventories/     # CSV-based architecture inventories
├─ decisions/       # ADR templates and decisions
├─ outputs/         # AI-generated reports, diagrams, reviews, recommendations
├─ prompts/         # Agent prompts for repeatable workflows
├─ schemas/         # Validation schemas
└─ .github/         # Governance automation and PR workflow
```

## Governance Model

| Area | Rule |
|---|---|
| Source of truth | `main` branch |
| AI-generated work | Must be committed through pull requests |
| Human review | Required before merge |
| Standards changes | Require EA owner review |
| Security-related changes | Require security architecture review |
| Inventory changes | Require domain owner review |
| Architecture decisions | Require ARB or delegated architecture approval |

## First 3 Agentic EA Experiments

| Experiment | Goal | Expected Output |
|---|---|---|
| Generate Integration Diagram | Prove inventory to Mermaid workflow | `outputs/diagrams/application-integration-diagram.md` |
| Draft Portfolio Report | Prove inventory to report workflow | `outputs/reports/application-portfolio-report.md` |
| Review Against EA Principles | Prove standards to governance review workflow | `outputs/reviews/architecture-review-result.md` |

## Recommended Workflow

```text
1. Update inventory or standards
2. Run the relevant agent prompt
3. Save output under outputs/
4. Run governance QA
5. Create pull request
6. Human reviewer approves or requests changes
7. Merge to main only after review
```

## Artifact Types

| Artifact | Format | Location |
|---|---|---|
| Principles | Markdown | `principles/` |
| Standards | Markdown | `standards/` |
| Guidelines | Markdown | `guidelines/` |
| Inventories | CSV | `inventories/` |
| Decisions | Markdown ADR | `decisions/` |
| Reports | Markdown | `outputs/reports/` |
| Diagrams | Markdown + Mermaid | `outputs/diagrams/` |
| Reviews | Markdown | `outputs/reviews/` |
| Recommendations | Markdown | `outputs/recommendations/` |

## Important Safety Rules

- Do not commit credentials, tokens, private keys, VPN files, or secrets.
- Do not place customer data in this repository.
- Avoid real IP addresses unless explicitly approved.
- Treat generated output as draft until reviewed.
- AI may recommend, but humans decide.
- Do not auto-merge AI-generated changes to `main`.

## Suggested Local Run

Example:

```bash
openclaw agent --message "$(cat prompts/generate-integration-diagram.md)" --thinking high
openclaw agent --message "$(cat prompts/draft-portfolio-report.md)" --thinking high
openclaw agent --message "$(cat prompts/architecture-review.md)" --thinking high
```
