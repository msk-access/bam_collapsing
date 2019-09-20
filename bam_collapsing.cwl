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
    'sbg:y': 321.375
  - id: bed_file
    type: File
    'sbg:x': 0
    'sbg:y': 2142.5
  - id: bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 2249.625
  - id: min_map_quality
    type: int
    'sbg:x': 0
    'sbg:y': 1606.875
  - id: min_base_quality
    type: int
    'sbg:x': 0
    'sbg:y': 1821.125
  - id: mismatches
    type: int
    'sbg:x': 0
    'sbg:y': 1499.75
  - id: wobble
    type: int
    'sbg:x': 0
    'sbg:y': 0
  - id: min_consensus_percent
    type: int
    'sbg:x': 0
    'sbg:y': 1714
  - id: key
    type:
      type: array
      items: string
      inputBinding:
        prefix: '-k'
    'sbg:x': 686.4448852539062
    'sbg:y': 1227.375
  - id: sort_first_pass_output_file_name
    type: string
    'sbg:x': 0
    'sbg:y': 214.25
  - id: output_name_collapsed_gzip_R1
    type: string?
    'sbg:x': 0
    'sbg:y': 1392.625
  - id: output_name_collapsed_gzip_R2
    type: string?
    'sbg:x': 0
    'sbg:y': 1285.5
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 428.5
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 535.625
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 642.75
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 749.875
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 857
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 964.125
  - id: picard_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 1071.25
  - id: aln_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 2356.75
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 107.125
  - id: M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1928.25
  - id: create_bam_index
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2035.375
  - id: P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1178.375
outputs:
  - id: second_pass_insertions
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_insertions
    type: File
    'sbg:x': 1775.3162841796875
    'sbg:y': 896.5625
  - id: second_pass_alt_alleles
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_alt_alleles
    type: File
    'sbg:x': 1775.3162841796875
    'sbg:y': 1003.6875
  - id: collapsed_fastq_2
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_2
    type: File
    'sbg:x': 1775.3162841796875
    'sbg:y': 1353.0625
  - id: collapsed_fastq_1
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_1
    type: File
    'sbg:x': 1775.3162841796875
    'sbg:y': 1460.1875
  - id: pileup_without_duplicates
    outputSource:
      - waltz_pileupmetrics/pileup_without_duplicates
    type: File
    'sbg:x': 686.4448852539062
    'sbg:y': 915.125
  - id: intervals_without_duplicates
    outputSource:
      - waltz_pileupmetrics/intervals_without_duplicates
    type: File
    'sbg:x': 686.4448852539062
    'sbg:y': 1334.5
  - id: intervals
    outputSource:
      - waltz_pileupmetrics/intervals
    type: File
    'sbg:x': 686.4448852539062
    'sbg:y': 1441.625
  - id: first_pass_insertions
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_insertions
    type: File
    'sbg:x': 1104.43505859375
    'sbg:y': 1231.9375
  - id: alt_allele_file
    outputSource:
      - marianas_collapsing_first_pass_cwl/alt_allele_file
    type: File
    'sbg:x': 1104.43505859375
    'sbg:y': 1339.0625
  - id: first_pass_output_dir
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_output_dir
    type: Directory
    'sbg:x': 1104.43505859375
    'sbg:y': 1124.8125
  - id: gzip_read1
    outputSource:
      - gzip_Read1/output_file
    type: File
    'sbg:x': 2020.5975341796875
    'sbg:y': 1087.375
  - id: gzip_read2
    outputSource:
      - gzip_Read2/output_file
    type: File
    'sbg:x': 2020.5975341796875
    'sbg:y': 980.25
  - id: simplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/simplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2797.64013671875
    'sbg:y': 950.125
  - id: duplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/duplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2797.64013671875
    'sbg:y': 1299.5
  - id: alignment_metrics_unfiltered
    outputSource:
      - picard_collect_alignment_summary_metrics_unfiltered/alignment_metrics
    type: File
    'sbg:x': 2797.64013671875
    'sbg:y': 1406.625
  - id: alignment_metrics_simplex
    outputSource:
      - picard_collect_alignment_summary_metrics_simplex/alignment_metrics
    type: File
    'sbg:x': 3106.7294921875
    'sbg:y': 1124.8125
  - id: alignment_metrics_duplex
    outputSource:
      - picard_collect_alignment_summary_metrics_duplex/alignment_metrics
    type: File
    'sbg:x': 3106.7294921875
    'sbg:y': 1231.9375
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
    'sbg:x': 319.125
    'sbg:y': 1157.375
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
    'sbg:x': 686.4448852539062
    'sbg:y': 1071.25
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
    'sbg:x': 1104.43505859375
    'sbg:y': 1003.6875
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
    'sbg:x': 1320.54443359375
    'sbg:y': 1122.375
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
    'sbg:x': 1775.3162841796875
    'sbg:y': 1238.9375
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
    'sbg:x': 1775.3162841796875
    'sbg:y': 1117.8125
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
        source: P
      - id: M
        default: true
        source: M
      - id: read_group_identifier
        source: read_group_identifier
      - id: sort_order
        default: coordinate
        source: sort_order
      - id: create_bam_index
        default: true
        source: create_bam_index
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
    'sbg:x': 2020.5975341796875
    'sbg:y': 1285.5
  - id: marianas_separate_bams_1_8_1
    in:
      - id: input_bam
        source: alignment/bam
    out:
      - id: duplex-bam
      - id: simplex-bam
    run: >-
      command_line_tools/marianas_separate_bams_1.8.1/marianas_separate_bams_1.8.1.cwl
    label: marianas_separate_bams_1.8.1
    'sbg:x': 2483.84814453125
    'sbg:y': 1231.9375
  - id: picard_collect_alignment_summary_metrics_unfiltered
    in:
      - id: input
        source: alignment/bam
      - id: reference_sequence
        source: reference_fasta
    out:
      - id: alignment_metrics
    run: >-
      command_line_tools/picard_collect_alignment_summary_metrics_2.8.1/picard_collect_alignment_summary_metrics_2.8.1.cwl
    label: picard_collect_alignment_summary_metrics_unflitered
    'sbg:x': 2483.84814453125
    'sbg:y': 1110.8125
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
    'sbg:x': 2797.64013671875
    'sbg:y': 1185.375
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
    'sbg:x': 2797.64013671875
    'sbg:y': 1064.25
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
