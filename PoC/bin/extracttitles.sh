#!/bin/bash

# Changes directory to corpus_input directory
cd ..
cd data/corpus_input/

# Loop to extract body text and output to new .txt files in corpus_output
for filename in *.txt
do head -n 2 $filename | tail -n 1 > ../corpus_output/titles/title-${filename}
done

# Go back to the bin folder to run R script
cd ../..
cd bin
Rscript wordfreq_titles.R