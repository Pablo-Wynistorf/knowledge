AWS Cli:

```
aws acm request-certificate --region $REGION --domain-name $DOMAIN-NAME --validation-method $METHOD(EMAIL, DNS)
```

```
aws acm describe-certificate --region $REGION --certificate-arn $CERT-ARN --query 'Certificate.DomainValidationOptions[0].ResourceRecord' --output json
```

1.) Open **AWS Certificate Manager (ACM) and click request.**

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/GvU5hizBJiC5AWKfF9C399Sa.png)

2.) Select public Certificate

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/IXfnysbikOeRwcApcBzqDiae.png)

3.) Enter one or more Domain names

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/6VdFSUxNZ22yXV_JJFqpi7it.png)

4.) Select DNS validation and use RSA 2048 encryption.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/eVKo_hnlJ2OVM8-7kzdnP-A5.png)

5.) Click Request

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/xFvImABnUjh6FwBno5o0fXDN.png)

6.) Click on your new certificate request

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/nYqs7isMsLCwvylXXq7iXmHx.png)

7.) Copy the CNAME-NAME and the CNAME-CONTENT

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/hOtf915AVeg-a5Qbks0LlBNj.png)

8.) Add CNAME Record at your DNS provider

In this Example:

CNAME-NAME: _d749639f1cebd3a26bf1aa4dea2106ff.onedns.ch.

CNAME-CONTENT: _c820bc06b3a97bead6b5f8bf4bee1cf3.pmgvbzmzyk.acm-validations.aws.

It should look like this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/-pQoy_WlRvEYAupCgX7AUr82.png)

9.) Now wait a couple of minutes until AWS verified that you are the actual owner of the domain.

10.) As soon everything worked, the status should change to issued

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/qVv_Daw4VfDWQP7U1spDumDr.png)
