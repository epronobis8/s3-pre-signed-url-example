import logging
import boto3
from botocore.exceptions import ClientError

s3 = boto3.client ('s3')

bucket = input("Enter Bucket Name: ")
key = input("Enter your desired filename/key for this upload ")

print("Generate pre-signed url...")
print(s3.generate_presigned_url('put_object', Params={'Bucket':bucket,'Key':key}, ExpiresIn=3600, HttpMethod='PUT'))
