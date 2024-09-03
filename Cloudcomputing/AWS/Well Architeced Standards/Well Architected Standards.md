# **ONLY SUBMIT HTTPS URLS**

### 1. Amazon S3

- **🔴 Bucket Encryption Enabled**: Ensures that all data stored in the bucket is encrypted, providing enhanced security.
- **🔴 Use Policies rather than ACLs**: Policies offer more flexibility and security control than Access Control Lists (ACLs).
- **🔴 Enable Versioning**: To protect against accidental or malicious deletions by maintaining multiple versions of objects.
- **Enable MFA Delete**: Adds an extra layer of security for object deletion by requiring multi-factor authentication.
- **Use Lifecycle Policies**: To manage data retention and optimize storage costs by automatically transitioning or deleting objects.
- **Enable Bucket Logging**: For tracking access to your S3 buckets, which is essential for auditing and security analysis.

### 2. Amazon EC2

- **🔴 EC2 instance Tagging**: Always Tag EC2 Instances
- **🔴 EC2 in Private Subnets**: Protects instances from direct exposure to the internet by placing them in private subnets.
- **🔴 Apply Security Groups**: Implement fine-grained network access control at the instance level to limit incoming and outgoing traffic.
- **🔴 Use IAM Roles for EC2**: Manage permissions securely without embedding credentials in your instances.
- **🔴 Use autoscalling with target tracking policys on ALB requests**
- **Implement CloudWatch Alarms**: To monitor instance performance and receive notifications when thresholds are breached.

### 3. Amazon RDS

- **🔴 Enable Automated Backups**: To enable point-in-time recovery, ensuring your database can be restored to any specific time within the backup retention period.
- **🔴 Use Multi-AZ Deployments**: For high availability and automatic failover support in case of a primary instance failure.
- **🔴 Encrypt RDS Instances**: To protect data at rest by using AWS Key Management Service (KMS) encryption.
- **Disallow Unrestricted Network Access**: Limit access to your RDS instances by restricting IP ranges and using security groups.

### 4. Amazon VPC

- **🔴 No SSH Port 22 Open**: Avoid exposing SSH ports to the internet. Use bastion hosts or VPNs for secure access to your instances.
- **🔴 Max one SG with 0.0.0.0/0 as ingress**
- **🔴 Implement Subnet Isolation**: Use private subnets for sensitive resources, keeping them isolated from the public internet.
- **🔴 Enable VPC Flow Logs**: For monitoring and troubleshooting network traffic, providing visibility into the IP traffic going to and from network interfaces.
- **Use Network ACLs**: For an additional layer of security, controlling inbound and outbound traffic at the subnet level.

### 5. Amazon DynamoDB

- **🔴 DynamoDB Encryption Enabled**: Protects sensitive data by encrypting it at rest using AWS KMS.
- **🔴 Use On-Demand Backup and Restore**: To ensure data durability by allowing you to create full backups of your tables for long-term retention.
- **Enable DynamoDB Streams**: For capturing and reacting to changes in your DynamoDB tables.
- **Implement DynamoDB Autoscaling**: To automatically adjust read/write throughput capacity based on traffic patterns.

### 6. AWS Lambda

- **🔴 Set Up CloudWatch Alarms**: For monitoring Lambda function performance and handling failures proactively.
- **🔴 Use IAM Policies**: To control access and permissions for Lambda functions, ensuring least privilege.
- **Configure Dead Letter Queues (DLQs)**: To handle failed executions and ensure errors are not lost.

### 7. Amazon CloudFront

- **🔴 Enable HTTPS**: To secure data in transit by encrypting communication between clients and CloudFront.
- **🔴 Configure Web Application Firewall (WAF)**: To protect your web applications from common web exploits and vulnerabilities.
- **Set Up Cache Behaviors**: To optimize content delivery by defining how CloudFront caches different objects.

### 8. Amazon Elastic Load Balancing (ELB)

