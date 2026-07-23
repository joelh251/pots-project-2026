# pots-project-2026


## Directories
### discrete_model
Attempt to discretise the tree model.

Division into bins is working.

Model almost works - problem is there is RevBayes assumes all characters have the same number of states
- Solution - make all matrices the same size
    - Honestly, could probably just use a single matrix, the cost is a function of distance so should be fine


### armand_learning
Various details for using the HPC and getting to know RevBayes
