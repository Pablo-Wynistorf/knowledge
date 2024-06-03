1. Log in to the AWS Management Console and go to the IAM dashboard.
1. Click on the "Roles" option in the left-hand menu and then click on the "Create role" button.
1. Select the "AWS service" option and then choose the "EC2" service.
1. In the "Select your use case" section, choose "EC2 Instance Profile" and click on the "Next: Permissions" button.
1. In the "Attach permissions policies" section, search for "AmazonSSMManagedInstanceCore" and select it. This policy provides the necessary permissions for EC2 instances to use the Session Manager service.
1. Click on the "Next: Review" button and give your role a name.
1. Review the details of the role and click on the "Create role" button to create the session manager role.
