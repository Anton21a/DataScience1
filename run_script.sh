#!/usr/bin/env bash
set -e

conda env create -f project_environment.yml || conda env update -f project_environment.yml
conda run -n data-analysis python -m ipykernel install --user --name=data-analysis --display-name "Python (data-analysis)"
conda run -n data-analysis jupyter nbconvert --to notebook --execute Data-and-Analysis/Preprocessing_cleaning.ipynb --inplace
conda run -n data-analysis jupyter nbconvert --to notebook --execute Data-and-Analysis/OLS_Analysis.ipynb --inplace


