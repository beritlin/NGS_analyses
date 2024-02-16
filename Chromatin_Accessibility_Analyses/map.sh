#!/bin/bash

# Source the configuration file
source config.sh

# Function to process each sample
process_sample() {
    local sample_name="$1"


    echo "Processing: $sample_name"

    # Remove duplicates
    $rmDupPE "$sample_dir/${sample_name}_R1.fastq.gz" "$sample_dir/${sample_name}_R2.fastq.gz" "$trim_output_dir/${sample_name}_1.fastq.gz" "$trim_output_dir/${sample_name}_2.fastq.gz"

    # Trim using Trimmomatic
    java -jar $trimmomatic PE -phred33 "$trim_output_dir/${sample_name}_1.fastq.gz" "$trim_output_dir/${sample_name}_2.fastq.gz" \
        "$trim_output_dir/${sample_name}_1_uniq_paired.fastq.gz" "$trim_output_dir/${sample_name}_1_uniq_unpaired.fastq.gz" \
        "$trim_output_dir/${sample_name}_2_uniq_paired.fastq.gz" "$trim_output_dir/${sample_name}_2_uniq_unpaired.fastq.gz" \
        ILLUMINACLIP:$adapters:2:30:10:8:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

    # Map using Bowtie2 and sort
    bowtie2 -p 44 -x "$genome_index" --no-discordant --very-sensitive --maxins 2000 \
        -1 "$trim_output_dir/${sample_name}_1_uniq_paired.fastq.gz" -2 "$trim_output_dir/${sample_name}_2_uniq_paired.fastq.gz" \
        | samtools view -Sb - | samtools sort - > "$bam_output_dir/${sample_name}.bam"

    echo "Processed: $sample_name"
}

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

# Read each line from the file and process SRA data
while IFS= read -r accession; do
    process_sample "$accession"
done < "$input_file"

echo "Processing complete."


