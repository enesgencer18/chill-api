#!/bin/bash

echo "doing cool stuff"

R -e /test.R

set -o errexit
Rscript -e "testthat::test_dir('./tests')"
