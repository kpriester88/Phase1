# TARGET THREAT PROFILE: CloudNano 
**Classification:** Passive Security Audit
**Operator: Kevon Priester**

 ## 1. Subdomain Discovery 
* **Tool Used: Sublist3r**
* **Subdomains Found:** 

* [about.nike.com] 
* [investors.nike.com] 

## 2. Tech Stack Mapping 
* **Tool Used:** BuiltWith / Wappalyzer
* **Identified Technologies (CMS/CDN/Backend):** * [Headless CMS: Contentful] 
  * [CDN: Cloudflare, cdnjs, Akamai] [Web server: Next.js ver 15.5.11 ]

## 3. Major Exposure Points & Dangers 
*(List three major exposure points discovered during your OSINT audit and explain why they are dangerous)*
1. **[Next.js web server]:** [Remote Code Execution (CVE-2025-66478): A critical vulnerability (CVSS 10.0) was identified in late 2025 in the React Server Components protocol.] 
2. **[Next.js web server]:** [Denial of Service (DoS): CVE-2024-56332 allowed attackers to hang Server Action requests, leading to "Denial of Wallet" for developers on pay-per-execution hosting providers.] 
3. **[Cloudflare/Akamai]:** [Origin Bypass: If an attacker finds the direct IP address of your Next.js server, they can bypass the CDN entirely, rendering your Cloudflare/Akamai WAF useless.] 
