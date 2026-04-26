# CLOUDNANO REMEDIATION PLAN
**Operator:** ## TOP 5 CRITICAL FIXES
*(From the 20 raw findings, select the 5 that pose the greatest ACTUAL risk. Explain your reasoning.)*

1. **[CVSS 9.8 Unauthenticated AWS S3 Bucket]**
   * **Justification:** [This can be indexed by an automatic scanner and also contains personable identifiable information, which can lead to massive legal issues.]

2. **[CVSS 8.1 SQL Injection in Login Page]**
   * **Justification:** [It is a well understood attack vector and someone can easily bypass authentication, to either take control, dump the database or delete records.]

3. **[CVSS 9.8 Remote Code Execution in Apache Struts]**
   * **Justification:** [It is internet facing and it can allow an attacker to take full control of the system, to either enter other systems or shut down services.]

4. **[CVSS 9.0 SMBv1 Enabled (Internal HR File Server)]**
   * **Justification:** [This contains personal data such as SSNs and salaries, which someone has to have access to already, being that it is internal. It lessens the likelihood compared to something public facing.]

5. **[CVSS 8.8 Cross-Site Scripting (XSS) on Support Forum]**
   * **Justification:** [This is public facing, which can be attacked using malicious scripts and can be used to steal session cookies or account takeovers.]
