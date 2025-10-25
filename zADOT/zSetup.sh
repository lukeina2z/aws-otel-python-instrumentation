#!/bin/bash

### OTel

# https://opentelemetry.io/docs/zero-code/python/
rm -fr ./v-otel
python -m venv v-otel
source ./v-otel/bin/activate
pip install --upgrade pip
pip install boto3


# pip install -e /Users/lukezha/github/otel-python/pr-work/opentelemetry-python-lkmain/opentelemetry-semantic-conventions/pyproject.toml
pip install -e ../../opentelemetry-python-lkmain/opentelemetry-api
pip install -e ../../opentelemetry-python-lkmain/opentelemetry-semantic-conventions


pip install -e ../../opentelemetry-python-lkmain/opentelemetry-proto
pip install -e ../../opentelemetry-python-lkmain/opentelemetry-sdk

pip install -e ../../opentelemetry-python-lkmain/exporter/opentelemetry-exporter-otlp-proto-common
pip install -e ../../opentelemetry-python-lkmain/exporter/opentelemetry-exporter-otlp-proto-http
pip install -e ../../opentelemetry-python-lkmain/exporter/opentelemetry-exporter-otlp-proto-grpc
pip install -e ../../opentelemetry-python-lkmain/exporter/opentelemetry-exporter-otlp


pip install -e ../util/opentelemetry-util-http
pip install -e ../opentelemetry-instrumentation 
pip install -e ../opentelemetry-distro 

pip install -e ../instrumentation/opentelemetry-instrumentation-asyncio
pip install -e ../instrumentation/opentelemetry-instrumentation-dbapi
pip install -e ../instrumentation/opentelemetry-instrumentation-logging
pip install -e ../instrumentation/opentelemetry-instrumentation-sqlite3
pip install -e ../instrumentation/opentelemetry-instrumentation-threading
pip install -e ../instrumentation/opentelemetry-instrumentation-urllib
pip install -e ../instrumentation/opentelemetry-instrumentation-wsgi
pip install -e ../instrumentation/opentelemetry-instrumentation-boto3sqs
pip install -e ../instrumentation/opentelemetry-instrumentation-botocore
pip install -e ../instrumentation/opentelemetry-instrumentation-grpc
pip install -e ../instrumentation/opentelemetry-instrumentation-requests
pip install -e ../instrumentation/opentelemetry-instrumentation-urllib3


opentelemetry-bootstrap -a install

deactivate