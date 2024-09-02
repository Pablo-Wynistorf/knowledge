In .aws the config file:

```bash
[profile default]
role_arn = arn:aws:iam::982677561872:role/scs-account-admin
source_profile = scs-account-admin
region = eu-central-1
sso_account_id = 594398008037
sso_start_url = https://skills53.awsapps.com/start#
sso_region = us-east-1

[profile scs-account-admin]
sso_role_name = scs-champion
sso_account_id = 594398008037
sso_start_url = https://skills53.awsapps.com/start#
sso_region = us-east-1
sso_registration_scopes = sso:account:access
```

```bash
aws sso login
```
