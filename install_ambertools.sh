#!/bin/sh

# TODO: specify version in command line
version=16
amberfolder='amber'$version
channel='hainm'

set -e

function print_help(){
    echo "bash install_ambertools.sh --prefix [your_desired_dir]"
    exit
}

function message_source_amber(){
    echo "--------------------------------------------------------------------------------"
    echo "Environment resource files are provided to set the proper environment"
    echo "variables to use AMBER and AmberTools. This is required to run any Python"
    echo "programs (like MMPBSA.py, ParmEd, MCPB.py, and pytraj)"
    echo ""
    echo "If you use a Bourne shell (e.g., bash, sh, zsh, etc.), source the"
    echo "$prefix/$amberfolder/amber.sh file in your shell. Consider adding the line"
    echo "source $prefix/$amberfolder/amber.sh"
    echo "to your startup file (e.g., ~/.bashrc)"
    echo ""
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

echo "Install Miniconda and AmberTools to $prefix/$amberfolder"
echo ""

sh miniconda.sh -b -p $prefix/$amberfolder

export PATH=$prefix/$amberfolder/bin:$PATH
conda update --all -y
conda install --yes conda-build jinja2 pip cython numpy nomkl pytest
conda install --yes scipy
conda install --yes ipython notebook
$prefix/$amberfolder/bin/pip install matplotlib # avoid qt
conda install --yes ipywidgets -c conda-forge
conda install --yes nglview -c bioconda

# TODO: change to ambermd channel
conda install --yes ambertools=$version -c $channel
conda clean --all --yes

# alias
cwd=`pwd`
cd $prefix/$amberfolder/bin
ln -sf python amber.python || error "Linking Amber's Miniconda Python"
ln -sf conda amber.conda || error "Linking Amber's Miniconda conda"
ln -sf ipython amber.ipython || error "Linking Amber's Miniconda ipython"
ln -sf jupyter amber.jupyter || error "Linking Amber's Miniconda jupyter"
ln -sf pip amber.pip || error "Linking Amber's Miniconda pip"
cd $cwd

# Write resource files
cat > $prefix/$amberfolder/amber.sh << EOF
export AMBERHOME="$prefix/$amberfolder"
export PATH="\${AMBERHOME}/bin:\${PATH}"
EOF

cat > $prefix/$amberfolder/amber.csh << EOF
setenv AMBERHOME "$prefix/$amberfolder"
setenv PATH "\${AMBERHOME}/bin:\${PATH}"
EOF

message_source_amber
