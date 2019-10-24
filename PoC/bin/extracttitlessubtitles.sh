#!/bin/bash

# Changes directory to corpus_input directory
cd ..
cd data/corpus_input/

# Loop to extract body text and output to new .txt files in corpus_output
for filename in *.txt
do head -n 3 $filename | tail -n 2 > ../corpus_output/titlessubtitles/titlesubtitles-${filename}
done

# Go back to the bin folder to run R script
cd ../..
cd bin
Rscript wordfreq_titlessubtitles.R