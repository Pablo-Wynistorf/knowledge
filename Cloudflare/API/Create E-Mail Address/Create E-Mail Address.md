```yaml
curl --request POST \
  --url https://api.cloudflare.com/client/v4/zones/$ZONEID/email/routing/rules \
  --header 'Content-Type: application/json' \
  --header 'X-Auth-Email: $X-Auth-Email' \
  --header 'X-Auth-Key: $X-Auth-Key' \
  --data '{
  "actions": [
    {
      "type": "forward",
      "value": [
        "$FORWARD-ADDRESS"
      ]
    }
  ],
  "enabled": true,
  "matchers": [
    {
      "field": "to",
      "type": "literal",
      "value": "$ALIAS@DOMAIN"
    }
  ],
  "name": "Create email address",
  "priority": 0
}'
```

```yaml
curl --request DELETE \
  --url https://api.cloudflare.com/client/v4/zones/$ZONEID/email/routing/rules/$MAILADDRESS \
  --header 'Content-Type: application/json' \
  --header 'X-Auth-Email: $X-Auth-Email' \
  --header 'X-Auth-Key: $X-Auth-Key' \
```
