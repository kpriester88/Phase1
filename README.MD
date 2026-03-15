🛡️ Project: Operation Clean Sweep (Incident Response)
## 📑 Table of Contents
* [Overview](#overview)
* [Tech Stack & Tools](#-tech-stack--tools)
* [Core Competencies](#core-competencies-demonstrated)
* [Final Artifact](#final-artifact)
* [Lessons Learned](#-key-takeaway)

# Overview
In this technical simulation, I acted as a Security Analyst performing a post-mortem on a compromised Linux server. The mission required navigating a sabotaged directory structure, restoring system access, and performing forensic data extraction on a 5,000-line corrupted log file.

# Tech Stack & Tools
For this project, Oracle VirtualBox was used along with a remote SSH connection to Visual Studio Code. This simulated a headless virtual machine and provided a safe environment to manipulate files. 

# Core Competencies Demonstrated
System Navigation & Discovery: Located hidden forensic artifacts (.evidence_cache) within restricted system paths (/var/tmp).

Permission & Ownership Recovery: Restored system access using chmod (numeric modes 400/500) and reclaimed file ownership via chown to bypass attacker-imposed lockouts.

Forensic Data Pipeline: Engineered a multi-stage Bash pipeline to sanitize "noisy" logs:

Filtration: Isolated high-priority events using grep.

Sanitization: Used sed (stream editing) to strip malware signatures.

Data Extraction: Leveraged awk to isolate attacker IP addresses and sort | uniq for deduplication.

# Final Artifact
The resulting final_threat_report.txt provides a clean, unique list of malicious IP addresses ready for firewall blacklisting or further investigation.

# Lessons Learned
💡 Key Takeaway: This exercise highlights the importance of Standard Streams in Linux. 
By chaining stdin and stdout through pipes, I was able to transform 5,000 lines of raw data into a specific, actionable intelligence report in seconds—a process that would be impossible to do manually.
