# Sockeye: usage notes for working in the ARC (Advanced Research Computing) environment 

## Contents

1. One-time setup
2. Frequent Linux commands
3. Modules
4. Conda
5. Virtual environments via Conda
6. Running an interactive job (with GPU)
7. Running an offline job in Slurm

## One-time setup  
1. Apply for Sockeye allocation: https://flex.redcap.ubc.ca/surveys/?s=7MKJT898LK
2. Setup [Multi-factor authentication](https://mfadevices.id.ubc.ca/). This is mandatory step or you will not be able to SSH.
3. Install myVPN:
   - [Set up guide for Mac users](https://ubc.service-now.com/kb_view.do?sysparm_article=KB0017956#macos)
   - Window users may need to email and request OneDrive link to download an installer, as Lisa did in April, 2024

## Frequent Linux commands

### ```print_members```

Output:
```
#################################### Allocation members for st-username-1 ####################################
sli (Sears Li) 
moak1 (Maya Oak)  
```

## Modules

To see how to load a software via loading of required module(s), one may need to query on what to load.

For instance, to use ```Git```, one would issue:
```
$module spider git
```

Which gives an output like this:
```
  For detailed information about a specific "git" package (including how to load the modules) use the module's full name. Note that names that have a trailing (E) are extensions provided by other modules.
  For example:

     $ module spider git/2.41.0
```

Following the suggested query, one would be advised to load a version of ```gcc``` module

Hence, to use Git, one would issue a command like this:
```
 module load gcc/5.5.0 git/2.41.0
```

## Conda environments

### New Python environment with ```ipython```

```
conda create -n "py3.12" python=3.12 ipython  
conda activate py3.12
```

### Replicate exact environment described in a ```environment.yml```
```
conda env create -f environment.yml 
```

## Running an interactive job

```
salloc --time=10:0:0 --mem=3G --nodes=1 --ntasks=2 --account=st-username-1-gpu --gpus=1
```

## Running an offline job in Slurm

1. Create job specification file
2. Submit on the job-queue
3. Wait for job release and job completion, which should give you log file(s) as specified via the ```error``` and ```output``` switches.
 
Here's an example job specification:

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
module load gcc/5.5.0
```


<details>

<summary>Misc.</summary>

```
  Graham has several types of GPUs, some of which are available with less wait:
  320 p100 2/node, 12GB, original
   70 v100 8/node, 16GB, newer, about 50% faster than P100 and with tensor cores
  144 t4   4/node, 16GB, newer, about half a V100, for compute & AI except much slower FP64
 ```
 

  
</details>
