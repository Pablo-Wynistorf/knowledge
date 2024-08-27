Create this lambda function.

Change the bucket name, you can also make it get the bucket name from the event.

```python
import io
import zipfile

import boto3


def lambda_handler(event, context):
    s3 = boto3.client("s3")

    # Get the bucket and object key from the event
    bucket = "webpagent-websites"
    key = event["Records"][0]["s3"]["object"]["key"]

    # Extract the folder path from the key
    folder_path = "/".join(key.split("/")[:-1])

    # Download the zip file
    zip_obj = s3.get_object(Bucket=bucket, Key=key)
    buffer = io.BytesIO(zip_obj["Body"].read())

    # Decompress the zip file
    with zipfile.ZipFile(buffer, "r") as zip_ref:
        for file_name in zip_ref.namelist():
            file_data = zip_ref.read(file_name)

            # Determine the new key without the top-level folder
            if "/" in file_name:
                new_key = f"{folder_path}/{file_name.split('/', 1)[1]}"
            else:
                new_key = f"{folder_path}/{file_name}"

            # Upload each file to S3
            s3.put_object(Bucket=bucket, Key=new_key, Body=file_data)

    # Delete the zip file after decompression
    s3.delete_object(Bucket=bucket, Key=key)

    return {"statusCode": 200}

```



Create a trigger and select s3 with the put method on the desired buckets.

Add the needed permissions to lambda:



Set the correct buckets.

Policy:

```javascript
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"s3:PutObject",
				"s3:GetObject",
				"s3:DeleteObject"
			],
			"Resource": "arn:aws:s3:::webpagent-websites/*"
		}
	]
}
```
