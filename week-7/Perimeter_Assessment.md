# TITANCORP: PERIMETER ASSESSMENT REPORT
**Operator:** **Target Subnet:** 172.88.0.0/24

## PHASE 1: ACTIVE ENUMERATION (NMAP)
*(List the live IPs discovered and their running services/versions)*
* **Host 1 ([172.88.0.10]):** [http/nginx 1.14.2]
* **Host 2 ([172.88.0.15]):** [no service running/closed tcp ports]
* **Host 3 ([172.88.0.20]):** [http/apache httpd 2.4.67(unix)]

## PHASE 2: VULNERABILITY AUDIT (NIKTO)
*(Run Nikto against the TWO web servers discovered above. List one major finding for each.)*
* **Web Server 1 Finding:** [Missing X-Frame Options]
* **Web Server 2 Finding:** [Active TRACE method (XST vulnerability)]

## PHASE 3: RISK TRIAGE
*(Review your findings. Identify the SINGLE highest-risk vulnerability across the entire DMZ. Justify why it is the top priority using the Likelihood x Impact formula.)*

* **Top Priority Remediation:** [Active TRACE method (XST vulnerability)]
* **Justification:** [An attacker can use the TRACE method to bypass HttpOnly cookie flags and steal sensitive session information or credentials via a Cross-Site Scripting (XSS) attack.]
