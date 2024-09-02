```
curl -X POST "https://api.cloudflare.com/client/v4/zones/[Zone ID]/dns_records" \
     -H "X-Auth-Email: [Account E-Mail]" \
     -H "X-Auth-Key: [Account Auth Key]" \
     -H "Content-Type: application/json" \
     --data '{"type":"cname","name":"[subdomain].[domain]","content":"[cname domain]","ttl":1,"priority":10,"proxied":false}'
```

```rust
curl -X POST "https://api.cloudflare.com/client/v4/zones/[Zone ID]/dns_records" -H "X-Auth-Email: [Account E-Mail]" -H "X-Auth-Key: [Account Auth Key]" -H "Content-Type: application/json" --data '{"type":"cname","name":"[subdomain].[domain]","content":"[cname domain]","ttl":1,"priority":10,"proxied":false}'
```





Delete record:

```
curl -X DELETE "https://api.cloudflare.com/client/v4/zones/{zone_id}/dns_records/{record_id}" \
     -H "X-Auth-Email: {email}" \
     -H "X-Auth-Key: {api_token}"
```

```rust
curl -X DELETE "https://api.cloudflare.com/client/v4/zones/{zone_id}/dns_records/{record_id}" -H "X-Auth-Email: {email}" -H "X-Auth-Key: {api_token}"
```
