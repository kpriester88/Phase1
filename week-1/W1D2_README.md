# 🛡️ My Journey into the Access Control Matrix (T1-M1-S02)

This repository documents my descent into the core of Linux file permissions. As a cybersecurity student, I realized early on that if you don't understand the **Keymaster’s** rules, the system will shut you out. 

Below is the breakdown of how I learned to decode the binary-to-octal logic that governs every file in a Linux environment.

---

## 🔑 Cracking the Decoder Ring
When I first saw `rwxr-xr-x`, it looked like alphabet soup. I had to stop thinking in letters and start thinking in **bits**. I learned that every permission is actually a mathematical sum of three specific values:

| Permission | Symbol | Value | My Mental Note |
| :--- | :--- | :--- | :--- |
| **Read** | `r` | **4** | "I can see the data." |
| **Write** | `w` | **2** | "I can change the data." |
| **Execute** | `x` | **1** | "I can run the program." |

---

## 🛠️ Phase 1: The "Sum of Power" Struggle
My first real challenge was a script called `secret_vault.sh`. I could read it and write to it, but the system wouldn't let me run it. 

**The Problem:** My User account had `Read (4)` and `Write (2)`.
**The Mission:** Add `Execute (1)` without losing what I already had.

> [!TIP]
> **My Breakthrough:** I realized I didn't just pick a new number; I had to **sum** them. If I wanted all three, I had to calculate $4 + 2 + 1$. Finding that total for the first digit was the moment the "Octal" system finally clicked for me.

---

## 🛠️ Phase 2: Hitting the "Permission Denied" Wall
Even after I mastered the math, I hit a wall. I tried to modify a system log, and the terminal spit back: `Permission Denied`. 

**The Realization:** I was a "standard user" trying to touch "root" territory. 
**The Solution:** I had to find the **"Master Key."** > [!IMPORTANT]
> I learned that even if my `chmod` math was perfect, I needed a prefix to tell the system: *"I have the authority to do this."* Finding that specific command felt like finally getting the keys to the kingdom. It’s a reminder that in security, identity is just as important as the command itself.

---

## 🧪 My Final Knowledge Checks
I forced myself to calculate these manually before checking the man pages. These are the "keys" I had to forge to pass the module:

1.  **The "Open Door" (Full Access):** What happens when you sum (4+2+1) for the User, Group, and Others?
2.  **The "Shielded Script":** Giving myself full power (7), but restricting the Group and Others to only "Read and Execute." (What is 4 + 1?)
3.  **The "Ghost Note":** A file only I can see and edit, leaving the rest of the world (Group/Others) at a total of 0.

---

### 🛡️ Final Reflection
Mastering `chmod` wasn't about typing numbers; it was about understanding the **Access Control Matrix**. Every time I run `ls -l` now, I don't see letters—I see the mathematical barriers I've learned to build and break.

**Current Status:** Permission Granted.
