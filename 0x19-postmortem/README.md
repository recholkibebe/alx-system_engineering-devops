Postmortem: Major Outage on E-Commerce Platform

Issue Summary:

Duration: The outage occurred on June 4, 2024, from 14:00 to 16:30 GMT.

Impact: During the outage, our e-commerce platform experienced significant downtime, resulting in 75% of users being unable to access the site, while the remaining 25% experienced slow load times and intermittent functionality. Users were unable to complete transactions, leading to a substantial drop in revenue and customer satisfaction.

Root Cause: The root cause of the outage was a misconfigured database failover setting that triggered a cascade of failures across our server infrastructure.

Timeline:

14:00 - Issue detected via automated monitoring alerts indicating a sudden drop in server response times and an increase in error rates.
14:05 - Initial investigation by on-call engineer revealed widespread 500 Internal Server Errors across the platform.
14:15 - Escalated to database team after initial investigation suggested potential database connectivity issues.
14:30 - Misleading path: Suspected a DDoS attack due to the pattern of traffic spikes, leading to firewall rules being temporarily adjusted.
15:00 - Further investigation identified that recent changes to the database failover configuration coincided with the start of the issue.
15:15 - Incident escalated to the senior infrastructure team to review database and server logs.
15:45 - Root cause identified: a misconfigured database failover setting caused the primary database to become unresponsive, failing to switch over to the secondary database.
16:00 - Configuration corrected and database services restarted.
16:30 - Full service restored; monitored closely for stability.
Root Cause and Resolution:

Root Cause: The database failover setting was incorrectly configured during a recent update to our failover protocols. This misconfiguration caused the primary database to fail without properly activating the secondary database, resulting in an inability for our application servers to establish database connections.

Resolution: The database configuration was corrected by reverting to the previous, stable settings. The primary database was restarted, and proper failover to the secondary database was verified. Additionally, all services were restarted to clear any lingering connection issues.

Corrective and Preventative Measures:

Improvements Needed:

Implement more rigorous testing procedures for configuration changes, particularly for critical systems like databases.
Enhance monitoring to detect failover issues before they impact users.
Improve documentation and training for on-call engineers to better handle similar issues.
Tasks to Address the Issue:

Patch Database Settings: Review and update the database failover configuration settings.
Add Monitoring: Implement monitoring to specifically track database failover events and connectivity issues.
Automate Failover Testing: Develop automated tests to simulate failover scenarios and ensure configurations are correct.
Update Documentation: Create detailed documentation for database failover procedures and protocols.
Training: Conduct training sessions for on-call engineers and database administrators on handling failover issues.
Review Recent Changes: Audit recent changes to the system to ensure no other potential issues exist.
This incident highlighted the critical nature of maintaining robust failover configurations and the importance of comprehensive monitoring and training. By addressing these areas, we aim to prevent similar outages in the future and improve the resilience of our platform.