- **🔴 Always Use an ELB**: To distribute incoming application traffic across multiple targets, ensuring high availability.
- **🔴 Use Health Checks**: To ensure that traffic is only sent to healthy instances, improving application reliability.
- **🔴 Configure Web Application Firewall (WAF)**: To protect applications behind the load balancer from attacks.
- **Enable Access Logs**: For detailed request information, useful for troubleshooting and analytics.
- **Configure SSL/TLS**: To secure traffic between clients and the load balancer with encryption.

### 9. Amazon EBS

- **🔴 Enable Encryption**: To secure data at rest on your EBS volumes using AWS KMS.
- **Use Snapshots**: For backups and disaster recovery, allowing you to restore your volumes at any time.
- **Monitor Performance**: With CloudWatch metrics and alarms to ensure EBS volumes are performing as expected.

### 10. Amazon CloudWatch

- **🔴 Set Up Alarms**: To proactively address operational issues by monitoring your AWS resources and applications.
- **Use CloudWatch Logs**: For detailed monitoring and troubleshooting by capturing logs from AWS resources.
- **Implement Dashboards**: To visualize and monitor metrics, logs, and alarms in a single view.

### 11. AWS IAM

- **🔴 Follow Least Privilege Principle**: Grant only the permissions necessary for users, groups, and roles to perform their tasks.
- **🔴 Enable MFA**: For additional security on IAM users, requiring two forms of authentication.
- **Regularly Review and Rotate Credentials**: To minimize security risks by frequently updating and auditing access keys and passwords.

### 12. AWS CloudTrail

- **🔴 Enable Multi-Region Trails**: To capture and store API activity across all AWS regions, ensuring comprehensive logging.
- **Store Logs in S3**: For durability and long-term storage of CloudTrail logs.
- **Integrate with CloudWatch Logs**: For real-time monitoring, alerting, and automated responses to logged events.

### 13. Amazon ElastiCache

- **Use Parameter Groups**: For managing and optimizing configuration settings tailored to your use case.
- **Enable Automated Backups**: For data protection and recovery, ensuring you can restore your cache in case of failure.
- **Monitor Performance Metrics**: Using CloudWatch to track and optimize ElastiCache performance.

### 14. Amazon Route 53

- **Enable DNS Failover**: For high availability by routing traffic to healthy resources.
- **Configure Health Checks**: To ensure that DNS queries are directed to operational endpoints.
- **Implement Route Policies**: For optimized routing based on latency, geolocation, and other factors.

### 15. Amazon SQS

- **Enable Dead Letter Queues**: For handling message processing failures by storing undeliverable messages.
- **Use Message Retention Policies**: To manage the lifespan of messages in the queue.
- **Configure Visibility Timeout**: To prevent message duplication during processing by temporarily hiding a message after it has been received.

### 16. Amazon SNS

- **🔴 Use Encryption**: For securing message payloads in transit and at rest.
- **Set Up Topic Policies**: For controlling access to SNS topics and ensuring proper authorization.
- **Monitor and Archive Logs**: For tracking message delivery and processing, essential for auditing and troubleshooting.

### 17. AWS Elastic Beanstalk

- **Configure Environment Variables**: For managing application settings securely across different environments.
- **Use Managed Platform Updates**: To keep your environment up-to-date with the latest security patches and software versions.
- **Set Up Auto Scaling**: To automatically adjust capacity based on application load, ensuring performance and cost-efficiency.

### 18. AWS CodePipeline

- **Enable Pipeline Notifications**: For monitoring the status and failures of your pipelines, allowing you to react quickly.
- **Use Source Control Integration**: For versioning and managing code changes effectively within your pipeline.
- **Implement Deployment Approvals**: To control deployment processes, ensuring that only authorized changes are pushed to production.

### 19. AWS CodeBuild

- **Configure Build Specifications**: For consistent and repeatable build and deployment processes.
- **Monitor Build Logs**: For troubleshooting build issues and ensuring smooth operations.
- **Use IAM Roles**: For securely managing build permissions and isolating environments.

