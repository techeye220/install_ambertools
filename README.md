[![Build Status](https://travis-ci.org/Amber-MD/setup-scripts.svg?branch=master)](https://travis-ci.org/Amber-MD/setup-scripts)

# Example

## Install miniconda and some packages
```bash
bash install_python.sh
# need to add: export PATH=$HOME/miniconda2/bin:$PATH
# to your $HOME/.baschrc file
```

## Install AmberTools
```bash
conda install -c hainm ambertools=16 --yes
# Note: "hainm" channel will be replaced by something else.

# update: add --force
conda install -c hainm ambertools --force
```
