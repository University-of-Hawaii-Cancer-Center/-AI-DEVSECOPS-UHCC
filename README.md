# 🚀 CICD-AI-UHCC: Enterprise ML Ops & Automation Pipeline

[![Compliance: NIST 800-53](https://img.shields.io/badge/Compliance-NIST%20800--53-blue.svg)](https://nvd.nist.gov/800-53) [![Mandate: NSPM-33](https://img.shields.io/badge/Mandate-NSPM--33-red.svg)](https://www.whitehouse.gov/wp-content/uploads/2022/01/010422-NSPM-33-Implementation-Guidance.pdf) [![Policy: UH EP 2.214](https://img.shields.io/badge/Policy-UH%20EP%202.214-green.svg)](https://www.hawaii.edu/policy/) [![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)]()

*Developed by the University of Hawaii Cancer Center (UHCC) and the Research Corporation of the University of Hawaii (RCUH).*

## 📖 Overview
**CICD-AI-UHCC** is the official open-source Continuous Integration and Continuous Deployment (CI/CD) framework designed specifically for secure Artificial Intelligence and Machine Learning workloads at UHCC. 

This repository standardizes how AI models (from predictive genomics to epidemiological NLP models) are tested, hardened, and deployed across Tier 1 (HPC Koa/Mana), Tier 2 (Enterprise), and Tier 3 (Public) environments. **This pipeline strictly enforces NIST 800-53, NCI specifications, UH EP 2.214 data governance, and NIH Research Security Training (RST) mandates to aggressively protect grant eligibility without compromising patient data integrity.**

### 📚 [Explore the Official Documentation Wiki](./docs/Home.md)
All current and future AI Agents, sessions, and ML pipelines utilizing this framework **MUST** adhere to the guidelines set forth in the [UH Executive Policy 2.214 AI Compliance Document](./docs/EP-2.214-Compliance.md).

---

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

---

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

---

## 🏗️ Automated ML Ops Architecture

```mermaid
graph TD
    subgraph Dev ["1. Local / Lab Development"]
        D1[Data Scientist] -->|git push| D2[Feature Branch]
        D3[Jupyter Notebooks] -->|Strip Outputs| D2
    end

    subgraph CI ["2. Continuous Integration (GitHub Actions)"]
        D2 --> C1{Lint & Security Scan}
        C1 -->|Bandit / CodeQL| C2[Unit Tests]
        C2 --> C3[Model Validation / Weights Check]
        C3 --> C4{Approval Gate}
    end

    subgraph CD ["3. Continuous Deployment"]
        C4 -->|Merge to Main| CD1[Build Container]
        CD1 --> CD2[Push to Secure Registry]
        CD2 --> CD3{Deploy Target}
    end

    subgraph Envs ["4. Execution Environments"]
        CD3 --> E1[HPC Koa/Mana <br/> Air-gapped]
        CD3 --> E2[Enterprise API <br/> BAA Protected]
    end

    %% Styling
    classDef dev fill:#e2e3e5,stroke:#41464b,stroke-width:2px;
    classDef ci fill:#cfe2ff,stroke:#084298,stroke-width:2px;
    classDef cd fill:#d1e7dd,stroke:#0f5132,stroke-width:2px;
    classDef envs fill:#fff3cd,stroke:#856404,stroke-width:2px;

    class Dev,D1,D2,D3 dev;
    class CI,C1,C2,C3,C4 ci;
    class CD,CD1,CD2,CD3 cd;
    class Envs,E1,E2 envs;
```

---

## 🔒 CI/CD Security Gates
This pipeline strictly enforces federal mandates (NSPM-33) and institutional policy (UH EP 2.214).

```mermaid
mindmap
  root((CI/CD Security<br/>Gates))
    Pre-commit Hooks
      git-secrets
      trufflehog
      nbstripout
    GitHub Actions
      Dependabot
      CodeQL SAST
      Linting (Black/Flake8)
    Deployment Controls
      Container Signing
      Duo MFA Gateway
      NIST 800-53 Audits
```

---

## 🤝 Community & Contributing
We welcome contributions from the open-source community, provided they adhere to our strict security standards. 

- **[Contributing Guidelines](CONTRIBUTING.md)**: Learn how to submit a PR and run local tests.
- **[Code of Conduct](CODE_OF_CONDUCT.md)**: Our commitment to a professional and inclusive environment.
- **[Security Policy](SECURITY.md)**: Instructions for responsibly disclosing vulnerabilities.

> **CRITICAL**: Never commit API keys, SSH keys, or Protected Health Information (PHI). All sample data must be synthetic.

---

## ⚖️ License & Disclaimer
This project is licensed under the **Apache License 2.0** - see the `LICENSE` file for details. 

*Disclaimer: This software is provided "as is" by the University of Hawaii Cancer Center and RCUH. It is intended for the advancement of open research. The institutions assume no liability for the misconfiguration of CI/CD pipelines utilizing this code.*
