#!/bin/bash
DIR=$( cd "$(dirname ${BASH_SOURCE[0]})" && pwd)
#$DIR/simulate-alignments.sh

mysum() {
    #do things with parameters like $1 such as
    	awk -v N="$2" '{ sum +=$N; } END {print sum; }' $1;
}
mean() {
	awk -v N="$2" '{sum += $N; } END {print sum/NR}' $1;
}
nf=20;
kt=1000;
ht=4
clear; cat log.txt | tail -n +55 > log.txt1
echo "Replicate Speciation-rate Extinction-rate Ingroup-divergence/divergence-to-the-ingroup-ratio Number-of-leaves Generations Haploid-efective-population-size Global-substitution-rate  Lineage-(species)-specific-rate-heterogeneity-gamma-shape Gene-family-(locus-tree)-specific-rate-heterogeneity-gamma-shape Individuals-per-species" > parameter.log.info;  cat log.txt1 | sed -e 's/\(Replicate [0-9]* parameters:\)/\$\1/' | tr '\n' ' ' | tr '\$' '\n' | sed  -e 's/Simulation:.*//' | tr '\t' ' ' | tr '  ' ' ' | awk '{printf "%s %s ", $1,$2; for(i=10;i<=NF;++i){printf "%s ",$i}; printf "\n"}' | sed -e 's/Replicate //' | sed -e 's/-Speciation rate: //' | sed -e 's/-Extinction rate: //'  | sed -e 's/-Outgroup addition: -Ingroup divergence\/divergence to the ingroup ratio://' | sed -e 's/-Stopping rules: -Number of leaves://' | sed -e 's/ -Generations://' | sed -e "s/-Time units: generations -1000 Locus trees: directly obtained from the species tree (no birth-death process) -Gene trees: 1 multilocus coalescent simulations Parameters: -Haploid efective population size://" | sed -e 's/-Global substitution rate: //' | sed -e 's/-Substitution rate heterogeneities -Lineage (species) specific rate heterogeneity gamma shape: //' | sed -e 's/-Gene family (locus tree) specific rate heterogeneity gamma shape: //' | sed -e 's/-Gene tree branch specific rate heterogeneity gamma shape: Genome-wide parameter No heterogeneity -Individuals per species://' | sed -e 's/[[:space:]][[:space:]]*/ /g' | awk '{printf "%03d %6.14f %6.14f %01d %05d %10.1f %10.1f %1.17f %6.8f %6.8f %1.1f \n", $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed -e 's/[[:space:]][[:space:]]*/ /g'  >> parameter.log.info
