#!/bin/bash

git clean -f .

pip freeze | grep -v "@" | xargs pip uninstall -y
pip uninstall -y aws-opentelemetry-distro
pip uninstall -y contract-tests 
pip uninstall -y mock-collector 

pip cache purge
# pip cache info


# docker network ls | grep aws-application-signals-network
docker network rm aws-application-signals-network
docker network prune -f


./scripts/build_and_install_distro.sh

./scripts/set-up-contract-tests.sh

pytest contract-tests/tests

