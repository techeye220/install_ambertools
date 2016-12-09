#!/bin/sh

# should work for both osx and linux
osname=`python -c 'import sys; print(sys.platform)'`
if [ $osname = "darwin" ]; then
    wget https://repo.continuum.io/miniconda/Miniconda-latest-MacOSX-x86_64.sh -O miniconda.sh;
else
    wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh;
fi

bash miniconda.sh -b

export PATH=$HOME/miniconda2/bin:$PATH
conda update --all -y
conda install --yes conda-build jinja2 pip cython numpy pytest
conda install --yes ipython notebook
conda install --yes ipywidgets -c conda-forge
