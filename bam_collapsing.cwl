class: Workflow
cwlVersion: v1.0
id: bam_collapsing
label: bam_collapsing
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference_fasta
    type: File
    secondaryFiles:
      - .fai
      - ^.dict
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
    'sbg:x': 0
    'sbg:y': 213.8125
  - id: bed_file
    type: File
    'sbg:x': 0
    'sbg:y': 1603.59375
  - id: bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 1710.5
  - id: min_map_quality
    type: int
    'sbg:x': 0
    'sbg:y': 1282.875
  - id: min_base_quality
    type: int
    'sbg:x': 0
    'sbg:y': 1496.6875
  - id: mismatches
    type: int
    'sbg:x': 0
    'sbg:y': 1175.96875
  - id: wobble
    type: int
    'sbg:x': 0
    'sbg:y': 0
  - id: min_consensus_percent
    type: int
    'sbg:x': 0
    'sbg:y': 1389.78125
  - id: key
    type:
      type: array
      items: string
      inputBinding:
        prefix: '-k'
    'sbg:x': 686.4761352539062
    'sbg:y': 1067.15625
  - id: sort_first_pass_output_file_name
    type: string
    'sbg:x': 0
    'sbg:y': 106.90625
  - id: output_name_collapsed_gzip_R1
    type: string?
    'sbg:x': 0
    'sbg:y': 1069.0625
  - id: output_name_collapsed_gzip_R2
    type: string?
    'sbg:x': 0
    'sbg:y': 962.15625
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 320.71875
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 427.625
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 534.53125
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 641.4375
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 748.34375
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 855.25
  - id: picard_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 1817.40625
  - id: aln_output_file_name
    type: string?
    'sbg:x': -2.704296827316284
    'sbg:y': 1931.1448974609375
outputs:
  - id: second_pass_insertions
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_insertions
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 520.53125
  - id: second_pass_alt_alleles
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_alt_alleles
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 627.4375
  - id: collapsed_fastq_2
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_2
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 1189.96875
  - id: collapsed_fastq_1
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_1
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 1296.875
  - id: pileup_without_duplicates
    outputSource:
      - waltz_pileupmetrics/pileup_without_duplicates
    type: File
    'sbg:x': 686.4761352539062
    'sbg:y': 536.4375
  - id: intervals_without_duplicates
    outputSource:
      - waltz_pileupmetrics/intervals_without_duplicates
    type: File
    'sbg:x': 686.4761352539062
    'sbg:y': 1174.0625
  - id: intervals
    outputSource:
      - waltz_pileupmetrics/intervals
    type: File
    'sbg:x': 686.4761352539062
    'sbg:y': 1280.96875
  - id: first_pass_insertions
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_insertions
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 1083.0625
  - id: alt_allele_file
    outputSource:
      - marianas_collapsing_first_pass_cwl/alt_allele_file
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 1403.78125
  - id: first_pass_output_dir
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_output_dir
    type: Directory
    'sbg:x': 1141.248046875
    'sbg:y': 976.15625
  - id: gzip_read1
    outputSource:
      - gzip_Read1/output_file
    type: File
    'sbg:x': 1386.544921875
    'sbg:y': 852.703125
  - id: gzip_read2
    outputSource:
      - gzip_Read2/output_file
    type: File
    'sbg:x': 1386.544921875
    'sbg:y': 745.796875
  - id: unfiltered-bam
    outputSource:
      - abra_fx_cwl/abra_fx_bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 1995.94970703125
    'sbg:y': 787.796875
  - id: simplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/simplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2309.788818359375
    'sbg:y': 680.890625
  - id: duplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/duplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2309.788818359375
    'sbg:y': 1029.609375
  - id: alignment_metrics_unfiltered
    outputSource:
      - picard_collect_alignment_summary_metrics_unfiltered/alignment_metrics
    type: File
    'sbg:x': 2309.788818359375
    'sbg:y': 1136.515625
  - id: alignment_metrics_simplex
    outputSource:
      - picard_collect_alignment_summary_metrics_simplex/alignment_metrics
    type: File
    'sbg:x': 2618.9248046875
    'sbg:y': 855.25
  - id: alignment_metrics_duplex
    outputSource:
      - picard_collect_alignment_summary_metrics_duplex/alignment_metrics
    type: File
    'sbg:x': 2618.9248046875
    'sbg:y': 962.15625
  - id: output_file
    outputSource:
      - abra_fx_cwl/output_file
    type: File?
    label: indel_realign_targets
    'sbg:x': 1899.8309326171875
    'sbg:y': 608.4406127929688
