#!/bin/bash

# Set the input directory

## Input
sample_dir="../rawData" # Path to raw data folder

## Output
trim_output_dir="../analysis/trim" # Path to output trim folder
bam_output_dir="../analysis/map" # Path to output map folder


## Tools
rmDupPE="../rmDupPE.pl"  # Specify the path to rmDupPE.pl
trimmomatic="../trimmomatic-0.33.jar"  # Specify the path to trimmomatic.jar
hisat2="../hisat2"   # Specify the path to hisat2

## Genomes
genome_index="../HISAT2/tair10"  # Specify the path to your hisat2 genome index
adapters="../adapters/NexteraPE-PE.fa"  # Specify the path to your trimmomatic adapters

