#!/bin/bash
#SBATCH --job-name=diffab
#SBATCH --nodes=1
#SBATCH --ntasks=1                    # No. of tasks (e.g., commands to run in parallel) to be run
#SBATCH --ntasks-per-node=1           # No. of tasks to use per node. Often, this will be the number of cores available on the compute node.
#SBATCH --output=output-%j.txt --error=output-%j.txt

docker pull ynashed/diffab

# run
name="diffab_"${USER}_${RANDOM}
docker run -ti --rm -v /lab/lm:/data --name $name ynashed/diffab tttest