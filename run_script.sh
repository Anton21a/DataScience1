#!/usr/bin/env bash
set -e 
conda env create -f project_environment.yml || conda env update -f project_environment.yml

conda run -n data-analysis python -m ipykernel install --user --name=data-analysis --display-name "Python (data-analysis)"

conda run -n data-analysis python scripts/make_clean_subset.py

conda run -n data-analysis papermill "Data-and-Analysis/Analysis.ipynb" "Data-and-Analysis/Analysis_out.ipynb"


