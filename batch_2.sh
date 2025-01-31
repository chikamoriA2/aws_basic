#!/bin/bash

conda create -n renv python=3.9 -y
conda activate renv
conda install -c r r r-irkernel r-essentials

nohup jupyter-lab --ip='0.0.0.0' --allow-root --NotebookApp.token='' &


