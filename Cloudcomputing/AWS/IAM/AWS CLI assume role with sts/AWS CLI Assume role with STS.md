```yaml
ROLE_ARN=
```

```yaml
ROLE_SESSION_NAME=
```

```yaml
# Assume the role and capture the output JSON containing temporary credentials
assumed_role_credentials=$(aws sts assume-role --role-arn $ROLE_ARN --role-session-name $ROLE_SESSION_NAME)

# Extract the temporary credentials from the JSON output
export AWS_ACCESS_KEY_ID=$(echo $assumed_role_credentials | jq -r '.Credentials.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $assumed_role_credentials | jq -r '.Credentials.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $assumed_role_credentials | jq -r '.Credentials.SessionToken')

# Now you can use AWS CLI commands with the assumed role credentials
aws sts get-caller-identity

```
