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
    'sbg:y': 213.65625
  - id: bed_file
    type: File
    'sbg:x': 0
    'sbg:y': 1602.421875
  - id: bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 1709.25
  - id: min_map_quality
    type: int
    'sbg:x': 0
    'sbg:y': 1281.9375
  - id: min_base_quality
    type: int
    'sbg:x': 0
    'sbg:y': 1495.59375
  - id: mismatches
    type: int
    'sbg:x': 0
    'sbg:y': 1175.109375
  - id: wobble
    type: int
    'sbg:x': 0
    'sbg:y': 0
  - id: min_consensus_percent
    type: int
    'sbg:x': 0
    'sbg:y': 1388.765625
  - id: key
    type:
      type: array
      items: string
      inputBinding:
        prefix: '-k'
    'sbg:x': 686.4918212890625
    'sbg:y': 1013.0390625
  - id: sort_first_pass_output_file_name
    type: string
    'sbg:x': 0
    'sbg:y': 106.828125
  - id: output_name_collapsed_gzip_R1
    type: string?
    'sbg:x': 0
    'sbg:y': 1068.28125
  - id: output_name_collapsed_gzip_R2
    type: string?
    'sbg:x': 0
    'sbg:y': 961.453125
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 320.484375
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 427.3125
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 534.140625
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 640.96875
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 747.796875
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 854.625
outputs:
  - id: second_pass_insertions
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_insertions
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 466.7265625
  - id: second_pass_alt_alleles
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_alt_alleles
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 573.5546875
  - id: collapsed_fastq_2
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_2
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 1135.6953125
  - id: collapsed_fastq_1
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_1
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 1242.5234375
  - id: pileup_without_duplicates
    outputSource:
      - waltz_pileupmetrics/pileup_without_duplicates
    type: File
    'sbg:x': 686.4918212890625
    'sbg:y': 482.5546875
  - id: intervals_without_duplicates
    outputSource:
      - waltz_pileupmetrics/intervals_without_duplicates
    type: File
    'sbg:x': 686.4918212890625
    'sbg:y': 1119.8671875
  - id: intervals
    outputSource:
      - waltz_pileupmetrics/intervals
    type: File
    'sbg:x': 686.4918212890625
    'sbg:y': 1226.6953125
  - id: first_pass_insertions
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_insertions
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 1028.8671875
  - id: alt_allele_file
    outputSource:
      - marianas_collapsing_first_pass_cwl/alt_allele_file
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 1349.3515625
  - id: first_pass_output_dir
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_output_dir
    type: Directory
    'sbg:x': 1141.263671875
    'sbg:y': 922.0390625
  - id: output_file_1
    outputSource:
      - gzip_1/output_file
    type: File
    'sbg:x': 1386.576171875
    'sbg:y': 805.625
  - id: output_file_2
    outputSource:
      - gzip_2/output_file
    type: File
    'sbg:x': 1386.576171875
    'sbg:y': 698.796875
  - id: bam_1
    outputSource:
      - abra_fx_cwl/bam
    type: File
    'sbg:x': 1983.9521484375
    'sbg:y': 854.625
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
    'sbg:x': 319.171875
    'sbg:y': 833.625
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
    'sbg:x': 686.4918212890625
    'sbg:y': 857.2109375
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
    'sbg:x': 1141.263671875
    'sbg:y': 345.8984375
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
    'sbg:x': 686.4918212890625
    'sbg:y': 645.3828125
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
    'sbg:x': 1141.263671875
    'sbg:y': 808.2109375
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
    'sbg:x': 1141.263671875
    'sbg:y': 687.3828125
  - id: alignment
    in:
      - id: reference
        source: referece_fasta
      - id: reads
        source:
          - gzip_1/output_file
          - gzip_2/output_file
      - id: P
        default: true
      - id: M
        default: true
      - id: read_group_identifier
        source: read_group_identifier
      - id: sort_order
        default: coordinate
      - id: create_bam_index
        default: true
      - id: read_group_sequnecing_center
        source: read_group_sequnecing_center
      - id: read_group_sequencing_platform
        source: read_group_sequencing_platform
      - id: read_group_sample_name
        source: read_group_sample_name
      - id: read_group_platform_unit
        source: read_group_platform_unit
      - id: read_group_library
        source: read_group_library
    out:
      - id: bam
    run: subworkflows/alignment.cwl
    label: alignment
    'sbg:x': 1616
    'sbg:y': 1131
  - id: abra_fx_cwl
    in:
      - id: input_bam
        source:
          - alignment/bam
      - id: reference_fasta
        source: referece_fasta
      - id: bam_index
        default: true
      - id: option_bedgraph
        default: true
    out:
      - id: bam
    run: subworkflows/abra_fx-cwl.cwl
    label: abra_fx.cwl
    'sbg:x': 1775.50390625
    'sbg:y': 847.625
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
