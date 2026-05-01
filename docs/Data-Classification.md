# 📊 Data Classification & AI Risk Tiers

To ensure full compliance with **UH EP 2.214**, all Institutional Data injected into AI models, training pipelines, and CI/CD operations must be classified into one of four rigid categories.

## The Four Categories of Institutional Data

### 🟢 1. Public Data (Zero Risk)
- **Definition:** Data not restricted and subject to open records requests.
- **Impact:** Loss of confidentiality/integrity has NO adverse impact on the university.
- **AI Allowed Tier:** **Tier 3 (Public / Web AI)**.
- **Examples:** Student directory info, public employee information, synthesized open-source genomic data.
- **Rules:** ChatGPT, Claude, and public models may be used to process this data.

### 🟡 2. Restricted Data (Low Risk)
- **Definition:** Used internally within the UH community. Not for external distribution without an MOA.
- **Impact:** Mildly adverse impact on the university's mission or reputation.
- **AI Allowed Tier:** **Tier 2 (Enterprise AI)**.
- **Examples:** Internal administrative docs, meeting minutes without sensitive subjects.
- **Rules:** Must be processed using UH-managed, authenticated AI systems (e.g., Enterprise Microsoft Copilot).

### 🟠 3. Sensitive Data (Medium Risk)
- **Definition:** Subject to privacy or security considerations. Maintained in physically secured locations.
- **Impact:** Medium to large adverse impact on the university.
- **AI Allowed Tier:** **Tier 2 (Enterprise AI with BAA)** or **Tier 1 (Local)**.
- **Examples:** Unpublished research, proprietary genomic sequences.
- **Rules:** May only be processed on systems covered by a Business Associate Agreement (BAA) with a strict "No-Training" clause, or processed locally.

### 🔴 4. Regulated Data (High/Severe Risk)
- **Definition:** Subject to federal/state regulations (HIPAA, PCI DSS).
- **Impact:** Significant adverse impact, breach notifications, financial fines.
- **AI Allowed Tier:** **Tier 1 (Local / HPC AI)** exclusively.
- **Examples:** SSNs, Patient Trial Data (PHI), FAFSA info.
- **Rules:** Must NEVER touch an external API. Must be processed exclusively on air-gapped systems like HPC Koa/Mana using local inferencing (e.g., Local Llama 3).

---
## Pipeline Enforcement (CI/CD)
The CICD-AI-UHCC pipeline is designed to hard-fail any Pull Request that attempts to leak Restricted, Sensitive, or Regulated data into a lower-tier environment. We utilize `trufflehog` and `git-secrets` in the CI pipeline to enforce this programmatically.
