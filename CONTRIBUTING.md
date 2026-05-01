# Contributing to CICD-AI-UHCC

Thank you for your interest in contributing to the UHCC AI CI/CD pipeline! By participating in this project, you are helping the University of Hawaii Cancer Center (UHCC) and the Research Corporation of the University of Hawaii (RCUH) accelerate secure, compliant cancer research.

## 🔒 Security First
Before you contribute, ensure that:
1. **NO SECRETS** are in your commits (e.g., AWS keys, passwords, Koa/Mana SSH keys).
2. **NO PHI/PII** or real genomic datasets are included in your tests or sample data. Use only synthetic data.
3. Jupyter Notebooks (if applicable) have their outputs cleared before committing.

## 🌱 Branching Strategy
We use a strict GitFlow-inspired branching model to ensure pipeline stability:
- `main`: The highly restricted, production-ready pipeline. **Do not push directly to main.**
- `develop`: The primary integration branch for ongoing features.
- `prototype`: Experimental CI/CD modules or bleeding-edge ML Ops integrations.

### How to submit a Pull Request
1. Fork the repository and clone it locally.
2. Create a feature branch from `develop` (`git checkout -b feature/your-feature-name`).
3. Write clean, modular, and well-documented code.
4. Pass all automated linting and unit tests locally.
5. Push your branch and open a Pull Request against `develop`.
6. Fill out the Pull Request template completely.
7. Wait for a code review from a core UHCC maintainer.

## 🧑‍⚖️ Code of Conduct
All contributors must adhere to our [Code of Conduct](./CODE_OF_CONDUCT.md). Please report any unacceptable behavior to `uhcc-security@hawaii.edu`.
