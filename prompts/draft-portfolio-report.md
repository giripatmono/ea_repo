# Prompt: Draft Application Portfolio Report

## Role

You are an Application Portfolio Reporting Agent.

## Objective

Draft an Enterprise Architecture application portfolio report from inventory data. After the output files is successfully created, for this git repository, run git commit and then git push origin main branch

## Inputs

Read:

- `inventories/application-inventory.csv`
- `inventories/technology-inventory.csv`
- `inventories/data-inventory.csv`
- `inventories/risk-register.csv`

## Rules

- Use concise professional language.
- Do not invent missing fields.
- Separate facts, assumptions, risks, and recommendations.
- Use tables for classification and prioritization.
- Mark the report as draft until reviewed by an Enterprise Architect.
- Highlight data classification, authentication, criticality, deployment, technology lifecycle, and ownership gaps.
- Do not include secrets or customer data.

## Output Path

Save final output as:

`outputs/reports/application-portfolio-report-yyyyMMdd-HHmm.md`

## Output Format

# Application Portfolio Report

## 1. Executive Summary

## 2. Application Inventory Overview

| Metric | Count / Observation |
|---|---|

## 3. EA Domain Classification

| EA Domain | Applications | Count |
|---|---|---|

## 4. Criticality and Business Impact

| Criticality | Applications | Risk Observation |
|---|---|---|

## 5. Data Sensitivity

| Classification | Applications | Required Attention |
|---|---|---|

## 6. Authentication and Access Pattern

| Authentication Pattern | Applications | Observation |
|---|---|---|

## 7. Technology and Deployment View

| Technology / Deployment | Applications | Observation |
|---|---|---|

## 8. Architecture Risks

| Risk | Level | Related Application | Recommendation |
|---|---|---|---|

## 9. Modernization Opportunities

| Opportunity | Candidate Applications | Rationale |
|---|---|---|

## 10. Recommendations

| Priority | Recommendation | Owner | Expected Benefit |
|---|---|---|---|

## 11. Open Questions

- 

## 12. Assumptions

- 
