class: Workflow
cwlVersion: v1.0
id: bam_collapsing
label: bam_collapsing
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: referece_fasta
    type: File
    secondaryFiles:
      - .fai
      - ^.dict
    'sbg:x': 0
    'sbg:y': 234.5703125
  - id: bed_file
    type: File
    'sbg:x': 0
    'sbg:y': 768.1953125
  - id: bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 874.9140625
  - id: min_map_quality
    type: int
    'sbg:x': 0
    'sbg:y': 448.015625
  - id: min_base_quality
    type: int
    'sbg:x': 0
    'sbg:y': 661.46875
  - id: mismatches
    type: int
    'sbg:x': 0
    'sbg:y': 341.2890625
  - id: wobble
    type: int
    'sbg:x': 0
    'sbg:y': 127.8515625
  - id: min_consensus_percent
    type: int
    'sbg:x': 0
    'sbg:y': 554.7421875
  - id: key
    type:
      type: array
      items: string
      inputBinding:
        prefix: '-k'
    'sbg:x': 611.6011962890625
    'sbg:y': 713.1171875
  - id: sort_first_pass_output_file_name
    type: string
    'sbg:x': 611.6011962890625
    'sbg:y': 182.921875
  - id: output_name_collapsed_gzip_R1
    type: string?
    'sbg:x': 678.27001953125
    'sbg:y': -149.06150817871094
  - id: output_name_collapsed_gzip_R2
    type: string?
    'sbg:x': 850.1781616210938
    'sbg:y': -319.4798889160156
outputs:
  - id: second_pass_insertions
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_insertions
    type: File
    'sbg:x': 1066.373046875
    'sbg:y': 120.71875
  - id: second_pass_alt_alleles
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_alt_alleles
    type: File
    'sbg:x': 1066.373046875
    'sbg:y': 227.4375
  - id: collapsed_fastq_2
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_2
    type: File
    'sbg:x': 1066.373046875
    'sbg:y': 775.328125
  - id: collapsed_fastq_1
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_1
    type: File
    'sbg:x': 1066.373046875
    'sbg:y': 882.046875
  - id: pileup_without_duplicates
    outputSource:
      - waltz_pileupmetrics/pileup_without_duplicates
    type: File
    'sbg:x': 611.6011962890625
    'sbg:y': 76.203125
  - id: intervals_without_duplicates
    outputSource:
      - waltz_pileupmetrics/intervals_without_duplicates
    type: File
    'sbg:x': 611.6011962890625
    'sbg:y': 819.84375
  - id: intervals
    outputSource:
      - waltz_pileupmetrics/intervals
    type: File
    'sbg:x': 611.6011962890625
    'sbg:y': 926.5625
  - id: first_pass_insertions
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_insertions
    type: File
    'sbg:x': 1066.373046875
    'sbg:y': 668.609375
  - id: alt_allele_file
    outputSource:
      - marianas_collapsing_first_pass_cwl/alt_allele_file
    type: File
    'sbg:x': 1066.373046875
    'sbg:y': 988.765625
  - id: first_pass_output_dir
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_output_dir
    type: Directory
    'sbg:x': 1066.373046875
    'sbg:y': 561.890625
  - id: output_file_1
    outputSource:
      - gzip_1/output_file
    type: File
    'sbg:x': 1311.701171875
    'sbg:y': 448.0234375
  - id: output_file_2
    outputSource:
      - gzip_2/output_file
    type: File
    'sbg:x': 1311.701171875
    'sbg:y': 676.0526123046875
steps:
  - id: waltz_pileupmetrics
    in:
      - id: bam
        source: bam
      - id: referece_fasta
        source: referece_fasta
      - id: min_map_quality
        source: min_map_quality
      - id: bed_file
        source: bed_file
    out:
      - id: pileup
      - id: pileup_without_duplicates
      - id: intervals
      - id: intervals_without_duplicates
    run: >-
      command_line_tools/waltz_pileupmatrices_3.1.1/waltz_pileupmatrices_3.1.1.cwl
    label: waltz_pileupmetrics
    'sbg:x': 244.28125
    'sbg:y': 480.3828125
  - id: marianas_collapsing_first_pass_cwl
    in:
      - id: input_bam
        source: bam
      - id: pileup
        source: waltz_pileupmetrics/pileup
      - id: min_mapping_quality
        source: min_map_quality
      - id: min_base_quality
        source: min_base_quality
      - id: mismatches
        source: mismatches
      - id: wobble
        source: wobble
      - id: min_consensus_percent
        source: min_consensus_percent
      - id: reference_fasta
        source: referece_fasta
    out:
      - id: first_pass_output_file
      - id: alt_allele_file
      - id: first_pass_insertions
      - id: first_pass_output_dir
    run: >-
      command_line_tools/marianas_collapsing_first_pass_1.8.1/marianas_first_pass.cwl
    'sbg:x': 611.6011962890625
    'sbg:y': 557.3828125
  - id: sort
    in:
      - id: input
        linkMerge: merge_flattened
        source:
          - marianas_collapsing_first_pass_cwl/first_pass_output_file
      - id: key
        default:
          - '6,6n'
          - '8,8n'
        source:
          - key
      - id: output
        source: sort_first_pass_output_file_name
    out:
      - id: sorted
    run: command_line_tools/utilities_ubuntu_18.04/sort.cwl
    'sbg:x': 1066.373046875
    'sbg:y': 0
  - id: marianas_collapsing_second_pass_cwl
    in:
      - id: input_bam
        source: bam
      - id: pileup
        source: waltz_pileupmetrics/pileup
      - id: min_mapping_quality
        source: min_map_quality
      - id: min_base_quality
        source: min_base_quality
      - id: mismatches
        source: mismatches
      - id: wobble
        source: wobble
      - id: min_consensus_percent
        source: min_consensus_percent
      - id: reference_fasta
        source: referece_fasta
      - id: first_pass_file
        source: sort/sorted
    out:
      - id: collapsed_fastq_1
      - id: collapsed_fastq_2
      - id: second_pass_alt_alleles
      - id: second_pass_insertions
    run: >-
      command_line_tools/marianas_collapsing_second_pass_1.8.1/marianas_second_pass.cwl
    'sbg:x': 611.6011962890625
    'sbg:y': 345.6484375
  - id: gzip_1
    in:
      - id: input
        source: marianas_collapsing_second_pass_cwl/collapsed_fastq_1
      - id: output
        source: output_name_collapsed_gzip_R1
    out:
      - id: output_file
    run: command_line_tools/utilities_ubuntu_18.04/gzip.cwl
    label: gzip_1
    'sbg:x': 1066.373046875
    'sbg:y': 448.03125
  - id: gzip_2
    in:
      - id: input
        source: marianas_collapsing_second_pass_cwl/collapsed_fastq_2
      - id: output
        source: output_name_collapsed_gzip_R2
    out:
      - id: output_file
    run: command_line_tools/utilities_ubuntu_18.04/gzip.cwl
    label: gzip_2
    'sbg:x': 1066.373046875
    'sbg:y': 334.1640625
requirements: []
