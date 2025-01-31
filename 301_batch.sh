#!/bin/bash

conda create -n renv python=3.9 -y

source /root/anaconda3/etc/profile.d/conda.sh
conda activate renv
echo y | conda install -c r r-irkernel 
echo y | conda install r-essentials
nohup jupyter-lab --ip='0.0.0.0' --allow-root --NotebookApp.token='' &


