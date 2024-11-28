#!/bin/bash

collection_dependencies=$(yq '.dependencies | to_entries | map({"name": .key, "version": .value})' ansible_collections/sap/cluster_qa/galaxy.yml)
requirements=$(yq '.collections' requirements.yml)

if [ "$collection_dependencies" == "$requirements" ]; then
  echo "The collection requirements in galaxy.yml and requirements.yml are the same."
else
  echo "The collection requirements in galaxy.yml and requirements.yml are different."
  echo "Collcetion requirements in galaxy.yml:"
  echo $collection_dependencies
  echo "Collection requirements in requirements.yml:"
  echo $requirements
  exit 1
fi
