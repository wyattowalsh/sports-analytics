#!/bin/bash

python_version = "$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"

MINICONDA_INSTALLER_SCRIPT=Miniconda3-4.5.4-Linux-x86_64.sh
MINICONDA_PREFIX=/usr/local
wget https://repo.continuum.io/miniconda/$MINICONDA_INSTALLER_SCRIPT
chmod +x $MINICONDA_INSTALLER_SCRIPT
./$MINICONDA_INSTALLER_SCRIPT -b -f -p $MINICONDA_PREFIX

if [[ "$(which conda)" =~ "/usr/local/bin/conda" ]]; then
	conda install --channel defaults conda python="$python_version" --yes
	conda update --channel defaults --all --yes
	python -c "import sys; _ = (sys.path.append("/usr/local/lib/python$python_version/site-packages"))"
else
	echo "conda installation failed. Colab has changed since the authoring of this script."
fi