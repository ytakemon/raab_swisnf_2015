#!/bin/bash
#script takes the merged bam files generated by call.chipreadhandler.sh 
# and calls macs peaks under standard definitions - qsub script written on the fly
OUTDIR=/magnuson-lab/jraab/analysis/swi_snf_final/output/macs_peaks/
INPUT=/magnuson-lab/jraab/analysis/swi_snf_final/data/chip/processed/input.sorted.bam
IDIR=/magnuson-lab/jraab/analysis/swi_snf_final/data/chip/processed/
if [ ! -d $OUTDIR ]; then 
   mkdir $OUTDIR
fi

stubs="arid1a arid1b arid2 snf5" 
for s in $stubs; do 
   sfile=$(find $IDIR -name $s*.merged.sorted.bam)  
   echo $sfile
   echo "#!/bin/bash" >> tmp.sh
   echo "#$ -cwd 
   #$ -e tmp.err 
   #$ -o tmp.out 
   #$ -j ${s}.peaks" >> tmp.sh 
   echo "module load python/2.7.6" >> tmp.sh
   echo "source /magnuson-lab/jraab/virtualenvs/base/bin/activate" >> tmp.sh
   echo "macs2 callpeak -t $sfile -c $INPUT -n $OUTDIR/$s -g 2.7e9 -q 0.01 --broad " >> tmp.sh
   qsub  tmp.sh
   rm tmp.sh
done




