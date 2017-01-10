#!/bin/sh

version=16

function print_help(){
    echo "bash install_ambertools.sh --prefix [your_desired_dir]"
    exit
}

while [ $# != 2 ]; do
    print_help
done

case "$1" in
    -p|--prefix)
        prefix=$2
        ;;
    *)
        echo "Unsupported argument: $1"
        print_help
        ;;
esac

# should work for both osx and linux
osname=`python -c 'import sys; print(sys.platform)'`
if [ $osname = "darwin" ]; then
    wget https://repo.continuum.io/miniconda/Miniconda-latest-MacOSX-x86_64.sh -O miniconda.sh;
else
    wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh;
fi

echo "Install Miniconda and AmberTools to $prefix"
echo ""

bash miniconda.sh -b -p $prefix

export PATH=$prefix/bin:$PATH
conda update --all -y
conda install --yes conda-build jinja2 pip cython numpy pytest
conda install --yes ipython notebook
$prefix/bin/pip install matplotlib # avoid qt
conda install --yes ipywidgets -c conda-forge
conda install --yes nglview -c bioconda

# TODO: change to ambermd channel
conda install --yes ambertools=$version -c hainm

echo "Make sure to add PATH"
echo ""
echo "export PATH=$prefix:\$PATH"
