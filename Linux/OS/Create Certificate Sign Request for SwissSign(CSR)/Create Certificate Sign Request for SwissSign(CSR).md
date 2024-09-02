First run this script with the FQDN.

```
chmod +x createCSR.sh
./createCSR.sh $domain $keysize
#./createCSR.sh onedns.ch 4096
```

```bash
#!/bin/bash
HOST_FQDN=${1}
KEY_SIZE=${2}


if [[ -z ${HOST_FQDN} ]]; then
        echo "ERROR: No FQDN provided." >&2
        exit 1
fi

if [[ -z ${KEY_SIZE} ]]; then
        echo "ERROR: No KEY_SIZE provided." >&2
        exit 1
fi

openssl req -new -sha256 -newkey rsa:${KEY_SIZE} -nodes -keyout ${HOST_FQDN}.key -out ${HOST_FQDN}.csr -config <(cat <<-EOF
[ req ]
default_bits = "${KEY_SIZE}"
default_md = sha256
prompt = no
encrypt_key = no
distinguished_name = dn

[ dn ]
CN = ${HOST_FQDN}
C = CH
O = Swisscom (Schweiz) AG
L = Bern
ST = BE
OID.2.5.4.15=Private Organization
OID.1.3.6.1.4.1.311.60.2.1.2=BE
OID.1.3.6.1.4.1.311.60.2.1.3=CH
serialNumber = CHE-101.654.423

[req_ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = ${HOST_FQDN}
EOF
)
```

Openssl command only:

```bash
openssl req -new -sha256 -newkey rsa:${KEY_SIZE} -nodes -keyout ${HOST_FQDN}.key -out ${HOST_FQDN}.csr -config <(cat <<-EOF
[ req ]
default_bits = "${KEY_SIZE}"
default_md = sha256
prompt = no
encrypt_key = no
distinguished_name = dn

[ dn ]
CN = ${HOST_FQDN}
C = CH
O = Swisscom (Schweiz) AG
L = Bern
ST = BE
OID.2.5.4.15=Private Organization
OID.1.3.6.1.4.1.311.60.2.1.2=BE
OID.1.3.6.1.4.1.311.60.2.1.3=CH
serialNumber = CHE-101.654.423

[req_ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = ${HOST_FQDN}
EOF
)
```
