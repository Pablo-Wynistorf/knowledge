```
aws ec2 describe-vpc-endpoints --query 'VpcEndpoints[*].ServiceName'
```

Notice that there is _no_ Amazon S3 endpoint. The next steps guide you through the process of creating one. Without the Amazon S3 endpoint, the instance in the private subnet does not have access to S3. Therefore, the Amazon S3 endpoint is created by the instance in the public subnet. Then, in **Task 4** the private instance will get access to S3.

1.  **Command:** To find the VPC ID for the **labVPC**, run the following commands:

(change the value of vpc name)



```
VPC=$(aws ec2 describe-vpcs --query 'Vpcs[*].VpcId' --filters 'Name=tag:Name, Values='VPC-NAME | jq -r '.[0]')
echo $VPC
```



This command uses JQ to process the JSON output and put it in the correct format to be used later.

1.  **Command:** To find the route table ID for the _private_ route table, run the following commands:



```
RTB=$(aws ec2 describe-route-tables --query 'RouteTables[*].RouteTableId' --filters 'Name=tag:Name, Values=PrivateRouteTable' | jq -r '.[0]')
echo $RTB
```



1.  **Command:** To create an Amazon S3 endpoint, run the following commands:



```
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
export AWS_REGION=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
echo $AWS_REGION
aws ec2 create-vpc-endpoint \
    --vpc-id $VPC \
    --service-name com.amazonaws.$AWS_REGION.s3 \
    --route-table-ids $RTB
```



**Note:** Backslashes were added to the above command to run as a multi-line command.

The Amazon S3 VPC endpoint is now created.

1.  **Command:** To verify that the Amazon S3 VPC endpoint has been created, run the following command:



```
aws ec2 describe-vpc-endpoints --query 'VpcEndpoints[*].ServiceName'
```



The Amazon S3 endpoint now appears in the list.
