# Guide to using the HPC
Login = `<userid>@login.cx3.hpc.imperial.ac.uk`  
Password - won't display on screen and you can't backspace

## Important commands

### Directory navigation
- `cd` - navigates the file system
    - `cd <path>` - goes to the specified path (must belong to the directory you're in)
    - `cd` or `cd ~` - goes to the home directory
    - `cd ..` - goes back one level
- `pwd` - prints the directory you're in 
- `ls` - lists the contents of the directory you're in
    - `ls -lhr` - more detailed list of contents

### Job submission
- `qsub` - submits a job script to the HPC
- `qstat <user id>` - lists all your active jobs
- `qdel <job id>` - stops a submitted job

### File viewing
- `more <filename>` - prints the contents of a file to the terminal
- `tail -n <filename>` - prints the last `n` lines of a file

### Deleting files
- `rm <filename>` - deletes a file
    - I recommied using the `-i` flag to force you to confirm each deletion (there's no recycle bin)
- `rm -rf <directory>` - deletes a directory
    - Use this with extreme caution


## Running a job
The HPC will produce 2 files, the error and output files. You can mostly idgnore these.

1) Make the submission script executable
    - `chmod +x <filename.sh>`
2) Submit the job 
    - `qsub <filename.sh>`
3) Check it submitted properly
    - `qstat -u <user id>`
    - Your job will likely be held in the queue for a couple of minutes

## Downloading / uploading files
You have to be signed out of the HPC for this to work

### Downloading
For files, you can just use standard `rsync`  
`rsync amleroi@login.cx3.hpc.imperial.ac.uk:<remote/dir> <local/dir>`

For folders, you need the `-r` recursive flag  
`rsync -r amleroi@login.cx3.hpc.imperial.ac.uk:<remote/dir> <local/dir>`


### Uploading
For files, you can just use standard `rsync`  
`rsync <local/dir> amleroi@login.cx3.hpc.imperial.ac.uk:<remote/dir>`

For folders, you need the `-r` recursive flag  
`rsync -r <local/dir> amleroi@login.cx3.hpc.imperial.ac.uk:<remote/dir>`

## Interacting with GitHub
To clear up a common point of confusion, GitHub is a website whereas `git` is a piece of software. You use `git` to interact with GitHub.

- `git clone <repo url> <directory>` - clones a repository to the specified directory
- `git pull` - pulls any changes in the online repository into your local copy
- `git commit` - tracks your local changes so they can be pushed to the online repository
    - Add a message to your commit using `git commit -m "message"`
- `git push` - pushes any local changes to the online repository
- `git add -a` - **stages** any new files you've created, meaning they are tracked by git (appear in your repo)

### Best practices
Never make changes directly to the online repo. This makes it harder to fix any mistakes that may occur. 

Instead, create a **branch** of the repo to work in. This exists in parallel to the **main** branch of the repo, allowing you to review changes before merging them into the main repo using a **pull request**.

- `git branch` - lists all existing branches of the repo
- `git status` - tells you what branch you're working in
- `git branch <branch_name>` - creates a new branch of the repo
- `git checkout <branch_name>` - sets your local branch, any changes you push will be made to that branch