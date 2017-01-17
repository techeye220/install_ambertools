[![Build Status](https://travis-ci.org/Amber-MD/setup-scripts.svg?branch=master)](https://travis-ci.org/Amber-MD/setup-scripts)

Install Python and AmberTools binary distributions
--------------------------------------------------

```bash
# download install_ambertools.sh
wget https://raw.githubusercontent.com/Amber-MD/setup-scripts/master/install_ambertools.sh

# The script will create /home/amber16 folder and install everything there
sh install_ambertools.sh --prefix /home/

# The script will create /opt/amber16 folder and install everything there
sh install_ambertools.sh --prefix /opt/
```

# adjust the script for your need

Note
----
- All instructions are subjected to change
- If you already have `conda`, just `conda install ambertools -c hainm`
    - `hainm` is temporary channel

Merge to amber repo
-------------------
```bash
cd $AMBERHOME
git remote add setup-scripts-github https://github.com/amber-md/setup-scripts
git fetch setup-scripts-github
git pull -s recursive -X subtree=AmberTools/src/conda-recipe/setup-scripts/ -X theirs --squash setup-scripts-github master
```
