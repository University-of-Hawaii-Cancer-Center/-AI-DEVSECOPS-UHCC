# 🏗️ Automated ML Ops Architecture

The CICD-AI-UHCC pipeline bridges the gap between raw data science and secure, compliant production.

## The Deployment Lifecycle

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
        CD3 --> E1[HPC Koa/Mana <br/> Air-gapped / Regulated Data]
        CD3 --> E2[Enterprise API <br/> BAA Protected / Sensitive Data]
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

## Core Security Gates
1. **Pre-commit Hooks:** All researchers must use `nbstripout` to clear Jupyter notebook outputs before committing to ensure PHI/PII does not leak into git history.
2. **SAST Scanning:** We utilize `CodeQL` and `Dependabot` on every pull request.
3. **Approval Gates:** Pushing to the `main` baseline requires review from the core InfoSec team.

*All deployments must follow the [EP 2.214 Compliance](./EP-2.214-Compliance.md) mandates.*
