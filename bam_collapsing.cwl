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
    'sbg:y': 213.40625
  - id: bed_file
    type: File
    'sbg:x': 0
    'sbg:y': 1600.859375
  - id: bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 1707.5625
  - id: min_map_quality
    type: int
    'sbg:x': 0
    'sbg:y': 1280.703125
  - id: min_base_quality
    type: int
    'sbg:x': 0
    'sbg:y': 1494.140625
  - id: mismatches
    type: int
    'sbg:x': 0
    'sbg:y': 1173.984375
  - id: wobble
    type: int
    'sbg:x': 0
    'sbg:y': 0
  - id: min_consensus_percent
    type: int
    'sbg:x': 0
    'sbg:y': 1387.421875
  - id: key
    type:
      type: array
      items: string
      inputBinding:
        prefix: '-k'
    'sbg:x': 686.4761352539062
    'sbg:y': 1012.1640625
  - id: sort_first_pass_output_file_name
    type: string
    'sbg:x': 0
    'sbg:y': 106.703125
  - id: output_name_collapsed_gzip_R1
    type: string?
    'sbg:x': 0
    'sbg:y': 1067.265625
  - id: output_name_collapsed_gzip_R2
    type: string?
    'sbg:x': 0
    'sbg:y': 960.53125
  - id: read_group_sequnecing_center
    type: string
    'sbg:x': 0
    'sbg:y': 320.125
  - id: read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 426.859375
  - id: read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 533.59375
  - id: read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 640.328125
  - id: read_group_library
    type: int
    'sbg:x': 0
    'sbg:y': 747.0625
  - id: read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 853.796875
outputs:
  - id: second_pass_insertions
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_insertions
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 466.2890625
  - id: second_pass_alt_alleles
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_alt_alleles
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 572.9921875
  - id: collapsed_fastq_2
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_2
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 1134.5703125
  - id: collapsed_fastq_1
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_1
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 1241.2734375
  - id: pileup_without_duplicates
    outputSource:
      - waltz_pileupmetrics/pileup_without_duplicates
    type: File
    'sbg:x': 686.4761352539062
    'sbg:y': 481.9765625
  - id: intervals_without_duplicates
    outputSource:
      - waltz_pileupmetrics/intervals_without_duplicates
    type: File
    'sbg:x': 686.4761352539062
    'sbg:y': 1118.8828125
  - id: intervals
    outputSource:
      - waltz_pileupmetrics/intervals
    type: File
    'sbg:x': 686.4761352539062
    'sbg:y': 1225.5859375
  - id: first_pass_insertions
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_insertions
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 1027.8671875
  - id: alt_allele_file
    outputSource:
      - marianas_collapsing_first_pass_cwl/alt_allele_file
    type: File
    'sbg:x': 1141.248046875
    'sbg:y': 1347.9765625
  - id: first_pass_output_dir
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_output_dir
    type: Directory
    'sbg:x': 1141.248046875
    'sbg:y': 921.1640625
  - id: gzip_read1
    outputSource:
      - gzip_Read1/output_file
    type: File
    'sbg:x': 1386.544921875
    'sbg:y': 804.765625
  - id: gzip_read2
    outputSource:
      - gzip_Read2/output_file
    type: File
    'sbg:x': 1386.544921875
    'sbg:y': 698.03125
  - id: unfiltered-bam
    outputSource:
      - abra_fx_cwl/bam
    type: File
    'sbg:x': 1983.9210205078125
    'sbg:y': 733.0625
  - id: simplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/simplex-bam
    type: File
    'sbg:x': 2297.76025390625
    'sbg:y': 626.328125
  - id: duplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/duplex-bam
    type: File
    'sbg:x': 2297.76025390625
    'sbg:y': 974.5
  - id: alignment_metrics_unfiltered
    outputSource:
      - picard_collect_alignment_summary_metrics_unfiltered/alignment_metrics
    type: File
    'sbg:x': 2297.76025390625
    'sbg:y': 1081.21875
  - id: alignment_metrics_simplex
    outputSource:
      - picard_collect_alignment_summary_metrics_simplex/alignment_metrics
    type: File
    'sbg:x': 2606.89599609375
    'sbg:y': 800.3984375
  - id: alignment_metrics_duplex
    outputSource:
      - picard_collect_alignment_summary_metrics_duplex/alignment_metrics
    type: File
    'sbg:x': 2606.89599609375
    'sbg:y': 907.1328125
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
    'sbg:y': 832.78125
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
    'sbg:y': 856.4296875
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
    'sbg:y': 345.5859375
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
    'sbg:y': 644.6953125
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
    'sbg:y': 807.4453125
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
    'sbg:y': 686.7109375
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
    out:
      - id: bam
    run: subworkflows/alignment.cwl
    label: alignment
    'sbg:x': 1386.544921875
    'sbg:y': 960.5
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
      - id: bam
    run: subworkflows/abra_fx-cwl.cwl
    label: abra_fx.cwl
    'sbg:x': 1775.4725341796875
    'sbg:y': 846.78125
  - id: marianas_separate_bams_1_8_1
    in:
      - id: input_bam
        source: abra_fx_cwl/bam
    out:
      - id: duplex-bam
      - id: simplex-bam
    run: >-
      command_line_tools/marianas_separate_bams_1.8.1/marianas_separate_bams_1.8.1.cwl
    'sbg:x': 1983.9210205078125
    'sbg:y': 967.5
  - id: picard_collect_alignment_summary_metrics_unfiltered
    in:
      - id: input
        source: abra_fx_cwl/bam
      - id: reference_sequence
        source: reference_fasta
    out:
      - id: alignment_metrics
    run: >-
      command_line_tools/picard_collect_alignment_summary_metrics_2.8.1/picard_collect_alignment_summary_metrics_2.8.1.cwl
    label: picard_collect_alignment_summary_metrics_unflitered
    'sbg:x': 1983.9210205078125
    'sbg:y': 846.78125
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
    'sbg:x': 2297.76025390625
    'sbg:y': 860.78125
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
    'sbg:x': 2297.76025390625
    'sbg:y': 740.046875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
