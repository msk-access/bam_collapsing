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
    'sbg:y': 640.21875
  - id: bed_file
    type: File
    doc: >-
      Targets in BED file format used by Waltz to generate the PileUp for
      collapsing of the BAM file. The genotype from positions in this bed file
      will be used as the consensus base if min_consensus_percent threshold is
      not reached. Otherwise, the reference base from the supplied
      reference_fasta will be used
    'sbg:x': 0
    'sbg:y': 3094.6875
  - id: bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 3201.375
  - id: min_map_quality
    type: int
    doc: Make sure to use high quality reads.
    'sbg:x': 0
    'sbg:y': 2134.2890625
  - id: min_base_quality
    type: int
    doc: Minimum Base Quality score to be used during collapsing.
    'sbg:x': 0
    'sbg:y': 2347.7109375
  - id: mismatches
    type: int
    doc: Allowable mismatch count in UMI bases for grouping UMI families
    'sbg:x': 0
    'sbg:y': 2027.578125
  - id: min_consensus_percent
    type: int
    doc: >-
      Percentage of bases that must be in agreement at each position in the
      consensus read before masking that base as "N
    'sbg:x': 0
    'sbg:y': 2241
  - id: key
    type:
      type: array
      items: string
      inputBinding:
        prefix: '-k'
    'sbg:x': 686.4918212890625
    'sbg:y': 1812.375
  - id: sort_first_pass_output_file_name
    type: string
    doc: Output File Name for Marianas First Pass process.
    'sbg:x': 0
    'sbg:y': 426.796875
  - id: output_name_collapsed_gzip_R1
    type: string?
    doc: Name of the output file for READ1 collapsed FASTQ file
    'sbg:x': 0
    'sbg:y': 1707.4453125
  - id: output_name_collapsed_gzip_R2
    type: string?
    doc: Name of the output file for READ2 collapsed FASTQ file
    'sbg:x': 0
    'sbg:y': 1600.7109375
  - id: read_group_sequencing_platform
    type: string
    doc: BAM Tag describing the Platform used to generate the sequencing data.
    'sbg:x': 0
    'sbg:y': 746.9296875
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
    'sbg:y': 960.3984375
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
    'sbg:y': 1067.1328125
  - id: read_group_library
    type: string
    doc: >-
      LB = DNA preparation library identifier

      MarkDuplicates uses the LB field to determine which read groups might
      contain molecular duplicates, in case the same DNA library was sequenced
      on multiple lanes.
    'sbg:x': 0
    'sbg:y': 1173.8671875
  - id: read_group_identifier
    type: string
    doc: >-
      ID = Read group identifier

      This tag identifies which read group each read belongs to, so each read
      group's ID must be unique. It is referenced both in the read group
      definition line in the file header (starting with @RG) and in the RG:Z tag
      for each read record.
    'sbg:x': 0
    'sbg:y': 1280.6015625
  - id: picard_output_file_name
    type: string?
    doc: Output BAM file name for picard AddOrReplaceReadGroups
    'sbg:x': 0
    'sbg:y': 1387.3125
  - id: aln_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 3308.0625
  - id: sort_order
    type: string?
    doc: Picard Sort Order of the Input BAM file
    'sbg:x': 0
    'sbg:y': 320.109375
  - id: create_bam_index
    type: boolean?
    doc: Make Index (bai) file corresponding to the BAM file.
    'sbg:x': 0
    'sbg:y': 2774.578125
  - id: P
    type: boolean?
    doc: skip pairing; mate rescue performed unless -S also in use
    'sbg:x': 0
    'sbg:y': 1494
  - id: window_size
    type: string?
    'sbg:x': 0
    'sbg:y': 106.6875
  - id: scoring_gap_alignments
    type: string?
    'sbg:x': 0
    'sbg:y': 533.5078125
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1814.1796875
  - id: no_sort
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1920.890625
  - id: maximum_average_depth
    type: int?
    'sbg:x': 0
    'sbg:y': 2561.1328125
  - id: maximum_mixmatch_rate
    type: float?
    'sbg:x': 0
    'sbg:y': 2454.421875
  - id: ignore_bad_assembly
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2667.8671875
  - id: contig_anchor
    type: string?
    'sbg:x': 0
    'sbg:y': 2881.2890625
  - id: consensus_sequence
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2988
  - id: abra_collapsing_number_of_threads
    type: int?
    'sbg:x': 1386.576171875
    'sbg:y': 1905.109375
  - id: wobble
    type: int
    'sbg:x': 0
    'sbg:y': 0
  - id: temporary_directory
    type: string?
    'sbg:x': 0
    'sbg:y': 213.3984375
  - id: read_group_sequencing_center
    type: string
    'sbg:x': 0
    'sbg:y': 853.6640625
  - id: K
    type: int?
    doc: BWA - Seed to ensure deterministic alignment results
    'sbg:x': 1374.2166748046875
    'sbg:y': 2373.26123046875
  - id: 'Y'
    type: boolean?
    doc: >-
      BWA - Force soft-clipping rather than default hard-clipping of
      supplementary alignments
    'sbg:x': 1573.8609619140625
    'sbg:y': 1886.9481201171875
  - id: T
    type: int?
    doc: >-
      BWA - Don’t output alignment with score lower than INT. This option only
      affects output.
    'sbg:x': 1176.7662353515625
    'sbg:y': 2453.7021484375
  - id: t
    type: int?
    doc: BWA - Number of threads
    'sbg:x': 1143.8577880859375
    'sbg:y': 2286.23486328125