### 20. AWS CodeDeploy

- **Set Up Deployment Groups**: For managing deployment targets and ensuring consistent and controlled rollouts.
- **Use Hooks for Custom Actions**: To perform pre and post-deployment activities, enabling customized deployment workflows.
- **Monitor Deployment Status**: To track progress, detect errors, and ensure successful deployments.

### 21. Amazon Aurora

- **Enable Continuous Backup**: For point-in-time recovery, ensuring that you can restore your database to any specific time.
- **Use Multi-Master Configuration**: For high availability and scalability by enabling multiple write instances.
- **Monitor Performance**: Using Amazon CloudWatch metrics to ensure your Aurora database is optimized and performing well.

### 22. Amazon Redshift

- **🔴 Use Encryption**: To protect data at rest and in transit, ensuring your data warehouse is secure.
- **Enable Automated Snapshots**: For data recovery and backup, ensuring you can restore your Redshift cluster if needed.
- **Configure Workload Management (WLM)**: To manage query performance and resource allocation in your Redshift cluster.

### 23. Amazon Kinesis

- **Enable Data Retention**: To store data for longer periods, allowing for deeper analysis and reprocessing of streams.
- **Use Enhanced Fan-Out**: For improved data processing efficiency, enabling consumers to retrieve data from Kinesis streams faster.
- **Monitor Shard Metrics**: To manage and optimize data streams by tracking shard utilization and performance.

### 24. AWS Glue

- **Use Data Catalog**: For metadata management and data discovery, enabling efficient data processing and querying.
- **Enable Job Bookmarks**: For incremental data processing, ensuring that only new or updated data is processed in subsequent runs.
- **Monitor Job Metrics**: To optimize performance and troubleshoot issues by tracking AWS Glue job execution details.

### 25. Amazon SageMaker

- **🔴 Enable Model Monitoring**: For tracking and evaluating model performance over time, ensuring accuracy and reliability.
- **Use Version Control for Models**: To manage model versions and ensure reproducibility of your machine learning experiments.
- **Implement Automated Hyperparameter Tuning**: For optimizing model performance by automatically adjusting training parameters.

### 26. AWS Secrets Manager

- **🔴 Enable Automatic Rotation**: To regularly update and secure your secrets without manual intervention.
- **Use IAM Policies for Access Control**: To ensure that only authorized entities can access your secrets.
- **Integrate with AWS Lambda**: For custom secret rotation and management workflows, ensuring flexibility and automation.

### 27. AWS KMS (Key Management Service)

- **🔴 Use Customer Managed Keys (CMKs)**: For enhanced control over encryption keys, allowing you to define key policies and manage key rotations.
- **Enable Automatic Key Rotation**: To ensure encryption keys are rotated regularly, reducing the risk of key compromise.
- **Use IAM Policies to Control Access**: To ensure that only authorized users and services can access and use your encryption keys.

### 28. Amazon CloudFormation

- **🔴 Implement Stack Policies**: To protect critical resources during updates, preventing unintended changes.
- **Use Nested Stacks**: For modular and reusable CloudFormation templates, enabling easier management of large infrastructures.
- **Set Up Change Sets**: To preview changes before applying them, ensuring that updates do not disrupt existing resources.

### 29. AWS OpsWorks

- **🔴 Use Layers**: To organize and manage resources logically within stacks, improving operational efficiency.
- **Enable Auto Healing**: To automatically replace failed instances, ensuring high availability.
- **Use Custom Cookbooks**: For greater control over configuration management, allowing customization of deployment and management processes.

### 30. AWS Systems Manager

- **🔴 Enable Session Manager**: For secure and auditable access to EC2 instances without needing SSH or RDP.
- **Implement Automation Documents**: To automate common maintenance and deployment tasks, reducing manual intervention.
- **Use Parameter Store**: For managing configuration data and secrets securely, ensuring that sensitive information is encrypted and accessible only by authorized entities.

