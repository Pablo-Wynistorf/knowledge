Docs to create a client VPN:





Follow all these steps:

To generate the server and client certificates and keys and upload them to ACM

1. Clone the OpenVPN easy-rsa repo to your local computer and navigate to the `easy-rsa/easyrsa3` folder.

```
git clone https://github.com/OpenVPN/easy-rsa.git
```

```
cd easy-rsa/easyrsa3
```

1. Initialize a new PKI environment.

```
./easyrsa init-pki
```

1. To build a new certificate authority (CA), run this command and follow the prompts.

```
./easyrsa build-ca nopass
```

1. Generate the server certificate and key.

```
./easyrsa --san=DNS:server build-server-full server nopass
```

1. Generate the client certificate and key.
1. Make sure to save the client certificate and the client private key because you will need them when you configure the client.

```
./easyrsa build-client-full client1.domain.tld nopass
```

1. You can optionally repeat this step for each client (end user) that requires a client certificate and key.
1. Copy the server certificate and key and the client certificate and key to a custom folder and then navigate into the custom folder.
1. Before you copy the certificates and keys, create the custom folder by using the `mkdir` command. The following example creates a custom folder in your home directory.

```
mkdir ~/aws_client_vpn/
cp pki/ca.crt ~/aws_client_vpn/
cp pki/issued/server.crt ~/aws_client_vpn/
cp pki/private/server.key ~/aws_client_vpn/
cp pki/issued/client1.domain.tld.crt ~/aws_client_vpn
cp pki/private/client1.domain.tld.key ~/aws_client_vpn/
cd ~/aws_client_vpn/
```

1. Upload the server certificate and key and the client certificate and key to ACM. Be sure to upload them in the same Region in which you intend to create the Client VPN endpoint. The following commands use the AWS CLI to upload the certificates. To upload the certificates using the ACM console instead, see [Import a certificate](https://docs.aws.amazon.com/acm/latest/userguide/import-certificate-api-cli.html) in the _AWS Certificate Manager User Guide_.

```
aws acm import-certificate --certificate fileb://server.crt --private-key fileb://server.key --certificate-chain fileb://ca.crt
```

```
aws acm import-certificate --certificate fileb://client1.domain.tld.crt --private-key fileb://client1.domain.tld.key --certificate-chain fileb://ca.crt
```

1. You do not necessarily need to upload the client certificate to ACM. If the server and client certificates have been issued by the same Certificate Authority (CA), you can use the server certificate ARN for both server and client when you create the Client VPN endpoint. In the steps above, the same CA has been used to create both certificates. However, the steps to upload the client certificate are included for completeness.



Demo connection profile:

```bash
client
dev tun
proto udp
remote cvpn-endpoint-09dbc4521d80d3d1a.prod.clientvpn.eu-central-2.amazonaws.com 443
remote-random-hostname
resolv-retry infinite
nobind
remote-cert-tls server
cipher AES-256-GCM
verb 3
<ca>
-----BEGIN CERTIFICATE-----

-----END CERTIFICATE-----

</ca>

<cert>
-----BEGIN CERTIFICATE-----

-----END CERTIFICATE-----
</cert>

<key>
-----BEGIN PRIVATE KEY-----

-----END PRIVATE KEY-----
</key>


reneg-sec 0

verify-x509-name server name
```





Cert renoval:

[https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/mutual.html](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/mutual.html)











13.)

[https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/cvpn-getting-started.html#cvpn-getting-started-certs](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/cvpn-getting-started.html#cvpn-getting-started-certs)
