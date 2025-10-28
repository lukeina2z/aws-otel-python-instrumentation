#!/bin/bash

set -e

# Setup - update dependencies and create/empty dist dir
pip install --upgrade pip setuptools wheel packaging build

mkdir -p dist

rm -rf dist/aws_opentelemetry_distro*


# Build distro
pushd aws-opentelemetry-distro
python -m build --outdir ../dist
popd


# Unit Tests
pip install tox
pip install pytest
tox -e lint
tox -e spellcheck

tox -e 3.9-test-aws-opentelemetry-distro 
tox -e 3.10-test-aws-opentelemetry-distro
tox -e 3.11-test-aws-opentelemetry-distro
tox -e 3.12-test-aws-opentelemetry-distro
tox -e 3.13-test-aws-opentelemetry-distro



# Install distro
pushd dist
pip install --force-reinstall aws_opentelemetry_distro-0.13.0.dev0-py3-none-any.whl
popd


# Run zADOT with ADOT auto instrumentation
# https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Application-Signals-Enable-EC2Main.html#CloudWatch-Application-Signals-Enable-Other-instrument
pip install boto3

OTEL_EXPERIMENTAL_RESOURCE_DETECTORS="host,os,process" \
    OTEL_METRICS_EXPORTER=none \
    OTEL_LOGS_EXPORTER=none \
    OTEL_AWS_APPLICATION_SIGNALS_ENABLED=true \
    OTEL_PYTHON_DISTRO=aws_distro \
    OTEL_PYTHON_CONFIGURATOR=aws_configurator \
    OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf \
    OTEL_TRACES_SAMPLER=xray \
    OTEL_TRACES_SAMPLER_ARG="endpoint=http://127.0.0.1:2000" \
    OTEL_AWS_APPLICATION_SIGNALS_EXPORTER_ENDPOINT=http://127.0.0.1:4316/v1/metrics \
    OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=http://127.0.0.1:4318/v1/traces \
    OTEL_RESOURCE_ATTRIBUTES="service.name=ADOT-Python-zADOT" \
    opentelemetry-instrument python ./zADOT/main.py



