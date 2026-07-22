#!/bin/sh
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=16:mem=20gb
#PBS -N Relaxed

cd $HOME/GitHub/pots-project-2026 || { echo "ERROR: cd failed"; exit 1; }
mkdir -p "armand_learning/simple_model/output"

LOGFILE="armand_learning/simple_model/output/logfile.log"
PROGRAM="$HOME/revbayes/projects/cmake/build-mpi/rb-mpi"

SECONDS=0
echo "INFO:Starting        "`date`              > ${LOGFILE}
echo "INFO:Node Used       "`hostname`         >> ${LOGFILE}
echo "INFO:In dir          "`pwd`              >> ${LOGFILE}

module load tools/dev
module load tools/prod
module load OpenMPI
module load GCC/14.3.0

mpirun -np 16 --map-by :OVERSUBSCRIBE ${PROGRAM} "armand_learning/simple_model/UCLN_simpleBM.Rev" >> ${LOGFILE} 2>&1

duration=$SECONDS
hrs=$(($duration / 3600))
min=$(($(($duration % 3600))/60))
sec=$(($duration % 60))

echo "INFO:Finishing       "`date`              >> ${LOGFILE}
echo "INFO:Time_Taken_(H:M:S)    : ${hrs}:${min}:${sec}" >> $LOGFILE