outputs:
  - id: second_pass_insertions
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_insertions
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 1266.578125
  - id: second_pass_alt_alleles
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_alt_alleles
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 1373.265625
  - id: collapsed_fastq_2
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_2
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 1934.796875
  - id: collapsed_fastq_1
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_1
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 2041.484375
  - id: pileup_without_duplicates
    outputSource:
      - waltz_pileupmetrics/pileup_without_duplicates
    type: File
    'sbg:x': 686.4918212890625
    'sbg:y': 1282.2890625
  - id: intervals_without_duplicates
    outputSource:
      - waltz_pileupmetrics/intervals_without_duplicates
    type: File
    'sbg:x': 686.4918212890625
    'sbg:y': 1919.0859375
  - id: intervals
    outputSource:
      - waltz_pileupmetrics/intervals
    type: File
    'sbg:x': 686.4918212890625
    'sbg:y': 2025.7734375
  - id: first_pass_insertions
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_insertions
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 1828.109375
  - id: alt_allele_file
    outputSource:
      - marianas_collapsing_first_pass_cwl/alt_allele_file
    type: File
    'sbg:x': 1141.263671875
    'sbg:y': 2148.171875
  - id: first_pass_output_dir
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_output_dir
    type: Directory
    'sbg:x': 1141.263671875
    'sbg:y': 1721.421875
  - id: gzip_read1
    outputSource:
      - gzip_Read1/output_file
    type: File
    'sbg:x': 1386.576171875
    'sbg:y': 1509.640625
  - id: gzip_read2
    outputSource:
      - gzip_Read2/output_file
    type: File
    'sbg:x': 1386.576171875
    'sbg:y': 1402.90625
  - id: simplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/simplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2721
    'sbg:y': 2010.927734375
  - id: duplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/duplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2726.75341796875
    'sbg:y': 1848.7940673828125
  - id: alignment_metrics_unfiltered
    outputSource:
      - picard_collect_alignment_summary_metrics_unfiltered/alignment_metrics
    type: File
    'sbg:x': 2707.575439453125
    'sbg:y': 1192.51123046875
  - id: alignment_metrics_simplex
    outputSource:
      - picard_collect_alignment_summary_metrics_simplex/alignment_metrics
    type: File
    'sbg:x': 3027.73046875
    'sbg:y': 1600.640625
  - id: alignment_metrics_duplex
    outputSource:
      - picard_collect_alignment_summary_metrics_duplex/alignment_metrics
    type: File
    'sbg:x': 3027
    'sbg:y': 1728.095703125
  - id: bam_1
    outputSource:
      - abra_fx/bam
    type: File
    'sbg:x': 2394.84912109375
    'sbg:y': 1399.972900390625
  - id: output_file
    outputSource:
      - abra_fx/output_file
    type: File?
    'sbg:x': 2319.140625
    'sbg:y': 1698.27294921875
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
    'sbg:y': 1633.03125
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
    'sbg:y': 1656.6640625
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
    'sbg:x': 1141.263671875
    'sbg:y': 1145.890625
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
    'sbg:y': 1444.9765625
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
    'sbg:x': 1141.263671875
    'sbg:y': 1607.7109375
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
    'sbg:x': 1141.263671875
    'sbg:y': 1486.9765625
  - id: alignment
    in:
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
      - id: read_group_sequencing_center
        source: read_group_sequencing_center
      - id: temporary_directory
        source: temporary_directory
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
      - id: output
        source: aln_output_file_name
      - id: K
        source: K
      - id: 'Y'
        source: 'Y'
      - id: T
        source: T
      - id: t
        source: t
    out:
      - id: bam
    run: subworkflows/alignment.cwl
    label: Align Collapsed Fastq and Generate BAM file
    'sbg:x': 1656.353271484375
    'sbg:y': 2099.742919921875
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
    out:
      - id: output_file
      - id: bam
    run: subworkflows/abra_fx.cwl
    label: abra_fx.cwl
    'sbg:x': 1891.3612060546875
    'sbg:y': 1746.8502197265625
  - id: marianas_separate_bams_1_8_1
    in:
      - id: input_bam
        source: abra_fx/bam
    out:
      - id: duplex-bam
      - id: simplex-bam
    run: >-
      command_line_tools/marianas_separate_bams_1.8.1/marianas_separate_bams_1.8.1.cwl
    label: Marianas Seprate BAM into Simplex and Duplex
    'sbg:x': 2415.73974609375
    'sbg:y': 1821.109375
  - id: picard_collect_alignment_summary_metrics_unfiltered
    in:
      - id: input
        source: abra_fx/bam
      - id: reference_sequence
        source: reference_fasta
    out:
      - id: alignment_metrics
    run: >-
      command_line_tools/picard_collect_alignment_summary_metrics_2.8.1/picard_collect_alignment_summary_metrics_2.8.1.cwl
    label: alignment_summary_metrics_unflitered
    'sbg:x': 2378.4658203125
    'sbg:y': 1253.231689453125
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
    'sbg:x': 2721
    'sbg:y': 1682.095703125
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
    'sbg:x': 2721.735107421875
    'sbg:y': 1540.296875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
