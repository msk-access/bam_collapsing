class: Workflow
cwlVersion: v1.0
id: bam_collapsing
label: bam_collapsing
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference_fasta
    type: File
    doc: >-
      The reference sequence in a single reference sequence in FASTA format,
      with all contigs in the same file, validated according to the FASTA
      standard. It has multiple secondary file associated with it ending in
      ".dict, .fai, .amb, .ann, .bwt, .pac, .index, .rbwt, .rpac, .rsa, .sa"
    secondaryFiles:
      - .fai
      - ^.dict
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
    'sbg:x': 0
    'sbg:y': 640.59375
  - id: bed_file
    type: File
    doc: >-
      Targets in BED file format used by Waltz to generate the PileUp for
      collapsing of the BAM file. The genotype from positions in this bed file
      will be used as the consensus base if min_consensus_percent threshold is
      not reached. Otherwise, the reference base from the supplied
      reference_fasta will be used
    'sbg:x': 0
    'sbg:y': 3096.203125
  - id: bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 3202.96875
  - id: min_map_quality
    type: int
    doc: Make sure to use high quality reads.
    'sbg:x': 0
    'sbg:y': 2135.3125
  - id: min_base_quality
    type: int
    doc: Minimum Base Quality score to be used during collapsing.
    'sbg:x': 0
    'sbg:y': 2348.84375
  - id: mismatches
    type: int
    doc: Allowable mismatch count in UMI bases for grouping UMI families
    'sbg:x': 0
    'sbg:y': 2028.546875
  - id: min_consensus_percent
    type: int
    doc: >-
      Percentage of bases that must be in agreement at each position in the
      consensus read before masking that base as "N
    'sbg:x': 0
    'sbg:y': 2242.078125
  - id: key
    type:
      type: array
      items: string
      inputBinding:
        prefix: '-k'
    'sbg:x': 686.4918212890625
    'sbg:y': 1813.25
  - id: sort_first_pass_output_file_name
    type: string
    doc: Output File Name for Marianas First Pass process.
    'sbg:x': 0
    'sbg:y': 427.0625
  - id: output_name_collapsed_gzip_R1
    type: string?
    doc: Name of the output file for READ1 collapsed FASTQ file
    'sbg:x': 0
    'sbg:y': 1708.25
  - id: output_name_collapsed_gzip_R2
    type: string?
    doc: Name of the output file for READ2 collapsed FASTQ file
    'sbg:x': 0
    'sbg:y': 1601.484375
  - id: read_group_sequencing_platform
    type: string
    doc: BAM Tag describing the Platform used to generate the sequencing data.
    'sbg:x': 0
    'sbg:y': 747.359375
  - id: read_group_sample_name
    type: string
    doc: >-
      SM = Sample

      The name of the sample sequenced in this read group. GATK tools treat all
      read groups with the same SM value as containing sequencing data for the
      same sample, and this is also the name that will be used for the sample
      column in the VCF file. Therefore it's critical that the SM field be
      specified correctly. When sequencing pools of samples, use a pool name
      instead of an individual sample name. Note, when we say pools, we mean
      samples that are not individually barcoded. In the case of multiplexing
      (often confused with pooling) where you know which reads come from each
      sample and you have simply run the samples together in one lane, you can
      keep the SM tag as the sample name and not the "pooled name".
    'sbg:x': 0
    'sbg:y': 960.890625
  - id: read_group_platform_unit
    type: string
    doc: >-
      PU = Platform Unit

      The PU holds three types of information, the
      {FLOWCELL_BARCODE}.{LANE}.{SAMPLE_BARCODE}. The {FLOWCELL_BARCODE} refers
      to the unique identifier for a particular flow cell. The {LANE} indicates
      the lane of the flow cell and the {SAMPLE_BARCODE} is a
      sample/library-specific identifier. Although the PU is not required by
      GATK but takes precedence over ID for base recalibration if it is present.
      In the example shown earlier, two read group fields, ID and PU,
      appropriately differentiate flow cell lane, marked by .2, a factor that
      contributes to batch effects.
    'sbg:x': 0
    'sbg:y': 1067.65625
  - id: read_group_library
    type: string
    doc: >-
      LB = DNA preparation library identifier

      MarkDuplicates uses the LB field to determine which read groups might
      contain molecular duplicates, in case the same DNA library was sequenced
      on multiple lanes.
    'sbg:x': 0
    'sbg:y': 1174.421875
  - id: read_group_identifier
    type: string
    doc: >-
      ID = Read group identifier

      This tag identifies which read group each read belongs to, so each read
      group's ID must be unique. It is referenced both in the read group
      definition line in the file header (starting with @RG) and in the RG:Z tag
      for each read record.
    'sbg:x': 0
    'sbg:y': 1281.1875
  - id: picard_output_file_name
    type: string?
    doc: Output BAM file name for picard AddOrReplaceReadGroups
    'sbg:x': 0
    'sbg:y': 1387.953125
  - id: aln_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 3309.734375
  - id: sort_order
    type: string?
    doc: Picard Sort Order of the Input BAM file
    'sbg:x': 0
    'sbg:y': 320.296875
  - id: create_bam_index
    type: boolean?
    doc: Make Index (bai) file corresponding to the BAM file.
    'sbg:x': 0
    'sbg:y': 2775.90625
  - id: P
    type: boolean?
    doc: skip pairing; mate rescue performed unless -S also in use
    'sbg:x': 0
    'sbg:y': 1494.71875
  - id: window_size
    type: string?
    'sbg:x': 0
    'sbg:y': 106.765625
  - id: scoring_gap_alignments
    type: string?
    'sbg:x': 0
    'sbg:y': 533.828125
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1815.015625
  - id: no_sort
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1921.78125
  - id: maximum_average_depth
    type: int?
    'sbg:x': 0
    'sbg:y': 2562.375
  - id: maximum_mixmatch_rate
    type: float?
    'sbg:x': 0
    'sbg:y': 2455.609375
  - id: ignore_bad_assembly
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2669.140625
  - id: contig_anchor
    type: string?
    'sbg:x': 0
    'sbg:y': 2882.671875
  - id: consensus_sequence
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2989.4375
  - id: abra_collapsing_number_of_threads
    type: int?
    'sbg:x': 1386.5762939453125
    'sbg:y': 1906.015625
  - id: wobble
    type: int
    'sbg:x': 0
    'sbg:y': 0
  - id: temporary_directory
    type: Directory?
    'sbg:x': 0
    'sbg:y': 213.53125
  - id: read_group_sequencing_center
    type: string
    'sbg:x': 0
    'sbg:y': 854.125
