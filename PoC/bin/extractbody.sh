#!/bin/bash

# Changes directory to corpus_input directory
cd ..
cd data/corpus_input/

# Loop to extract body text and output to new .txt files in corpus_output
for filename in *.txt
do tail -n +6 $filename > ../corpus_output/body/body-${filename}
done

# Go back to the bin folder to run R script
cd ../..
cd bin
Rscript wordfreq_body.R