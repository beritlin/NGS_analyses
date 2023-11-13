#!/bin/bash

# Check if the required commands 'prefetch' and 'fastq-dump' are installed
if ! command -v prefetch &> /dev/null || ! command -v fastq-dump &> /dev/null; then
    echo "SRA Toolkit is not installed. Please install it first."
    exit 1
fi

# Check if the input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_with_sra_accessions.txt>"
    exit 1
fi

# Input file containing SRA accession numbers
input_file="$1"

# Check if the input file exists
if [ ! -e "$input_file" ]; then
    echo "Error: File $input_file not found."
    exit 1
fi

# Read each line from the file and download SRA data
while IFS= read -r accession; do
    echo "Downloading SRA accession: $accession"
    prefetch "$accession"
    
    # Convert the downloaded SRA file to FASTQ format
    fastq-dump --split-3 "$accession"
done < "$input_file"

echo "Download and conversion to FASTQ complete."