### 31. Amazon WorkSpaces

- **🔴 Enable Multi-Factor Authentication (MFA)**: To add an extra layer of security for user access to WorkSpaces.
- **Use Amazon WorkDocs**: For secure file storage and collaboration within the WorkSpaces environment.
- **Implement IP Access Control Groups**: To restrict access to WorkSpaces based on IP addresses, enhancing security.

### 32. Amazon GuardDuty

- **🔴 Enable GuardDuty**: For continuous monitoring and threat detection across your AWS environment.
- **Set Up Findings Notifications**: To receive alerts and take immediate action on security issues detected by GuardDuty.
- **Integrate with AWS Security Hub**: For centralized security management, enabling comprehensive threat detection and incident response.

### 33. AWS Security Hub

- **🔴 Enable Security Hub**: For centralized security management across your AWS accounts, providing a comprehensive view of your security posture.
- **Use Custom Security Standards**: To tailor Security Hub findings and recommendations to your organization's specific needs.
- **Integrate with AWS Config**: For continuous compliance monitoring and automated remediation of security issues.

### 34. Amazon Inspector

- **🔴 Run Regular Assessments**: To identify vulnerabilities and deviations from best practices in your AWS resources.
- **Set Up Notifications**: To be alerted of new findings and vulnerabilities, enabling prompt remediation.
- **Integrate with AWS Lambda**: For automated response to Inspector findings, ensuring immediate action is taken on critical issues.

### 35. AWS Config

- **🔴 Enable Config Rules**: For continuous compliance monitoring, ensuring resources conform to your specified configurations.
- **Set Up Remediation Actions**: To automatically fix non-compliant resources, maintaining your security and compliance posture.
- **Integrate with AWS CloudTrail**: To track changes to resources and ensure they remain compliant over time.

### 36. Amazon Macie

- **🔴 Enable Macie**: For automated data discovery, classification, and protection of sensitive information stored in S3.
- **Set Up Findings Notifications**: To be alerted of sensitive data discovery, enabling immediate action to protect it.
- **Integrate with AWS Security Hub**: For centralized management of Macie findings, providing a unified view of your security posture.

### 37. AWS Firewall Manager

- **🔴 Use Firewall Manager**: To centrally manage firewall rules and security policies across multiple AWS accounts.
- **Set Up Security Policies**: To ensure consistent application of firewall rules across your organization.
- **Monitor Compliance**: To ensure that all accounts and resources adhere to your security policies, enabling quick remediation of non-compliant resources.

### 38. AWS WAF (Web Application Firewall)

- **🔴 Implement WAF Rules**: To protect your web applications from common threats like SQL injection and cross-site scripting.
- **Set Up Rate-Based Rules**: To protect against DDoS attacks by limiting the number of requests from a single IP address.
- **Integrate with AWS Firewall Manager**: For centralized management of WAF rules across multiple accounts.

### 39. AWS Shield

- **🔴 Enable AWS Shield Advanced**: For enhanced DDoS protection, including cost protection and 24/7 access to the AWS DDoS Response Team (DRT).
- **Set Up Health Checks**: To ensure that traffic is only routed to healthy endpoints during an attack, improving application resilience.
- **Monitor Shield Metrics**: To track the performance and effectiveness of DDoS mitigation efforts, ensuring your resources are protected.

### 40. AWS Control Tower

- **🔴 Set Up Landing Zones**: For a secure and scalable multi-account AWS environment, enabling best practices from the start.
- **Use Guardrails**: To enforce mandatory and optional policies that ensure compliance and security across your AWS accounts.
- **Monitor Account Activity**: To ensure that all accounts comply with organizational policies and best practices, enabling quick detection of deviations.

### 41. AWS Organizations

- **🔴 Enable Service Control Policies (SCPs)**: To centrally manage permissions across your AWS accounts, ensuring compliance with organizational policies.
- **Use Consolidated Billing**: For easier financial management across multiple AWS accounts, enabling cost optimization and tracking.
- **Monitor and Audit Activities**: To ensure that all accounts and resources comply with your organization's security and governance policies.

