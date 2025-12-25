# Terraform Functions Mastery 🚀

This repository demonstrates the practical application of Terraform's built-in functions to solve real-world DevOps scenarios. Each assignment focuses on a specific challenge—from naming conventions to dynamic security groups—showing how to manipulate data programmatically in Infrastructure as Code.

## 📋 Table of Contents
1. [Assignment 1: Naming Convention Enforcer](#assignment-1-naming-convention-enforcer)
2. [Assignment 2: Tag Compliance & Merging](#assignment-2-tag-compliance--merging)
3. [Assignment 3: S3 Bucket Name Sanitizer](#assignment-3-s3-bucket-name-sanitizer)
4. [Assignment 4: Dynamic Security Group Loop](#assignment-4-dynamic-security-group-loop)
5. [How to Run](#how-to-run)

---

## Assignment 1: Naming Convention Enforcer
**Goal:** Prevent deployment failures by standardizing user input into valid cloud resource names.

* **Functions:** `lower()`, `replace()`
* **Scenario:** A developer inputs a messy project name like `"Mega App PROJECT 2025"`. Cloud providers (AWS/Azure) reject spaces and uppercase letters in resource IDs.
* **The Solution:** A logic layer that automatically converts inputs to lowercase and replaces spaces with hyphens.

**Transformation:**
| Input (Variable) | Output (Sanitized) |
| :--- | :--- |
| `"Mega App PROJECT 2025"` | `"mega-app-project-2025-production"` |

**Key Logic (`main.tf`):**
```hcl
locals {
  # 1. Lowercase the input
  # 2. Replace spaces with hyphens
  sanitized_name = replace(lower(var.raw_project_name), " ", "-")
}
