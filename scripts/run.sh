#!/bin/bash --login

conda activate diffab

which python
echo "Complex PDB: "${1}
echo "Config: "${2}

python design_pdb.py ${1} --config ${2}