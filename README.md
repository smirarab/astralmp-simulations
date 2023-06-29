# Generating the 10K dataset
- We used __generateData.sh__ to generate the 20 replicates (10K species, 1K gene trees).
- Then we run __run-analysis.sh__ to  generate the __parameter.log.info__ file to get the parameters like speciation rate, number of generations, the population size etc of the generated dataset
- Next, we run the ``perl post_stidsim.pl 10k.species 1`` to get the control files required to generate sequences (with indelible)
- To simulate sequences and estimate the gene trees we used this command:
```
cd tmpfolder;
cp path_to_control_file/control.txt .;
indelible
```

- To simulate the estimated gene trees, we used fasttree with the following command:
```
fasttree -nt -gtr -nopr -gamma sequence.fasta > estimated_genetree.tree 2> estimated_genetree.log
```


