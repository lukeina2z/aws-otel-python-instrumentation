### Enable OTel logging
import logging
logging.basicConfig(level=logging.INFO)
# logging.basicConfig(level=logging.DEBUG)


### Enable Hok
from opentelemetry.instrumentation.auto_instrumentation import initialize
initialize()



import time
import boto3

s3 = boto3.resource("s3")

def call_aws_sdk():
    for bucket in s3.buckets.all():
        if (bucket is None):
            print(bucket.name)

def main():
    print("Hello from zotel!")
    count = 10
    while True:
        call_aws_sdk()
        time.sleep(1.2)
        count -= 1
        if count == 0:
            break



if __name__ == "__main__":
    main()
