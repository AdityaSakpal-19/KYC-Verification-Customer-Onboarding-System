# KYC Verification & Customer Onboarding System

## 📌 Overview
This project simulates a KYC (Know Your Customer) verification system used in financial institutions to validate customer identity and determine onboarding eligibility based on compliance rules.

---

## 🎯 Objectives
- Validate customer data using rule-based checks
- Identify missing or invalid documents
- Ensure compliance with KYC requirements
- Classify customers into onboarding categories

---

## 📊 Dataset
- Includes:
  - PAN
  - Aadhaar
  - Voter ID
  - Passport
  - Age, City, State
- Contains real-world scenarios:
  - Missing values
  - Invalid formats
  - Inconsistent data

---

## ⚙️ Key Features

### 🔹 Data Cleaning
- Removed formatting issues (e.g., `.0` in Aadhaar)
- Handled missing and inconsistent values

### 🔹 Data Validation
- PAN format validation (10-character structure)
- Aadhaar validation (12-digit numeric)
- Age eligibility check (18+)

### 🔹 Compliance Checks
- PAN–Aadhaar linkage verification
- Multi-document requirement (Voter ID / Passport)

### 🔹 Decision Framework
Customers are classified into:
- **Accepted** → Fully compliant
- **In Process** → Partial compliance (requires review)
- **Rejected** → Non-compliant

Each record includes a **reason for decision**.

---

## 🧠 KYC Logic

The system applies rule-based logic such as:

- Missing PAN/Aadhaar → Rejected  
- Invalid PAN/Aadhaar → Rejected  
- Age < 18 → Rejected  
- PAN-Aadhaar not linked → In Process  
- Missing additional documents → In Process  
- All conditions satisfied → Accepted  

---

## 🛠️ Technologies Used
- SQL (SQLite)
- VS Code

---

## 📌 Sample Output

| Customer | Status | Reason |
|----------|--------|--------|
| Amit Mehta | Accepted | Valid |
| Sneha Gupta | In Process | PAN-Aadhaar not linked |
| Arjun Mehta | Rejected | Invalid Aadhaar |

---

## 🚀 Conclusion
This project demonstrates a structured, rule-based KYC verification system aligned with real-world compliance workflows. It highlights the importance of data validation, document verification, and explainable decision-making in financial onboarding processes.

---

## 🔗 Author
**Aditya Sakpal**
