
#!/bin/bash

# Print current date and time
echo "Starting setup: $(date)"



export OTEL_PYTHON_DISTRO="aws_distro"
export OTEL_PYTHON_CONFIGURATOR="aws_configurator"

export OTEL_METRIC_EXPORT_INTERVAL="200"

export OTEL_LOG_LEVEL= "all"
export OTEL_METRICS_EXPORTER="none"
export OTEL_LOGS_EXPORTER="none"
export OTEL_AWS_APPLICATION_SIGNALS_ENABLED="true"

export OTEL_EXPORTER_OTLP_PROTOCOL="http/protobuf"
# OTEL_TRACES_SAMPLER=xray
export OTEL_TRACES_SAMPLER_ARG="endpoint=http://localhost:2000"
export OTEL_AWS_APPLICATION_SIGNALS_EXPORTER_ENDPOINT="http://localhost:4316/v1/metrics"
export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT="http://localhost:4316/v1/traces"
export OTEL_RESOURCE_ATTRIBUTES="service.name=xy-python-foo"

opentelemetry-instrument python server_automatic_s3client.py

