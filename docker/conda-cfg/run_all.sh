#!/bin/zsh

# create conda-lock file for mlflow-server
conda-lock -f environment-server.yml
mv conda-lock.yml conda-lock-server.yml

# create conda-lock file for mlops
conda-lock -f environment-mlops.yml
mv conda-lock.yml conda-lock-mlops.yml

# create conda-lock file for web
conda-lock -f environment-api.yml
mv conda-lock.yml conda-lock-api.yml