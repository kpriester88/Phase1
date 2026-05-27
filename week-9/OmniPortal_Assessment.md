# OMNI-PORTAL ASSESSMENT REPORT
**Operator:** **Deadline:** May 13 @ 11:59 PM 

## PHASE 1: AUTH BYPASS (SQLi)
* **Payload Used: admin' -- **
* **Result: {"amount": "$50.00", "details":"Office Supplies", "order_id":502} ** 

## PHASE 2: CLIENT-SIDE HIJACK (XSS)
* **Stored XSS Payload: <script>alert(document.cookie);</script> **
* **Secret Cookie Captured: auth_token=SUPPORT_TIER_1_SECRET_TOKEN **

## PHASE 3: API ENUMERATION (BOLA)
* **Insecure Order ID: 501**
* **Confidential Data Leaked: "amount":"$15,000.00","details":"Confidential Server Lease","order_id":501**

## PHASE 4: THE REMEDIATION
* **Fix for SQLi: The coding practice that eliminates SQL Injection at the source is the use of Prepared Statements (also known as Parameterized Queries)**

* **Fix for XSS: Before rendering user-supplied data back to the browser, the application must convert special characters into their safe, HTML-entity equivalents (e.g., < becomes &lt;, > becomes &gt;). **
** This ensures the browser treats the data as literal text to be displayed rather than interpreted HTML or JavaScript. **

* **Fix for API BOLA: Extract the user_id from the secure server-side session, never from user-supplied input.**
**Query the database using both the record ID and the session user_id to ensure ownership, returning a 403 Forbidden if no match is found.**
