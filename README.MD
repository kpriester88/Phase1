# Lab Report: Phase 1-W1D1 — Terminal Velocity
Subject: Headless Linux Navigation & Filesystem Mastery 

Status: Completed. 
<br></br>

1. Executive Summary
This lab focused on transitioning from a Graphical User Interface (GUI) to a Command Line Interface (CLI) environment. The primary goal was to navigate the Linux Filesystem Hierarchy Standard (FHS) using "mental sonar" (commands) rather than visual icons.

2. The Mental Model: The Office Building
During this lab, the Linux filesystem was treated as a structured office building to ensure logical navigation:
*The Root (/): The Lobby. The starting point for all paths.
*The Tool Shed (/bin): Where the essential binaries (executable commands) are kept.
*The Manager’s Office (/etc): Where system-wide configuration files are stored.
*The Employee Desks (/home): My personal workspace and user directory.

3. Command Syntax & Grammar

I reinforced the fundamental grammar of the Linux terminal to avoid syntax errors:

| Command | Purpose                                                | Common Flags Used                     |
| ------- | ------------------------------------------------------ | ------------------------------------- |
| pwd     | Print Working Directory: "Where am I in the building?" | N/A                                   |
| ls      | List: "Turn on the lights."                            | \-a (show hidden), -l (long format)   |
| cd      | Change Directory: "Move to another room."              | .. (go up one level), / (go to lobby) |
| cat     | Concatenate: "Read the contents of a file/memo."       | N/A                                   |

4. Key Concepts Mastered

Absolute vs. Relative Paths
*Absolute Paths: Navigating by starting from the Lobby (/). (e.g., /home/student/evidence)
*Relative Paths: Navigating based on my current "desk." (e.g., cd ../reports)

The "Hidden" Room
I learned that files starting with a . are hidden from standard view. To "see through the walls," I must use the specific flag that reveals all contents.

5. Reflections from the Dark Room
*Hardest part: Resisting the urge to use the VS Code file explorer.
*Breakthrough: Realizing that the terminal output is the only truth. If the terminal says a file doesn't exist, I am either in the wrong room or using the wrong path.
























































🛡️ Project: Operation Clean Sweep (Incident Response)
## 📑 Table of Contents
* [Overview](#overview)
* [Tech Stack & Tools](#tech-stack--tools)
* [Core Competencies](#core-competencies-demonstrated)
* [Final Artifact](#final-artifact)
* [Lessons Learned](#-key-takeaway)

## Overview
In this technical simulation, I acted as a Security Analyst performing a post-mortem on a compromised Linux server. The mission required navigating a sabotaged directory structure, restoring system access, and performing forensic data extraction on a 5,000-line corrupted log file.

## Tech Stack & Tools
For this project, Oracle VirtualBox was used along with a remote SSH connection to Visual Studio Code. This simulated a headless virtual machine and provided a safe environment to manipulate files. 

## Core Competencies Demonstrated
System Navigation & Discovery: Located hidden forensic artifacts (.evidence_cache) within restricted system paths (/var/tmp).

Permission & Ownership Recovery: Restored system access using chmod (numeric modes 400/500) and reclaimed file ownership via chown to bypass attacker-imposed lockouts.

Forensic Data Pipeline: Engineered a multi-stage Bash pipeline to sanitize "noisy" logs:

Filtration: Isolated high-priority events using grep.

Sanitization: Used sed (stream editing) to strip malware signatures.

Data Extraction: Leveraged awk to isolate attacker IP addresses and sort | uniq for deduplication.

## Final Artifact
The resulting final_threat_report.txt provides a clean, unique list of malicious IP addresses ready for firewall blacklisting or further investigation.

## Lessons Learned
💡 Key Takeaway: This exercise highlights the importance of Standard Streams in Linux. 
By chaining stdin and stdout through pipes, I was able to transform 5,000 lines of raw data into a specific, actionable intelligence report in seconds—a process that would be impossible to do manually.
