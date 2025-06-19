# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0
# pylint: disable=wrong-import-position
# Enable OTel logging
import logging

logging.basicConfig(level=logging.INFO)
# logging.basicConfig(level=logging.DEBUG)


# Enable Hook
from opentelemetry.instrumentation.auto_instrumentation import initialize  # noqa: E402

initialize()


import time  # noqa: E402

import boto3  # noqa: E402

s3 = boto3.resource("s3")


def call_aws_sdk():
    for bucket in s3.buckets.all():
        if bucket is None:
            print(bucket.name)


def main():
    print("Hello from z-ADOT!")
    count = 10
    while True:
        call_aws_sdk()
        time.sleep(1.2)
        count -= 1
        if count == 0:
            break


if __name__ == "__main__":
    main()
    print("Bye!")
