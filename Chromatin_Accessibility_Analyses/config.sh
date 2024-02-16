#!/bin/bash

# Set the directory

## Input
sample_dir="../rawData" # Path to raw data folder

## Output
trim_output_dir="../analysis/trim" # Path to output trim folder
bam_output_dir="../analysis/map" # Path to output map folder

## Tools
rmDupPE="../rmDupPE.pl"  # Specify the path to rmDupPE.pl
trimmomatic="../trimmomatic-0.33.jar"  # Specify the path to trimmomatic.jar

## Genomes
genome_index="../Bowtie2Index/genome"  # Specify the path to your Bowtie2 genome index
adapters="../Trimmomatic-0.33/adapters/NexteraPE-PE.fa"  # Specify the path to your trimmomatic adapters


