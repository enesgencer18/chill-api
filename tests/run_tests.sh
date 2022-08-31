#!/bin/bash

echo "doing cool stuff"

set -o errexit
Rscript -e "testthat::test_dir('./tests')"
