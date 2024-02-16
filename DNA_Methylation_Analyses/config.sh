#!/bin/bash

# Set the directory

## Input
sample_dir="../rawData" # Path to raw data folder

## Output
trim_output_dir="../trim" # Path to trim folder
bam_output_dir="../map" # Path to map folder

## Tools
rmDupPE="../rmDupPE.pl"  # Specify the path to rmDupPE.pl
trimmomatic="../trimmomatic-0.33.jar"  # Specify the path to trimmomatic.jar
bs_seeker2_align="../BSseeker2/bs_seeker2-align.py"
bs_seeker2_call="../BSseeker2/bs_seeker2-call_methylation.py"

## Genomes
genome_index="../BS2_bt2_Index/"  # Specify the path to your BS2 genome index
genome="../genome.fa" # Specify the path to your genome fa file
genome_index_bs="../BS2_bt2_Index/genome.fa_bowtie2/" # Specify the path to your BS2 genome index
adapters="../Trimmomatic-0.33/adapters/TruSeq3-PE-2.fa" # Specify the path to your trimmomatic adapters
lambda_index="../BS2_bt2_Index/"  # Specify the path to your Bowtie2 genome index
lambda="../lambda.fa" # Specify the path to your lambda genome fa file
lambda_index_bs="../BS2_bt2_Index/lambda.fa_bowtie2/" #  Specify the path to your BS2 lambda genome index



