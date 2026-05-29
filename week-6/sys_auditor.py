import os

# Define variables
hostname = "192.168.1.170"  # Your Windows DC IP
log_file = "/var/log/dc_audit.log"

# Perform the ping (4 packets)
response = os.system(f"ping -c 4 {hostname} > /dev/null 2>&1")

# Check status and write to log
with open(log_file, "a") as f:
    if response == 0:
        f.write("DC is UP\n")
    else:
        f.write("DC is DOWN\n")

# Logic for Disk Space Audit (Phase 2 requirement)
os.system(f"df -h >> /var/log/sys_audit.log")
