[![Build Status](https://travis-ci.org/Amber-MD/install_ambertools.svg?branch=master)](https://travis-ci.org/Amber-MD/install_ambertools)

Users
=====

- Non-conda user

```bash
# download install_ambertools.sh
wget https://raw.githubusercontent.com/Amber-MD/install_ambertools/master/install_ambertools.sh
# or: curl https://raw.githubusercontent.com/Amber-MD/install_ambertools/master/install_ambertools.sh -o install_ambertools.sh

# The script will create $HOME/amber17 folder and install everything there (AmberTools and compatible Python packages)
sh install_ambertools.sh --prefix $HOME

# Use user's preinstalled Python
sh install_ambertools --prefix $HOME --non-conda

# if "sh" does not work, try "bash"
# bash install_ambertools.sh --prefix $HOME

# You can certainly choose different prefix
# e.g: sh install_ambertools.sh --prefix /opt/

# activate
source $HOME/amber17/amber.sh
# That's it.
```

- conda user
```
conda install ambertools=17 -c http://ambermd.org/downloads/ambertools/conda/
```
