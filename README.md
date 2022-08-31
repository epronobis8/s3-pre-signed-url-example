# Create infrastructure do the following:
terraform plan
terraform apply
note: ensure access keys are exported in your terminal


# Create presigned URL
To generate presigned url run the following: python3 get-presigned-url.py
1. Enter bucket name 
2. Enter file name

# PUT file with presigned-url
Use the following CURL command to put a file in S3 using the link generated in the step above:
curl --request PUT --upload-file file.txt "https://enter-presigned-url"



