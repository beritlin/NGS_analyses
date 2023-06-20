#!/bin/bash

# Set the input and output directories
input_dir="input path"
output_dir="output path"

# Set the path to Trimmomatic
trimmomatic_jar="Trimmomatic-0.33/trimmomatic-0.33.jar"

# Set the path to the adaptors file
adapters_file="Trimmomatic-0.33/adapters/NexteraPE-PE.fa" ## can be change to other adaptor

# Process each pair of input files
for r1_file in ${input_dir}*R1.fastq.gz; do
            # Extract the filename without the extension
                filename=$(basename "$r1_file" _R1.fastq.gz)

                    # Construct the output file paths
                        r1_paired_output="${output_dir}${filename}_R1_paired.fastq.gz"
                            r1_unpaired_output="${output_dir}${filename}_R1_unpaired.fastq.gz"
                                r2_paired_output="${output_dir}${filename}_R2_paired.fastq.gz"
                                    r2_unpaired_output="${output_dir}${filename}_R2_unpaired.fastq.gz"

                                        # Run Trimmomatic
                                            java -jar "$trimmomatic_jar" PE -phred33 \
                                                            "${input_dir}${filename}_R1.fastq.gz" "${input_dir}${filename}_R2.fastq.gz" \
                                                                    "$r1_paired_output" "$r1_unpaired_output" "$r2_paired_output" "$r2_unpaired_output" \
                                                                            "ILLUMINACLIP:$adapters_file:2:30:10:8:true" LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
                                                                    done
