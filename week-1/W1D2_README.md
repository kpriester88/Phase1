# 🛡️ Lab: T1-M1-S02 | The Access Control Matrix

Welcome, Initiate. You are now entering the realm of **The Keymaster**. In Linux, files are protected by a specific set of locks. To pass this lab, you must learn to forge the correct keys using the **Octal Decoder Ring**.

---

## 🔑 The Decoder Ring
Permissions are calculated by summing the values of the bits you wish to grant. Every file has three tiers of access: **User (Owner)**, **Group**, and **Others**.

| Permission | Symbol | Octal Value |
| :--- | :--- | :--- |
| **Read** | `r` | **4** |
| **Write** | `w` | **2** |
| **Execute** | `x` | **1** |
| **None** | `-` | **0** |

---

## 🛠️ Mission 1: The Sum of Power
Before you can run a script, you must grant yourself the right to execute it. 

**The Scenario:** You have a file named `secret_vault.sh`. Currently, your User account has **Read (4)** and **Write (2)** access. You need to add **Execute** access for yourself while leaving Group and Others with zero permissions.

> [!TIP]
> **The Keymaster's Hint:** Look at your Decoder Ring. What numerical value represents **Execute**? If you want to keep **Read (4)** and **Write (2)** for the User, what is the new total sum for that first digit?

**The Command Structure:** `chmod [User][Group][Others] secret_vault.sh`

---

## 🛠️ Mission 2: Facing the "Permission Denied" Wall
Sometimes, even if you know the correct math, the system will bar your path with a **Permission Denied** error. This happens when you try to modify files owned by the system (Root).

**The Scenario:** You are trying to change permissions on a restricted system log, but Linux is blocking you.

> [!CAUTION]
> **The Keymaster's Hint:** Linux is blocking you because you are a standard user trying to modify a restricted file. What command acts as the **"Master Key"** to temporarily elevate your privileges to root? (Hint: It precedes your `chmod` command).

---

## 🧪 Knowledge Check
To complete your entry into the Access Control Matrix, calculate the 3-digit octal codes for these scenarios:

1.  **Full Access for Everyone:** (Read + Write + Execute) for all three tiers.
2.  **The Secure Script:** User can do everything; Group and Others can only Read and Execute.
3.  **The Private Note:** User can Read and Write; no one else can see it.

---

### 🛡️ Validation
Once you have calculated your codes, apply them in your terminal. Use `ls -l` to see if your "bits" match your intent.