### 42. AWS Well-Architected Tool

- **🔴 Regularly Review Workloads**: To ensure they adhere to AWS best practices across the five pillars: operational excellence, security, reliability, performance efficiency, and cost optimization.
- **Use Lens for Specialized Guidance**: To receive tailored recommendations based on specific use cases, such as serverless, SaaS, or machine learning workloads.
- **Implement Improvement Plans**: Based on Well-Architected reviews, to continuously enhance the security, performance, and cost-efficiency of your workloads.

### 43. AWS Service Catalog

- **🔴 Define Product Portfolios**: To manage and govern IT services across your organization, ensuring consistency and compliance.
- **Set Up Constraints**: To control how products can be used, ensuring compliance with organizational policies.
- **Monitor Product Usage**: To track the deployment and use of products, ensuring they meet business and security requirements.

### 44. AWS CodeStar

- **🔴 Use Integrated Development Environments (IDEs)**: For seamless development and deployment workflows within AWS, improving efficiency and collaboration.
- **Set Up CI/CD Pipelines**: For automated testing and deployment, ensuring quick and reliable application delivery.
- **Monitor Project Metrics**: To track progress and identify bottlenecks, ensuring smooth development and deployment cycles.

### 45. AWS Step Functions

- **🔴 Use Step Functions for Orchestration**: To manage and automate complex workflows, ensuring reliability and scalability.
- **Implement Error Handling**: To ensure workflows can recover from failures, improving the resilience of your applications.
- **Monitor Workflow Execution**: To track and troubleshoot workflows, ensuring they perform as expected.

### 46. AWS Elemental Media Services

- **🔴 Use MediaPackage for Content Protection**: To secure video content with encryption and DRM, ensuring it is protected during distribution.
- **Set Up MediaTailor for Targeted Ads**: To deliver personalized advertising, improving viewer engagement and revenue.
- **Monitor Media Services Performance**: To ensure high-quality streaming and quick detection of issues, ensuring a smooth viewing experience.

### 47. Amazon QuickSight

- **🔴 Enable Row-Level Security**: To restrict data access based on user roles, ensuring sensitive information is protected.
- **Use SPICE for Fast Performance**: To speed up analysis and dashboard performance, enabling real-time insights.
- **Monitor Usage Metrics**: To track how users interact with QuickSight dashboards, optimizing for performance and engagement.

### 48. AWS IoT Core

- **🔴 Implement Device Authentication**: To ensure that only authorized devices can connect to your IoT applications, enhancing security.
- **Use AWS IoT Device Defender**: To monitor and audit IoT device fleets for security issues, enabling quick detection and remediation.
- **Set Up IoT Rules for Data Processing**: To automate the processing and routing of IoT data, ensuring efficient data management and integration.

### 49. AWS GameLift

- **🔴 Use Auto-Scaling**: To automatically adjust game server capacity based on player demand, ensuring optimal performance and cost-efficiency.
- **Implement Matchmaking with FlexMatch**: To create balanced matches, improving the player experience and engagement.
- **Monitor Game Server Health**: To ensure that game servers are performing well and quickly detect any issues that might impact gameplay.

### 50. AWS App Mesh

- **🔴 Use App Mesh for Microservices**: To manage and monitor microservices communication, ensuring reliability and observability.
- **Implement Traffic Control Policies**: To manage how traffic is routed between services, enabling blue/green deployments and canary releases.
- **Monitor Service Mesh Performance**: To track and optimize the performance of your microservices, ensuring they are running efficiently.

### 51. AWS Elastic Kubernetes Service (EKS)

- **🔴 Enable Control Plane Logging**

### 52. Elastic Container Registry (ECR)

- **🔴 Enable Image Scanning**
- **🔴 Enable Tag Immutability**
- **🔴 Enable Encryption**