steps:
  - id: waltz_pileupmetrics
    in:
      - id: bam
        source: bam
      - id: referece_fasta
        source: reference_fasta
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
    'sbg:x': 319.15625
    'sbg:y': 887.703125
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
        source: reference_fasta
    out:
      - id: first_pass_output_file
      - id: alt_allele_file
      - id: first_pass_insertions
      - id: first_pass_output_dir
    run: >-
      command_line_tools/marianas_collapsing_first_pass_1.8.1/marianas_first_pass.cwl
    'sbg:x': 686.4761352539062
    'sbg:y': 911.25
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
    'sbg:x': 1141.248046875
    'sbg:y': 399.625
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
        source: reference_fasta
      - id: first_pass_file
        source: sort/sorted
    out:
      - id: collapsed_fastq_1
      - id: collapsed_fastq_2
      - id: second_pass_alt_alleles
      - id: second_pass_insertions
    run: >-
      command_line_tools/marianas_collapsing_second_pass_1.8.1/marianas_second_pass.cwl
    'sbg:x': 686.4761352539062
    'sbg:y': 699.34375
  - id: gzip_Read1
    in:
      - id: input
        source: marianas_collapsing_second_pass_cwl/collapsed_fastq_1
      - id: output
        source: output_name_collapsed_gzip_R1
    out:
      - id: output_file
    run: command_line_tools/utilities_ubuntu_18.04/gzip.cwl
    label: gzip_Read1
    'sbg:x': 1141.248046875
    'sbg:y': 862.25
  - id: gzip_Read2
    in:
      - id: input
        source: marianas_collapsing_second_pass_cwl/collapsed_fastq_2
      - id: output
        source: output_name_collapsed_gzip_R2
    out:
      - id: output_file
    run: command_line_tools/utilities_ubuntu_18.04/gzip.cwl
    label: gzip_Read2
    'sbg:x': 1141.248046875
    'sbg:y': 741.34375
  - id: alignment
    in:
      - id: reference
        source: reference_fasta
      - id: reads
        source:
          - gzip_Read1/output_file
          - gzip_Read2/output_file
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
      - id: output_file_name
        source: picard_output_file_name
      - id: output
        source: aln_output_file_name
    out:
      - id: bam
    run: subworkflows/alignment.cwl
    label: alignment
    'sbg:x': 1386.544921875
    'sbg:y': 1015.609375
  - id: abra_fx_cwl
    in:
      - id: input_bam
        source:
          - alignment/bam
      - id: reference_fasta
        source: reference_fasta
      - id: bam_index
        default: true
      - id: option_bedgraph
        default: true
    out:
      - id: abra_fx_bam
      - id: output_file
    run: subworkflows/abra_fx-cwl.cwl
    label: abra_fx.cwl
    'sbg:x': 1703.363525390625
    'sbg:y': 952.2060546875
  - id: marianas_separate_bams_1_8_1
    in:
      - id: input_bam
        source:
          - abra_fx_cwl/abra_fx_bam
    out:
      - id: duplex-bam
      - id: simplex-bam
    run: >-
      command_line_tools/marianas_separate_bams_1.8.1/marianas_separate_bams_1.8.1.cwl
    label: marianas_separate_bams_1.8.1
    'sbg:x': 1995.94970703125
    'sbg:y': 1022.609375
  - id: picard_collect_alignment_summary_metrics_unfiltered
    in:
      - id: input
        source:
          - abra_fx_cwl/abra_fx_bam
      - id: reference_sequence
        source: reference_fasta
    out:
      - id: alignment_metrics
    run: >-
      command_line_tools/picard_collect_alignment_summary_metrics_2.8.1/picard_collect_alignment_summary_metrics_2.8.1.cwl
    label: picard_collect_alignment_summary_metrics_unflitered
    'sbg:x': 1995.94970703125
    'sbg:y': 901.703125
  - id: picard_collect_alignment_summary_metrics_duplex
    in:
      - id: input
        source: marianas_separate_bams_1_8_1/duplex-bam
      - id: reference_sequence
        source: reference_fasta
    out:
      - id: alignment_metrics
    run: >-
      command_line_tools/picard_collect_alignment_summary_metrics_2.8.1/picard_collect_alignment_summary_metrics_2.8.1.cwl
    label: picard_collect_alignment_summary_metrics_duplex
    'sbg:x': 2309.788818359375
    'sbg:y': 915.703125
  - id: picard_collect_alignment_summary_metrics_simplex
    in:
      - id: input
        source: marianas_separate_bams_1_8_1/simplex-bam
      - id: reference_sequence
        source: reference_fasta
    out:
      - id: alignment_metrics
    run: >-
      command_line_tools/picard_collect_alignment_summary_metrics_2.8.1/picard_collect_alignment_summary_metrics_2.8.1.cwl
    label: picard_collect_alignment_summary_metrics_simplex
    'sbg:x': 2309.788818359375
    'sbg:y': 794.796875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