outputs:
  - id: second_pass_insertions
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_insertions
    type: File
    'sbg:x': 1141.2637939453125
    'sbg:y': 1267.1875
  - id: second_pass_alt_alleles
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_alt_alleles
    type: File
    'sbg:x': 1141.2637939453125
    'sbg:y': 1373.953125
  - id: collapsed_fastq_2
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_2
    type: File
    'sbg:x': 1141.2637939453125
    'sbg:y': 1935.78125
  - id: collapsed_fastq_1
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_1
    type: File
    'sbg:x': 1141.2637939453125
    'sbg:y': 2042.546875
  - id: pileup_without_duplicates
    outputSource:
      - waltz_pileupmetrics/pileup_without_duplicates
    type: File
    'sbg:x': 686.4918212890625
    'sbg:y': 1282.953125
  - id: intervals_without_duplicates
    outputSource:
      - waltz_pileupmetrics/intervals_without_duplicates
    type: File
    'sbg:x': 686.4918212890625
    'sbg:y': 1920.015625
  - id: intervals
    outputSource:
      - waltz_pileupmetrics/intervals
    type: File
    'sbg:x': 686.4918212890625
    'sbg:y': 2026.78125
  - id: unfiltered-bam
    outputSource:
      - abra_fx/abra_fx_bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2415.73974609375
    'sbg:y': 1320.5703125
  - id: output_file
    outputSource:
      - abra_fx/output_file
    type: File?
    label: indel_realign_targets
    'sbg:x': 2415.73974609375
    'sbg:y': 1775.6328125
  - id: first_pass_insertions
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_insertions
    type: File
    'sbg:x': 1141.2637939453125
    'sbg:y': 1829.015625
  - id: alt_allele_file
    outputSource:
      - marianas_collapsing_first_pass_cwl/alt_allele_file
    type: File
    'sbg:x': 1141.2637939453125
    'sbg:y': 2149.3125
  - id: first_pass_output_dir
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_output_dir
    type: Directory
    'sbg:x': 1141.2637939453125
    'sbg:y': 1722.25
  - id: gzip_read1
    outputSource:
      - gzip_Read1/output_file
    type: File
    'sbg:x': 1386.5762939453125
    'sbg:y': 1510.484375
  - id: gzip_read2
    outputSource:
      - gzip_Read2/output_file
    type: File
    'sbg:x': 1386.5762939453125
    'sbg:y': 1403.71875
  - id: simplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/simplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2415.73974609375
    'sbg:y': 1427.3359375
  - id: duplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/duplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2415.73974609375
    'sbg:y': 1882.3984375
  - id: alignment_metrics_unfiltered
    outputSource:
      - picard_collect_alignment_summary_metrics_unfiltered/alignment_metrics
    type: File
    'sbg:x': 2415.73974609375
    'sbg:y': 1989.1640625
  - id: alignment_metrics_simplex
    outputSource:
      - picard_collect_alignment_summary_metrics_simplex/alignment_metrics
    type: File
    'sbg:x': 2721.7353515625
    'sbg:y': 1601.484375
  - id: alignment_metrics_duplex
    outputSource:
      - picard_collect_alignment_summary_metrics_duplex/alignment_metrics
    type: File
    'sbg:x': 2721.7353515625
    'sbg:y': 1708.25
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
    label: Generate Pileup
    'sbg:x': 319.171875
    'sbg:y': 1633.8671875
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
    label: Marianas First Pass
    'sbg:x': 686.4918212890625
    'sbg:y': 1657.484375
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
    label: Sort First Pass Output
    'sbg:x': 1141.2637939453125
    'sbg:y': 1146.421875
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
    label: Marianas Second Pass
    'sbg:x': 686.4918212890625
    'sbg:y': 1445.71875
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
    'sbg:x': 1141.2637939453125
    'sbg:y': 1608.484375
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
    'sbg:x': 1141.2637939453125
    'sbg:y': 1487.71875
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
      - id: read_group_identifier
        source: read_group_identifier
      - id: sort_order
        default: coordinate
        source: sort_order
      - id: create_bam_index
        default: true
        source: create_bam_index
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
      - id: read_group_sequencing_center
        source: read_group_sequencing_center
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: bam
    run: subworkflows/alignment.cwl
    label: Align Collapsed Fastq and Generate BAM file
    'sbg:x': 1386.5762939453125
    'sbg:y': 1708.25
  - id: abra_fx
    in:
      - id: input_bam
        source:
          - alignment/bam
      - id: reference_fasta
        source: reference_fasta
      - id: bam_index
        default: true
        source: create_bam_index
      - id: option_bedgraph
        default: true
        source: option_bedgraph
      - id: window_size
        source: window_size
      - id: scoring_gap_alignments
        source: scoring_gap_alignments
      - id: no_sort
        source: no_sort
      - id: maximum_mixmatch_rate
        source: maximum_mixmatch_rate
      - id: maximum_average_depth
        source: maximum_average_depth
      - id: ignore_bad_assembly
        source: ignore_bad_assembly
      - id: contig_anchor
        source: contig_anchor
      - id: consensus_sequence
        source: consensus_sequence
      - id: number_of_threads
        source: abra_collapsing_number_of_threads
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: abra_fx_bam
      - id: output_file
    run: subworkflows/abra_fx.cwl
    label: abra_fx.cwl
    'sbg:x': 1874.3602294921875
    'sbg:y': 1768.6328125
  - id: marianas_separate_bams_1_8_1
    in:
      - id: input_bam
        source: alignment/bam
    out:
      - id: duplex-bam
      - id: simplex-bam
    run: >-
      command_line_tools/marianas_separate_bams_1.8.1/marianas_separate_bams_1.8.1.cwl
    label: Marianas Seprate BAM into Simplex and Duplex
    'sbg:x': 1874.3602294921875
    'sbg:y': 1563.8671875
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
    label: alignment_summary_metrics_unflitered
    'sbg:x': 1874.3602294921875
    'sbg:y': 1443.1015625
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
    label: alignment_summary_metrics_duplex
    'sbg:x': 2415.73974609375
    'sbg:y': 1661.8671875
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
    label: alignment_summary_metrics_simplex
    'sbg:x': 2415.73974609375
    'sbg:y': 1541.1015625
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
