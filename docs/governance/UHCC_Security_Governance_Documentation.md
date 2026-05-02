# UH Cancer Center (UHCC) Information Security Governance Framework
**Document ID:** UHCC-IS-2026-001  
**Version:** 1.0  
**Status:** Draft / Internal Use Only  
**Author:** Information System Security Manager (ISSM)  
**Date:** April 30, 2026

---

## 1. Executive Summary
This document outlines the security governance framework for the University of Hawaii Cancer Center (UHCC). It serves as the primary bridge between University of Hawaii Executive Policy 2.214 (EP 2.214) and federal mandates including NIST 800-53, NIST 800-171, and NSPM-33. Following the significant security incident in 2025, this framework prioritizes ransomware recovery, network segmentation, and the secure integration of Artificial Intelligence (AI) into research workflows for our 400 researchers.

## 2. Policy Alignment & Regulatory Context
*   **UH EP 2.214:** The foundational authority for data classification and protection.
*   **NSPM-33:** Required certification of a Research Security Program (RSP) by July 2026.
*   **NIH (NOT-OD-26-017):** Mandatory Research Security Training (RST) for key personnel by May 25, 2026.
*   **NIST 800-53 Rev. 5:** The selected control baseline for UHCC infrastructure and regulated data sets.

---

## 3. Section 1: NIST 800-53 Security Control Matrix (UHCC Baseline)
The following controls represent the immediate priorities for the 2026 hardening phase.

| Control ID | Control Name | UH Policy Alignment | Implementation Status | Ransomware Recovery Task |
| :--- | :--- | :--- | :--- | :--- |
| **AC-2** | Account Management | Section 3.1 | Pending Audit | Audit 400 researchers for orphaned accounts. |
| **AC-3** | Access Enforcement | Section 3.1.2 | Partial | Network segmentation between Lab and Clinical. |
| **IA-2** | Ident. & Auth (Org Users) | Section 3.5 | In Progress | Enforce phishing-resistant MFA (Yubikey). |
| **IR-4** | Incident Handling | Section 3.6 | Implemented | Post-2025 Ransomware Recovery Plan alignment. |
| **SC-7** | Boundary Protection | Section 3.13 | Pending | Move sensitive servers to UH ITS Data Center. |
| **CM-8** | Comp. Inventory | Section 3.4 | Planned | Launch AI Tool Discovery Survey to 400 staff. |
| **AT-2** | Security Awareness Training | Section 3.2 | In Progress | 100% completion of ISAT and RST modules. |
| **CP-9** | System Backup | Section 3.8 | High Priority | Immutable backups for epidemiology data. |
| **AU-2** | Event Logging | Section 3.3 | Implementing | Deploy 24/7 endpoint monitoring on 400 devices. |
| **MA-3** | Maintenance Tools | Section 3.7 | Planned | Audit AI model training tools (Koa/Mana). |

---

## 4. Section 2: AI Tool Correlation & Inventory
This section tracks the specific AI deployments within UHCC labs and their correlation to data risk tiers.

### 4.1 AI Risk Tiering Strategy
*   **Tier 1 (Regulated):** Clinical Trials, HIPAA data. Requires air-gapped or UH-Private AI instances.
*   **Tier 2 (Sensitive):** Proprietary research, Genomic data. Requires vetted Enterprise AI with BAA.
*   **Tier 3 (Public):** General administrative use. Standard UH security controls apply.

### 4.2 Current AI Inventory Snapshot
| Lab/Department | AI Tool Name | Risk Tier | Compliance Status | Notes |
| :--- | :--- | :---: | :--- | :--- |
| **Epidemiology** | ChatGPT (Public) | 3 | Approved | No regulated data entry allowed. |
| **Clinical Trials** | Local Llama 3 | 1 | Pending | Air-gapped on HPC Koa; no external API. |
| **Genomics Lab** | BioGPT | 2 | Approved | BAA in place; "No-Training" clause verified. |
| **Administration** | MS Copilot | 3 | Approved | Standard UH Enterprise deployment. |

---

## 5. Implementation Roadmap (First 90 Days)
1.  **Month 1 (Inventory):** Complete discovery survey of all 3rd-party AI tools across 400 researchers.
2.  **Month 2 (Access Control):** Finalize transition to Yubikey-based MFA for all Tier 1 and Tier 2 data access.
3.  **Month 3 (Audit):** Conduct first site-wide audit against the 110 controls of NIST 800-171/800-53.

---
**Approval Signatures:**

_________________________  
*Information System Security Manager (ISSM)*

_________________________  
*UHCC Director / PI Delegate*
