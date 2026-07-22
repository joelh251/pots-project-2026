# Guide to using the HPC
Login = <userid>@login.cx3.hpc.imperial.ac.uk
Password - won't display on screen and you can't backspace

## Important commands
- `cd` - navigates the file system
    - `cd <path>` - goes to the specified path (must belong to the directory you're in)
    - `cd` or `cd ~` - goes to the home directory
    - `cd ..` - goes back one level
- `pwd` - prints the directory you're in 
- `ls` - lists the contents of the directory you're in
    - `ls -lhr` - more detailed list of contents
- `qsub` - submits a job script to the HPC
- `qstat <user id>` - lists all your active jobs
- `qdel <job id>` - stops a submitted job
- `more <filename>` - prints the contents of a file to the terminal
- `tail -n <filename>` - prints the last `n` lines of a file

## Running a job
The HPC will produce 2 files, the error and output files. You can mostly idgnore these.

1) Make the submission script executable
    - `chmod +x <filename.sh>`
2) Submit the job 
    - `qsub <filename.sh>`
3) Check it submitted properly
    - `qstat <user id>`
    - Your job will likely be held in the queue for a couple of minutes