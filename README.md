# how-to-sockeye

## Quick functions

```print_members```


```
#################################### Allocation members for st-username-1 ####################################
sli (Sears Li) 
moak1 (Maya Oak)  
```

## Conda environments

### New Python environment with ```ipython```

```
conda create -n "py3.12" python=3.12 ipython  
conda activate py3.12
```

####
```
conda env create -f environment.yml 
```


## Slurm job


Example:

```
#!/bin/bash
#SBATCH --account=username                # Allocation code
#SBATCH --nodes=1                         # Number of nodes for each sub-job.
#SBATCH --ntasks-per-node=1               # Number of tasks per node for each sub-job.
#SBATCH --time=X:00:00                    # Estimating X hours of runtime, e.g. X=3   (job will not be complete if actual runtime needed exceeds X)
#SBATCH --mem=YG                          # Estimating Y GB of memory needed, e.g. Y=8  (will not run successfully if actual memory needed exceeds Y)
#SBATCH --output=logs/array_%A_%a.out     # [optional] Redirects output to a unique file for each sub-job.
#SBATCH --error=logs/array_%A_%a.err      # [optional] Redirects error logs to a unique file for each sub-job.
#SBATCH --mail-user=your_email_addr@ca    # [optional] Email address for job notifications
#SBATCH --job-name=nps_job_array          # [optional] Job name
#SBATCH --mail-type=ALL                   # [optional] Email notifications received for ALL job events [other options: E for errors]

# resets language
export LC_ALL=C; unset LANGUAGE

# Load necessary modules
module load gcc
# module load ZZ

```

