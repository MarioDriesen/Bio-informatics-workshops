#!/bin/bash

set -e

echo "Setting up bioinformatics environment"

sudo apt-get update

# Installation of Basic tools
sudo apt-get install -y wget curl git unzip

echo "Installing bioinformatics tools..."

# Installation of tools through conda
conda install -y -c bioconda -c conda-forge fastqc cutadapt trim-galore pear vsearch

echo "Installing reference database"

mkdir -p database

# SILVA database will be downloaded here
# TODO: add database download command

echo "Setup complete!"
