# ⚖️ Executive Policy 2.214: AI Agent Compliance

## The Core Mandate
All current and future AI Agents, LLM sessions, and autonomous ML pipelines operating within this organization **must strictly adhere to [UH Executive Policy 2.214](https://www.hawaii.edu/policy/?action=viewPolicy&policySection=ep&policyChapter=2&policyNumber=214)**. 

EP 2.214 mandates the absolute protection, security, and privacy of Institutional Data, categorizing it as one of the university's most valuable assets. The Information Technology Services (ITS) maintains full authority to enforce technical measures, scan networks, and instantly disconnect compromised AI systems.

## 🤖 Rules of Engagement for AI Agents

When deploying AI Agents (e.g., GPT-4, Llama 3, custom autonomous routines) across the UHCC CI/CD pipeline, the following directives are non-negotiable:

### 1. Zero Trust Data Ingestion
AI Agents **shall not** autonomously ingest, process, or transmit `Protected Data` (Restricted, Sensitive, or Regulated) unless explicitly operating within a Tier 1 (Air-gapped HPC Koa/Mana) or Tier 2 (BAA Covered) environment.

### 2. Social Security Numbers (SSN) & PII
- **Total Prohibition:** Under EP 2.214 Section III, SSNs will not be used as identifiers in any information system. AI Agents must have strict pre-processing filters (e.g., `git-secrets`, `trufflehog`) to ensure SSNs and PII are never vectorized or fed into model training.
- **Aggregation Risk:** AI Agents summarizing data must ensure that aggregate displays cannot identify individuals (e.g., combining ethnicity with a specific major/GPA).

### 3. Identity Theft Prevention (FTC Red Flags)
Agents interacting with external APIs or user inputs must comply with the FTC Red Flags Rule (16 CFR Part 681). AI systems must not process or generate responses that could facilitate identity theft.

### 4. Continuous Scanning & Audit
As per EP 2.214, the Information Security Team (InfoSec) conducts regular network and device scanning.
- CI/CD pipelines deploying AI models must include Static Application Security Testing (SAST) and Dependency Scanning (`Dependabot`, `CodeQL`).
- Models must log all inference prompts and responses securely to enable post-incident forensics.

---
*For a full breakdown of the four Data Classification Categories (Public, Restricted, Sensitive, Regulated), please read the [Data Classification Guide](./Data-Classification.md).*
