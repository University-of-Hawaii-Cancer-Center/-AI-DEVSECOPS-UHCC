# 🛡️ UHCC AI Research Security & Governance Framework (2026)
## Project Baseline: BSR-AI-UHCC

[![Compliance: NIST 800-53](https://img.shields.io/badge/Compliance-NIST%20800--53-blue.svg)](https://nvd.nist.gov/800-53) [![Mandate: NSPM-33](https://img.shields.io/badge/Mandate-NSPM--33-red.svg)](https://www.whitehouse.gov/wp-content/uploads/2022/01/010422-NSPM-33-Implementation-Guidance.pdf) [![Policy: UH EP 2.214](https://img.shields.io/badge/Policy-UH%20EP%202.214-green.svg)](https://www.hawaii.edu/policy/)

## 🏛️ System Architecture & Data Flow

```mermaid
graph TD
    subgraph Users ["UHCC Researchers"]
        U1[Epidemiology]
        U2[Clinical Trials]
        U3[Genomics Lab]
    end

    subgraph Boundary ["NIST 800-53 / EP 2.214 Security Boundary"]
        subgraph Web ["Tier 3: Public / Web AI"]
            W1[Public Models <br/> e.g. ChatGPT]
            W2>Zero PII / PHI Allowed]
        end

        subgraph Enterprise ["Tier 2: Enterprise AI"]
            E1[UH Managed <br/> e.g. MS Copilot]
            E2[BAA Covered <br/> e.g. BioGPT]
            E3>Duo MFA / Enterprise IAM]
        end

        subgraph Local ["Tier 1: Local / HPC AI"]
            L1[HPC Koa & Mana]
            L2[Local Inferencing <br/> e.g. Llama 3]
            L3>Air-gapped Secure Enclave]
        end
    end

    U1 -->|Grant Writing / Public Data| W1
    U2 -->|Regulated / HIPAA| L1
    U3 -->|Genomic / Proprietary| E2

    W1 -.-> W2
    E1 -.-> E3
    E2 -.-> E3
    L1 -.-> L2
    L2 -.-> L3

    %% Styling
    classDef boundary fill:#f8f9fa,stroke:#343a40,stroke-width:2px,stroke-dasharray: 5 5;
    classDef local fill:#d1e7dd,stroke:#0f5132,stroke-width:2px,color:#0f5132;
    classDef ent fill:#cfe2ff,stroke:#084298,stroke-width:2px,color:#084298;
    classDef pub fill:#f8d7da,stroke:#842029,stroke-width:2px,color:#842029;
    classDef users fill:#e2e3e5,stroke:#41464b,stroke-width:2px;
    
    class Local,L1,L2,L3 local;
    class Enterprise,E1,E2,E3 ent;
    class Web,W1,W2 pub;
    class Boundary boundary;
    class Users,U1,U2,U3 users;
```

## 🧠 Governance Framework Mind Map

```mermaid
mindmap
  root((UHCC AI<br/>Governance))
    Compliance Mandates
      NIST 800-53 Controls
      NSPM-33 Federal Mandate
      UH EP 2.214 Policy
      NIH RST Certification
    Risk Tiers
      Tier 1 Local
        HPC Koa / Mana
        PHI / Regulated Data
        Air-gapped Deployments
      Tier 2 Enterprise
        BAA Covered Services
        Proprietary / Genomic
      Tier 3 Public
        Web Browser UIs
        Zero Sensitive Data
    Core Objectives
      Fund Preservation
      Post-Breach Hardening
      Secure AI Roadmap
    Repository Strategy
      main Baseline
      develop Drafting
      prototype Validation
```
## Overview
This repository serves as the **Master Governance Framework** for the University of Hawaii Cancer Center (UHCC). It establishes the formal security baseline bridging **UH Executive Policy 2.214** and **Federal Research Security Mandates** (NSPM-33, NIH, and NIST 800-53). 

This framework provides the authoritative documentation, technical controls, and inventory tracking mechanisms requisite for secure, compliant Artificial Intelligence (AI) implementation across UHCC research operations.

### Core Objectives
1. **Fund Preservation:** Ensure 100% compliance with May 2026 NIH Research Security Training (RST) mandates to protect grant eligibility.
2. **Post-Breach Hardening:** Implement rigorous technical controls and remediation strategies identified during the 2025 ransomware recovery.
3. **AI Governance:** Establish a secure, scalable roadmap empowering 400+ researchers to leverage advanced AI models without compromising PHI, PII, or proprietary genomic data.

---

## Scope

### In Scope
- Approved enterprise policies and baseline security controls governing AI usage.
- Active drafting and maintenance of lab-specific security plans and standard operating procedures (SOPs).
- Pilot testing, validation, and deployment parameters for local AI instances (e.g., HPC Koa/Mana).
- Continuous auditing and inventory management of all AI models (Enterprise, Local, and Public Web).

### Out of Scope
- General IT infrastructure and networking components outside the direct purview of AI governance.
- Legacy software applications that do not utilize machine learning or generative AI capabilities.

---

## Repository Structure

The framework is organized into targeted branches to maintain operational integrity:

- `main`: **Production Baseline.** Contains approved, executive-signed policy and baseline security controls.
- `develop`: **Active Drafting.** Workspace for iterative lab-specific security plans and emerging governance protocols.
- `prototype`: **Technical Validation.** Pilot testing configurations for local, air-gapped AI instances (HPC Koa/Mana).

### Key Documents
- 📊 `UHCC_Security_Governance_Master.xlsx`: Multi-tab source of truth tracking NIST 800-53 compliance and the comprehensive AI Tool Correlation Inventory.
- 📑 `UHCC_Security_Governance_Documentation.md`: Formal governance framework prepared for executive signature.
- 🚨 `UHCC_30_Day_Brutal_Fix.md`: The aggressive 30-day technical enforcement roadmap and post-breach mitigation strategy.

---

## Change Management
Strict configuration and change management protocols govern this repository. All proposed modifications to the baseline architecture or governance documentation must undergo:
1. **Peer Review:** Technical validation by the core security team.
2. **Approval Workflow:** Adherence to established UHCC governance procedures, requiring sign-off from the Information System Security Manager (ISSM) or designated authority.

---

## Future Additions & Considerations
- **Pilot Expansion:** Strategic expansion of AI pilot tests to wider research groups following successful security validation.
- **Continuous Compliance:** Regular audits and automated assessments to maintain alignment with evolving NIST frameworks and updated federal guidelines.
- **Federated Learning integration:** Future-proofing the architecture to support secure, multi-institutional federated learning workloads.

---

## Limitations
This framework is currently in the **baseline phase**. Ongoing adaptation, control refinement, and policy updates will be required to maintain parity with rapidly evolving federal mandates (e.g., upcoming ARPA-H directives) and emerging AI threat vectors.

---

### 🚀 2026 Compliance Milestones
- **May 25, 2026:** Deadline for NIH Mandatory RST Certification.
- **July 2026:** Final deadline for NSPM-33 Federal Research Security Program certification.
