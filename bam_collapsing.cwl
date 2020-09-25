class: Workflow
cwlVersion: v1.0
id: bam_collapsing
doc: >-
  This is the workflow is written using Common Workflow Language (CWL) version
  1.0 (https://www.commonwl.org/v1.0/) and is used at Memorial Sloan Kettering
  Cancer Center for producing collapsed bam files from data generated for the NY
  state-approved MSK-ACCESS assay.
label: bam_collapsing
$namespaces:
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: fgbio_group_reads_by_umi_input
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 2881.265625
  - id: fgbio_group_reads_by_umi_strategy
    type: string
    'sbg:x': 0
    'sbg:y': 2027.390625
  - id: fgbio_group_reads_by_umi_raw_tag
    type: string?
    'sbg:x': 0
    'sbg:y': 2134.125
  - id: fgbio_group_reads_by_umi_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 2347.59375
  - id: fgbio_group_reads_by_umi_min_umi_length
    type: int?
    'sbg:x': 0
    'sbg:y': 2454.328125
  - id: fgbio_group_reads_by_umi_include_non_pf_reads
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2988
  - id: fgbio_group_reads_by_umi_family_size_histogram
    type: string?
    'sbg:x': 0
    'sbg:y': 3094.734375
  - id: fgbio_group_reads_by_umi_edits
    type: int?
    'sbg:x': 0
    'sbg:y': 3201.46875
  - id: fgbio_group_reads_by_umi_assign_tag
    type: string?
    'sbg:x': 0
    'sbg:y': 3521.671875
  - id: fgbio_collect_duplex_seq_metrics_intervals
    type: File?
    'sbg:x': 0
    'sbg:y': 3628.40625
  - id: fgbio_group_reads_by_umi_output_prefix
    type: string
    'sbg:x': 0
    'sbg:y': 2240.859375
  - id: fgbio_group_reads_by_umi_min_ba_reads
    type: int?
    'sbg:x': 0
    'sbg:y': 2561.0625
  - id: fgbio_group_reads_by_umi_min_ab_reads
    type: int?
    'sbg:x': 0
    'sbg:y': 2667.796875
  - id: fgbio_group_reads_by_umi_mi_tag
    type: string?
    'sbg:x': 0
    'sbg:y': 2774.53125
  - id: fgbio_group_reads_by_umi_duplex_umi_counts
    type: string?
    'sbg:x': 0
    'sbg:y': 3308.203125
  - id: fgbio_group_reads_by_umi_description
    type: string?
    'sbg:x': 0
    'sbg:y': 3414.9375
  - id: fgbio_call_duplex_consensus_reads_trim
    type: boolean?
    'sbg:x': 0
    'sbg:y': 3735.140625
  - id: fgbio_call_duplex_consensus_reads_sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 3841.875
  - id: fgbio_call_duplex_consensus_reads_read_name_prefix
    type: string?
    'sbg:x': 0
    'sbg:y': 3948.609375
  - id: fgbio_call_duplex_consensus_reads_read_group_id
    type: string?
    'sbg:x': 0
    'sbg:y': 4055.34375
  - id: fgbio_call_duplex_consensus_reads_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 4162.078125
  - id: fgbio_call_duplex_consensus_reads_min_reads
    type: 'int[]'
    'sbg:x': 0
    'sbg:y': 4268.8125
  - id: fgbio_call_duplex_consensus_reads_min_input_base_quality
    type: int?
    'sbg:x': 0
    'sbg:y': 4375.546875
  - id: fgbio_call_duplex_consensus_reads_max_reads_per_strand
    type: int?
    'sbg:x': 0
    'sbg:y': 4482.28125
  - id: fgbio_call_duplex_consensus_reads_error_rate_pre_umi
    type: int?
    'sbg:x': 0
    'sbg:y': 4589.015625
  - id: fgbio_call_duplex_consensus_reads_error_rate_post_umi
    type: int?
    'sbg:x': 0
    'sbg:y': 4695.75
  - id: reference_sequence
    type: File?
    secondaryFiles:
      - .fai
      - .dict
      - .amb
      - .sa
      - .ann
      - .bwt
      - .pac
    'sbg:x': 0
    'sbg:y': 213.2578125
  - id: validation_stringency
    type: string?
    'sbg:x': 0
    'sbg:y': 0
  - id: gatk_sam_to_fastq_output_name_unpaired
    type: string?
    'sbg:x': 0
    'sbg:y': 1386.984375
  - id: gatk_sam_to_fastq_output_name_R2
    type: string?
    'sbg:x': 0
    'sbg:y': 1493.71875
  - id: gatk_sam_to_fastq_include_non_primary_alignments
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1707.1875
  - id: gatk_sam_to_fastq_include_non_pf_reads
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1813.921875
  - id: gatk_sam_to_fastq_output_name_R1
    type: string?
    'sbg:x': 0
    'sbg:y': 1600.453125
  - id: bwa_mem_Y
    type: boolean?
    'sbg:x': 0
    'sbg:y': 4802.4140625
  - id: bwa_mem_T
    type: int?
    'sbg:x': 0
    'sbg:y': 4909.0078125
  - id: bwa_mem_t
    type: int?
    'sbg:x': 0
    'sbg:y': 5015.6015625
  - id: sort_order
    type: string?
    'sbg:x': 0
    'sbg:y': 106.6640625
  - id: bwa_mem_sample_id
    type: string
    'sbg:x': 0
    'sbg:y': 5122.1953125
  - id: picard_addRG_read_group_sequencing_platform
    type: string
    'sbg:x': 0
    'sbg:y': 426.515625
  - id: picard_addRG_read_group_sequencing_center
    type: string
    'sbg:x': 0
    'sbg:y': 533.25
  - id: picard_addRG_read_group_run_date
    type: string?
    'sbg:x': 0
    'sbg:y': 746.71875
  - id: picard_addRG_read_group_platform_unit
    type: string
    'sbg:x': 0
    'sbg:y': 853.453125
  - id: picard_addRG_read_group_library
    type: string
    'sbg:x': 0
    'sbg:y': 960.1875
  - id: picard_addRG_read_group_identifier
    type: string
    'sbg:x': 0
    'sbg:y': 1066.921875
  - id: picard_addRG_read_group_description
    type: string?
    'sbg:x': 0
    'sbg:y': 1173.65625
  - id: bwa_mem_R
    type: string?
    'sbg:x': 0
    'sbg:y': 5228.7890625
  - id: picard_addRG_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 1280.3203125
  - id: bwa_mem_P
    type: boolean?
    'sbg:x': 0
    'sbg:y': 5335.3828125
  - id: bwa_mem_output
    type: string?
    'sbg:x': 0
    'sbg:y': 5441.9765625
  - id: create_bam_index
    type: boolean?
    'sbg:x': 1052.147216796875
    'sbg:y': 3106.6484375
  - id: bwa_mem_M
    type: boolean?
    'sbg:x': 0
    'sbg:y': 5548.5703125
  - id: bwa_mem_K
    type: int?
    'sbg:x': 0
    'sbg:y': 5655.1640625
  - id: abra2_window_size
    type: string?
    'sbg:x': 1624.7490234375
    'sbg:y': 2923.1953125
  - id: abra2_soft_clip_contig
    type: string?
    'sbg:x': 1624.7490234375
    'sbg:y': 3029.859375
  - id: abra2_scoring_gap_alignments
    type: string?
    'sbg:x': 1624.7490234375
    'sbg:y': 3136.59375
  - id: picard_fixmate_information_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 319.8515625
  - id: abra2_output_bams
    type:
      - string
      - type: array
        items: string
    'sbg:x': 1624.7490234375
    'sbg:y': 3243.2578125
  - id: bedtools_genomecov_option_bedgraph
    type: boolean?
    'sbg:x': 1624.7490234375
    'sbg:y': 2816.53125
  - id: abra2_no_sort
    type: boolean?
    'sbg:x': 1624.7490234375
    'sbg:y': 3349.8515625
  - id: abra2_no_edge_complex_indel
    type: boolean?
    'sbg:x': 1624.7490234375
    'sbg:y': 3456.515625
  - id: abra2_maximum_mixmatch_rate
    type: float?
    'sbg:x': 1624.7490234375
    'sbg:y': 3563.1796875
  - id: abra2_maximum_average_depth
    type: int?
    'sbg:x': 1624.7490234375
    'sbg:y': 3669.84375
  - id: bedtools_merge_distance_between_features
    type: int?
    'sbg:x': 1624.7490234375
    'sbg:y': 2709.796875
  - id: abra2_contig_anchor
    type: string?
    'sbg:x': 1624.7490234375
    'sbg:y': 3776.578125
  - id: abra2_consensus_sequence
    type: boolean?
    'sbg:x': 1624.7490234375
    'sbg:y': 3883.2421875
  - id: gatk_merge_bam_alignment_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 1920.65625
  - id: fgbio_filter_consensus_read_reverse_per_base_tags_simplex_duplex
    type: boolean?
    'sbg:x': 2182.387451171875
    'sbg:y': 1819.671875
  - id: fgbio_filter_consensus_read_reverse_per_base_tags_duplex
    type: boolean?
    'sbg:x': 2182.387451171875
    'sbg:y': 1926.40625
  - id: fgbio_filter_consensus_read_require_single_strand_agreement_simplex_duplex
    type: boolean?
    'sbg:x': 2182.387451171875
    'sbg:y': 2033.140625
  - id: fgbio_filter_consensus_read_require_single_strand_agreement_duplex
    type: boolean?
    'sbg:x': 2182.387451171875
    'sbg:y': 2139.875
  - id: fgbio_filter_consensus_read_max_base_error_rate_duplex
    type: 'float[]?'
    'sbg:x': 2182.387451171875
    'sbg:y': 3954.359375
  - id: fgbio_filter_consensus_read_max_base_error_rate_simplex_duplex
    type: 'float[]?'
    'sbg:x': 2182.387451171875
    'sbg:y': 3847.625
  - id: fgbio_filter_consensus_read_max_no_call_fraction_duplex
    type: float?
    'sbg:x': 2182.387451171875
    'sbg:y': 3740.890625
  - id: fgbio_filter_consensus_read_max_read_error_rate_duplex
    type: 'float[]?'
    'sbg:x': 2182.387451171875
    'sbg:y': 3527.421875
  - id: fgbio_filter_consensus_read_max_no_call_fraction_simplex_duplex
    type: float?
    'sbg:x': 2182.387451171875
    'sbg:y': 3634.15625
  - id: fgbio_filter_consensus_read_max_read_error_rate_simplex_duplex
    type: 'float[]?'
    'sbg:x': 2182.387451171875
    'sbg:y': 3420.6875
  - id: fgbio_filter_consensus_read_min_base_quality_duplex
    type: int?
    'sbg:x': 2182.387451171875
    'sbg:y': 3313.953125
  - id: fgbio_filter_consensus_read_min_base_quality_simplex_duplex
    type: int?
    'sbg:x': 2182.387451171875
    'sbg:y': 3207.21875
  - id: fgbio_filter_consensus_read_min_mean_base_quality_duplex
    type: int?
    'sbg:x': 2182.387451171875
    'sbg:y': 3100.484375
  - id: fgbio_filter_consensus_read_min_mean_base_quality_simplex_duplex
    type: int?
    'sbg:x': 2182.387451171875
    'sbg:y': 2993.75
  - id: fgbio_filter_consensus_read_min_reads_duplex
    type: 'int[]'
    'sbg:x': 2182.387451171875
    'sbg:y': 2887.015625
  - id: fgbio_filter_consensus_read_min_reads_simplex_duplex
    type: 'int[]'
    'sbg:x': 2182.387451171875
    'sbg:y': 2780.28125
  - id: fgbio_filter_consensus_read_output_file_name_simplex_duplex
    type: string?
    'sbg:x': 2182.387451171875
    'sbg:y': 2246.609375
  - id: fgbio_filter_consensus_read_output_file_name_simplex_aln_metrics
    type: string?
    'sbg:x': 2182.387451171875
    'sbg:y': 2353.34375
  - id: fgbio_postprocessing_output_file_name_simpex
    type: string?
    'sbg:x': 2182.387451171875
    'sbg:y': 1712.9375
  - id: fgbio_filter_consensus_read_output_file_name_duplex_aln_metrics
    type: string?
    'sbg:x': 2182.387451171875
    'sbg:y': 2460.078125
  - id: fgbio_filter_consensus_read_output_file_name_duplex
    type: string?
    'sbg:x': 2182.387451171875
    'sbg:y': 2566.8125
  - id: fgbio_filter_consensus_read_min_simplex_reads
    type: int?
    'sbg:x': 2182.387451171875
    'sbg:y': 2673.546875
  - id: picard_addRG_read_group_sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 639.984375
outputs:
  - id: fgbio_group_reads_by_umi_histogram
    outputSource:
      - fgbio_group_reads_by_umi_1_2_0/fgbio_group_reads_by_umi_histogram
    type: File
    'sbg:x': 1052.147216796875
    'sbg:y': 2548.515625
  - id: fgbio_collect_duplex_seq_metrics_umi_counts
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_umi_counts
    type: File
    'sbg:x': 1624.7490234375
    'sbg:y': 2069.390625
  - id: fgbio_collect_duplex_seq_metrics_family_size
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_family_size
    type: File
    'sbg:x': 1624.7490234375
    'sbg:y': 2176.125
  - id: fgbio_collect_duplex_seq_metrics_duplex_yield_metrics
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_yield_metrics
    type: File
    'sbg:x': 1624.7490234375
    'sbg:y': 2282.859375
  - id: fgbio_collect_duplex_seq_metrics_duplex_umi_counts
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_umi_counts
    type: File
    'sbg:x': 1624.7490234375
    'sbg:y': 2389.59375
  - id: fgbio_collect_duplex_seq_metrics_duplex_qc
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_qc
    type: File
    'sbg:x': 1624.7490234375
    'sbg:y': 2496.328125
  - id: fgbio_collect_duplex_seq_metrics_duplex_family_size
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_family_size
    type: File
    'sbg:x': 1624.7490234375
    'sbg:y': 2603.0625
  - id: gatk_sam_to_fastq_unpaired_fastq
    outputSource:
      - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_unpaired_fastq
    type: File?
    'sbg:x': 2182.387451171875
    'sbg:y': 1392.734375
  - id: gatk_sam_to_fastq_second_end_fastq
    outputSource:
      - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_second_end_fastq
    type: File?
    'sbg:x': 2182.387451171875
    'sbg:y': 1499.46875
  - id: gatk_sam_to_fastq_fastq
    outputSource:
      - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_fastq
    type: File?
    'sbg:x': 2182.387451171875
    'sbg:y': 1606.203125
  - id: gatk_collect_alignment_summary_metrics_txt_simplex
    outputSource:
      - fgbio_separate_bams/gatk_collect_alignment_summary_metrics_txt_simplex
    type: File
    'sbg:x': 3888.024658203125
    'sbg:y': 2614.078125
  - id: gatk_collect_alignment_summary_metrics_txt_duplex
    outputSource:
      - fgbio_separate_bams/gatk_collect_alignment_summary_metrics_txt_duplex
    type: File
    'sbg:x': 3888.024658203125
    'sbg:y': 2720.8125
  - id: fgbio_postprocessing_simplex_bam
    outputSource:
      - fgbio_separate_bams/fgbio_postprocessing_simplex_bam
    type: File
    'sbg:x': 3888.024658203125
    'sbg:y': 2827.546875
  - id: fgbio_filter_consensus_reads_simplex_duplex_bam
    outputSource:
      - fgbio_separate_bams/fgbio_filter_consensus_reads_simplex_duplex_bam
    type: File
    'sbg:x': 3888.024658203125
    'sbg:y': 2934.28125
  - id: fgbio_filter_consensus_reads_duplex_bam
    outputSource:
      - fgbio_separate_bams/fgbio_filter_consensus_reads_duplex_bam
    type: File
    'sbg:x': 3888.024658203125
    'sbg:y': 3041.015625
steps:
  - id: fgbio_group_reads_by_umi_1_2_0
    in:
      - id: input
        source: fgbio_group_reads_by_umi_input
      - id: output_file_name
        source: fgbio_group_reads_by_umi_output_file_name
      - id: family_size_histogram
        source: fgbio_group_reads_by_umi_family_size_histogram
      - id: raw_tag
        source: fgbio_group_reads_by_umi_raw_tag
      - id: assign_tag
        source: fgbio_group_reads_by_umi_assign_tag
      - id: include_non_pf_reads
        source: fgbio_group_reads_by_umi_include_non_pf_reads
      - id: strategy
        source: fgbio_group_reads_by_umi_strategy
      - id: edits
        source: fgbio_group_reads_by_umi_edits
      - id: min_umi_length
        source: fgbio_group_reads_by_umi_min_umi_length
    out:
      - id: fgbio_group_reads_by_umi_bam
      - id: fgbio_group_reads_by_umi_histogram
    run: >-
      command_line_tools/fgbio_group_reads_by_umi_1.2.0/fgbio_group_reads_by_umi_1.2.0.cwl
    label: fgbio_group_reads_by_umi_1.2.0
    'sbg:x': 541.703125
    'sbg:y': 2771.546875
  - id: fgbio_collect_duplex_seq_metrics_1_2_0
    in:
      - id: input
        source: fgbio_group_reads_by_umi_1_2_0/fgbio_group_reads_by_umi_bam
      - id: output_prefix
        source: fgbio_group_reads_by_umi_output_prefix
      - id: intervals
        source: fgbio_collect_duplex_seq_metrics_intervals
      - id: description
        source: fgbio_group_reads_by_umi_description
      - id: duplex_umi_counts
        source: fgbio_group_reads_by_umi_duplex_umi_counts
      - id: min_ab_reads
        source: fgbio_group_reads_by_umi_min_ab_reads
      - id: min_ba_reads
        source: fgbio_group_reads_by_umi_min_ba_reads
      - id: mi_tag
        source: fgbio_group_reads_by_umi_mi_tag
    out:
      - id: fgbio_collect_duplex_seq_metrics_family_size
      - id: fgbio_collect_duplex_seq_metrics_duplex_family_size
      - id: fgbio_collect_duplex_seq_metrics_duplex_yield_metrics
      - id: fgbio_collect_duplex_seq_metrics_umi_counts
      - id: fgbio_collect_duplex_seq_metrics_duplex_qc
      - id: fgbio_collect_duplex_seq_metrics_duplex_umi_counts
    run: >-
      command_line_tools/fgbio_collect_duplex_seq_metrics_1.2.0/fgbio_collect_duplex_seq_metrics_1.2.0.cwl
    label: fgbio_collect_duplex_seq_metrics_1.2.0
    'sbg:x': 1052.147216796875
    'sbg:y': 2704.25
  - id: fgbio_call_duplex_consensus_reads_1_2_0
    in:
      - id: input
        source: fgbio_group_reads_by_umi_1_2_0/fgbio_group_reads_by_umi_bam
      - id: output_file_name
        source: fgbio_call_duplex_consensus_reads_output_file_name
      - id: read_name_prefix
        source: fgbio_call_duplex_consensus_reads_read_name_prefix
      - id: read_group_id
        source: fgbio_call_duplex_consensus_reads_read_group_id
      - id: error_rate_pre_umi
        source: fgbio_call_duplex_consensus_reads_error_rate_pre_umi
      - id: error_rate_post_umi
        source: fgbio_call_duplex_consensus_reads_error_rate_post_umi
      - id: min_input_base_quality
        source: fgbio_call_duplex_consensus_reads_min_input_base_quality
      - id: trim
        source: fgbio_call_duplex_consensus_reads_trim
      - id: sort_order
        source: fgbio_call_duplex_consensus_reads_sort_order
      - id: min_reads
        source:
          - fgbio_call_duplex_consensus_reads_min_reads
      - id: max_reads_per_strand
        source: fgbio_call_duplex_consensus_reads_max_reads_per_strand
    out:
      - id: fgbio_call_duplex_consensus_reads_bam
    run: >-
      command_line_tools/fgbio_call_duplex_consensus_reads_1.2.0/fgbio_call_duplex_consensus_reads_1.2.0.cwl
    label: fgbio_call_duplex_consensus_reads_1.2.0
    'sbg:x': 1052.147216796875
    'sbg:y': 2929.984375
  - id: gatk_sam_to_fastq_4_1_8_0
    in:
      - id: input
        source: >-
          fgbio_call_duplex_consensus_reads_1_2_0/fgbio_call_duplex_consensus_reads_bam
      - id: fastq
        source: gatk_sam_to_fastq_output_name_R1
      - id: include_non_pf_reads
        source: gatk_sam_to_fastq_include_non_pf_reads
      - id: include_non_primary_alignments
        source: gatk_sam_to_fastq_include_non_primary_alignments
      - id: reference_sequence
        source: reference_sequence
      - id: second_end_fastq
        source: gatk_sam_to_fastq_output_name_R2
      - id: unpaired_fastq
        source: gatk_sam_to_fastq_output_name_unpaired
      - id: validation_stringency
        source: validation_stringency
    out:
      - id: gatk_sam_to_fastq_fastq
      - id: gatk_sam_to_fastq_unpaired_fastq
      - id: gatk_sam_to_fastq_second_end_fastq
    run: command_line_tools/gatk_sam_to_fastq_4.1.8.0/gatk_sam_to_fastq_4.1.8.0.cwl
    label: GATK-SamToFastq
    'sbg:x': 1624.7490234375
    'sbg:y': 1722.9921875
  - id: alignment
    in:
      - id: create_bam_index
        source: create_bam_index
      - id: output_file_name
        source: picard_addRG_output_file_name
      - id: read_group_description
        source: picard_addRG_read_group_description
      - id: read_group_identifier
        source: picard_addRG_read_group_identifier
      - id: read_group_library
        source: picard_addRG_read_group_library
      - id: read_group_platform_unit
        source: picard_addRG_read_group_platform_unit
      - id: read_group_run_date
        source: picard_addRG_read_group_run_date
      - id: read_group_sample_name
        source: picard_addRG_read_group_sample_name
      - id: read_group_sequencing_center
        source: picard_addRG_read_group_sequencing_center
      - id: read_group_sequencing_platform
        source: picard_addRG_read_group_sequencing_platform
      - id: sort_order
        source: sort_order
      - id: validation_stringency
        source: validation_stringency
      - id: reference
        source: reference_sequence
      - id: reads
        source:
          - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_fastq
          - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_second_end_fastq
      - id: output
        source: bwa_mem_output
      - id: P
        source: bwa_mem_P
      - id: M
        source: bwa_mem_M
      - id: sample_id
        source: bwa_mem_sample_id
      - id: R
        source: bwa_mem_R
      - id: t
        source: bwa_mem_t
      - id: T
        source: bwa_mem_T
      - id: 'Y'
        source: bwa_mem_Y
      - id: K
        source: bwa_mem_K
    out:
      - id: picard_add_or_replace_read_groups_bam
    run: subworkflows/alignment/alignment.cwl
    label: alignment
    'sbg:x': 2182.387451171875
    'sbg:y': 4215.09375
  - id: indel_realignment
    in:
      - id: window_size
        source: abra2_window_size
      - id: soft_clip_contig
        source: abra2_soft_clip_contig
      - id: scoring_gap_alignments
        source: abra2_scoring_gap_alignments
      - id: reference_fasta
        source: reference_sequence
      - id: no_sort
        source: abra2_no_sort
      - id: maximum_mixmatch_rate
        source: abra2_maximum_mixmatch_rate
      - id: maximum_average_depth
        source: abra2_maximum_average_depth
      - id: input_bam
        source:
          - gatk_merge_bam_alignment_4_1_8_0/gatk_merge_bam_alignment_bam
      - id: contig_anchor
        source: abra2_contig_anchor
      - id: consensus_sequence
        source: abra2_consensus_sequence
      - id: bam_index
        source: create_bam_index
      - id: option_bedgraph
        source: bedtools_genomecov_option_bedgraph
      - id: no_edge_complex_indel
        source: abra2_no_edge_complex_indel
      - id: distance_between_features
        source: bedtools_merge_distance_between_features
      - id: output_bams
        source:
          - abra2_output_bams
      - id: validation_stringency
        source: validation_stringency
      - id: sort_order
        source: sort_order
      - id: output_file_name
        source: picard_fixmate_information_output_file_name
      - id: create_bam_index
        source: create_bam_index
    out:
      - id: indel_realignment_bam
    run: subworkflows/indel_realignment/indel_realignment.cwl
    label: indel_realignment
    'sbg:x': 2182.387451171875
    'sbg:y': 1160
  - id: gatk_merge_bam_alignment_4_1_8_0
    in:
      - id: unmapped_bam
        source: >-
          fgbio_call_duplex_consensus_reads_1_2_0/fgbio_call_duplex_consensus_reads_bam
      - id: reference
        source: reference_sequence
      - id: output_file_name
        source: gatk_merge_bam_alignment_output_file_name
      - id: aligned_bam
        source:
          - alignment/picard_add_or_replace_read_groups_bam
        valueFrom: '${ return [ self ]; }'
      - id: sort_order
        source: sort_order
      - id: validation_stringency
        source: validation_stringency
      - id: create_index
        source: create_bam_index
    out:
      - id: gatk_merge_bam_alignment_bam
    run: >-
      command_line_tools/gatk_merge_bam_alignment_4.1.8.0/gatk_merge_bam_alignment_4.1.8.0.cwl
    label: GATK-MergeBamAlignment
    'sbg:x': 1624.7490234375
    'sbg:y': 1920.65625
  - id: fgbio_separate_bams
    in:
      - id: reference_fasta
        source: reference_sequence
      - id: input
        source: indel_realignment/indel_realignment_bam
      - id: reverse_per_base_tags_simplex_duplex
        source: fgbio_filter_consensus_read_reverse_per_base_tags_simplex_duplex
      - id: require_single_strand_agreement_simplex_duplex
        source: >-
          fgbio_filter_consensus_read_require_single_strand_agreement_simplex_duplex
      - id: output_file_name_simplex_duplex
        source: fgbio_filter_consensus_read_output_file_name_simplex_duplex
      - id: min_reads_simplex_duplex
        source:
          - fgbio_filter_consensus_read_min_reads_simplex_duplex
      - id: min_mean_base_quality_simplex_duplex
        source: fgbio_filter_consensus_read_min_mean_base_quality_simplex_duplex
      - id: max_base_error_rate_simplex_duplex
        source:
          - fgbio_filter_consensus_read_max_base_error_rate_simplex_duplex
      - id: max_no_call_fraction_simplex_duplex
        source: fgbio_filter_consensus_read_max_no_call_fraction_simplex_duplex
      - id: min_base_quality_simplex_duplex
        source: fgbio_filter_consensus_read_min_base_quality_simplex_duplex
      - id: max_read_error_rate_simplex_duplex
        source:
          - fgbio_filter_consensus_read_max_read_error_rate_simplex_duplex
      - id: reverse_per_base_tags_duplex
        source: fgbio_filter_consensus_read_reverse_per_base_tags_duplex
      - id: require_single_strand_agreement_duplex
        source: fgbio_filter_consensus_read_require_single_strand_agreement_duplex
      - id: output_file_name_duplex
        source: fgbio_filter_consensus_read_output_file_name_duplex
      - id: min_reads_duplex
        source:
          - fgbio_filter_consensus_read_min_reads_duplex
      - id: min_mean_base_quality_duplex
        source: fgbio_filter_consensus_read_min_mean_base_quality_duplex
      - id: min_base_quality_duplex
        source: fgbio_filter_consensus_read_min_base_quality_duplex
      - id: max_read_error_rate_duplex
        source:
          - fgbio_filter_consensus_read_max_read_error_rate_duplex
      - id: max_no_call_fraction_duplex
        source: fgbio_filter_consensus_read_max_no_call_fraction_duplex
      - id: max_base_error_rate_duplex
        source:
          - fgbio_filter_consensus_read_max_base_error_rate_duplex
      - id: validation_stringency
        source: validation_stringency
      - id: output_file_name_duplex_aln_metrics
        source: fgbio_filter_consensus_read_output_file_name_duplex_aln_metrics
      - id: create_index
        source: create_bam_index
      - id: output_file_name_simplex_aln_metrics
        source: fgbio_filter_consensus_read_output_file_name_simplex_aln_metrics
      - id: output_file_name_simpex
        source: fgbio_postprocessing_output_file_name_simpex
      - id: min_simplex_reads
        source: fgbio_filter_consensus_read_min_simplex_reads
    out:
      - id: fgbio_filter_consensus_reads_duplex_bam
      - id: fgbio_postprocessing_simplex_bam
      - id: gatk_collect_alignment_summary_metrics_txt_simplex
      - id: gatk_collect_alignment_summary_metrics_txt_duplex
      - id: fgbio_filter_consensus_reads_simplex_duplex_bam
    run: subworkflows/fgbio_separate_bams/fgbio_separate_bams.cwl
    label: fgbio_separate_bams
    'sbg:x': 2971.67236328125
    'sbg:y': 2652.546875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
$schemas:
  - 'http://schema.org/version/9.0/schemaorg-current-http.rdf'
's:author':
  - class: 's:Person'
    's:email': 'mailto:shahr2@mskcc.org'
    's:identifier': ''
    's:name': Ronak Shah
's:citation': ''
's:codeRepository': 'https://github.com/msk-access/standard_bam_processing'
's:contributor':
  - class: 's:Person'
    's:email': 'mailto:shahr2@mskcc.org'
    's:identifier': 'https://orcid.org/0000-0001-9042-6213'
    's:name': Ronak Shah
's:dateCreated': '2020-09-25'
's:license': 'https://spdx.org/licenses/Apache-2.0'
