# Terraform Functions Mastery 🚀

This repository contains practical, real-world examples of Terraform built-in functions. Each assignment simulates a specific DevOps challenge to demonstrate how to write cleaner, more dynamic Infrastructure as Code.

## 📂 Repository Overview

### 1. Assignment 1: Naming Convention Enforcer
* **Location:** `assignment1/`
* **The Scenario:** Developers often input project names with spaces and mixed capitalization (e.g., "Mega App"), but cloud resources require strict formatting.
* **The Logic:** We use `lower()` and `replace()` to standardize inputs.

| Input Variable | Terraform Output |
| :--- | :--- |
| `"Mega App PROJECT 2025"` | `"mega-app-project-2025"` |

---

### 2. Assignment 2: Tag Compliance Manager
* **Location:** `assignment2/`
* **The Scenario:** To track costs, organizations require mandatory tags (like `CostCenter`) on every resource. Developers often forget these.
* **The Logic:** We use `merge()` to automatically enforce corporate tags alongside project-specific tags.

| Corporate Tags | Project Tags | Final Merged Tags |
| :--- | :--- | :--- |
| `{CostCenter = "CC-1"}` | `{Env = "Dev"}` | `{CostCenter="CC-1", Env="Dev"}` |

---

### 3. Assignment 3: S3 Bucket Name Sanitizer
* **Location:** `assignment3/`
* **The Scenario:** S3 bucket names are strict: max 63 chars, lowercase, no special symbols. Messy inputs cause deployment failures.
* **The Logic:** A cleaning pipeline using `lower()`, `replace()` (Regex), and `substr()`.

| Raw Input | Sanitized Output |
| :--- | :--- |
| `"My_Super_Long_Backup_Bucket!!!"` | `"mysuperlongbackupbucket"` |

---

### 4. Assignment 4: Dynamic Security Group Rules
* **Location:** `assignment4/`
* **The Scenario:** Security teams provide allowed ports as a simple comma-separated string (e.g., `"80,443"`). Writing manual rules for each is inefficient.
* **The Logic:** We use `split()` to create a list and a `for` loop to generate rules dynamically.

| Input String | Dynamic Output (Resources) |
| :--- | :--- |
| `"80,443"` | Creates 2 Ingress Rules (TCP 80, TCP 443) |

---

## 🚀 How to Run

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/19BCS4520/Terraform-Functions.git](https://github.com/19BCS4520/Terraform-Functions.git)
    ```

2.  **Navigate to an assignment:**
    ```bash
    cd assignment1  # Or assignment2, assignment3, assignment4
    ```

3.  **Run Terraform:**
    ```bash
    terraform init
    terraform apply -auto-approve
    ```
