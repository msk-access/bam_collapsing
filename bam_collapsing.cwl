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
    'sbg:y': 534.375
  - id: bed_file
    type: File
    doc: >-
      Targets in BED file format used by Waltz to generate the PileUp for
      collapsing of the BAM file. The genotype from positions in this bed file
      will be used as the consensus base if min_consensus_percent threshold is
      not reached. Otherwise, the reference base from the supplied
      reference_fasta will be used
    'sbg:x': 0
    'sbg:y': 2992.5
  - id: bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 3099.375
  - id: min_map_quality
    type: int
    doc: Make sure to use high quality reads.
    'sbg:x': 0
    'sbg:y': 2030.625
  - id: min_base_quality
    type: int
    doc: Minimum Base Quality score to be used during collapsing.
    'sbg:x': 0
    'sbg:y': 2244.375
  - id: mismatches
    type: int
    doc: Allowable mismatch count in UMI bases for grouping UMI families
    'sbg:x': 0
    'sbg:y': 1923.75
  - id: min_consensus_percent
    type: int
    doc: >-
      Percentage of bases that must be in agreement at each position in the
      consensus read before masking that base as "N
    'sbg:x': 0
    'sbg:y': 2137.5
  - id: key
    type:
      type: array
      items: string
      inputBinding:
        prefix: '-k'
    'sbg:x': 686.4761962890625
    'sbg:y': 1652.1875
  - id: sort_first_pass_output_file_name
    type: string
    doc: Output File Name for Marianas First Pass process.
    'sbg:x': 0
    'sbg:y': 320.625
  - id: output_name_collapsed_gzip_R1
    type: string?
    doc: Name of the output file for READ1 collapsed FASTQ file
    'sbg:x': 0
    'sbg:y': 1603.125
  - id: output_name_collapsed_gzip_R2
    type: string?
    doc: Name of the output file for READ2 collapsed FASTQ file
    'sbg:x': 0
    'sbg:y': 1496.25
  - id: read_group_sequnecing_center
    type: string
    doc: RGCN tag for BAM file indicating where the data is sequenced.
    'sbg:x': 0
    'sbg:y': 641.25
  - id: read_group_sequencing_platform
    type: string
    doc: BAM Tag describing the Platform used to generate the sequencing data.
    'sbg:x': 0
    'sbg:y': 748.125
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
    'sbg:y': 855
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
    'sbg:y': 961.875
  - id: read_group_library
    type: int
    doc: >-
      LB = DNA preparation library identifier

      MarkDuplicates uses the LB field to determine which read groups might
      contain molecular duplicates, in case the same DNA library was sequenced
      on multiple lanes.
    'sbg:x': 0
    'sbg:y': 1068.75
  - id: read_group_identifier
    type: string
    doc: >-
      ID = Read group identifier

      This tag identifies which read group each read belongs to, so each read
      group's ID must be unique. It is referenced both in the read group
      definition line in the file header (starting with @RG) and in the RG:Z tag
      for each read record.
    'sbg:x': 0
    'sbg:y': 1175.625
  - id: picard_output_file_name
    type: string?
    doc: Output BAM file name for picard AddOrReplaceReadGroups
    'sbg:x': 0
    'sbg:y': 1282.5
  - id: aln_output_file_name
    type: string?
    'sbg:x': 0
    'sbg:y': 3206.25
  - id: sort_order
    type: string?
    doc: Picard Sort Order of the Input BAM file
    'sbg:x': 0
    'sbg:y': 213.75
  - id: create_bam_index
    type: boolean?
    doc: Make Index (bai) file corresponding to the BAM file.
    'sbg:x': 0
    'sbg:y': 2671.875
  - id: P
    type: boolean?
    doc: skip pairing; mate rescue performed unless -S also in use
    'sbg:x': 0
    'sbg:y': 1389.375
  - id: window_size
    type: string?
    'sbg:x': 0
    'sbg:y': 106.875
  - id: scoring_gap_alignments
    type: string?
    'sbg:x': 0
    'sbg:y': 427.5
  - id: option_bedgraph
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1710
  - id: no_sort
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1816.875
  - id: maximum_average_depth
    type: int?
    'sbg:x': 0
    'sbg:y': 2458.125
  - id: maximum_mixmatch_rate
    type: float?
    'sbg:x': 0
    'sbg:y': 2351.25
  - id: ignore_bad_assembly
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2565
  - id: contig_anchor
    type: string?
    'sbg:x': 0
    'sbg:y': 2778.75
  - id: consensus_sequence
    type: boolean?
    'sbg:x': 0
    'sbg:y': 2885.625
  - id: abra_collapsing_number_of_threads
    type: int?
    'sbg:x': 1804.53515625
    'sbg:y': 1847.4375
  - id: wobble
    type: int
    'sbg:x': 0
    'sbg:y': 0
outputs:
  - id: second_pass_insertions
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_insertions
    type: File
    'sbg:x': 1559.23828125
    'sbg:y': 1321.9375
  - id: second_pass_alt_alleles
    outputSource:
      - marianas_collapsing_second_pass_cwl/second_pass_alt_alleles
    type: File
    'sbg:x': 1559.23828125
    'sbg:y': 1428.8125
  - id: collapsed_fastq_2
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_2
    type: File
    'sbg:x': 1559.23828125
    'sbg:y': 1777.4375
  - id: collapsed_fastq_1
    outputSource:
      - marianas_collapsing_second_pass_cwl/collapsed_fastq_1
    type: File
    'sbg:x': 1559.23828125
    'sbg:y': 1884.3125
  - id: pileup_without_duplicates
    outputSource:
      - waltz_pileupmetrics/pileup_without_duplicates
    type: File
    'sbg:x': 686.4761962890625
    'sbg:y': 1340.3125
  - id: intervals_without_duplicates
    outputSource:
      - waltz_pileupmetrics/intervals_without_duplicates
    type: File
    'sbg:x': 686.4761962890625
    'sbg:y': 1759.0625
  - id: intervals
    outputSource:
      - waltz_pileupmetrics/intervals
    type: File
    'sbg:x': 686.4761962890625
    'sbg:y': 1865.9375
  - id: unfiltered-bam
    outputSource:
      - abra_fx_cwl/abra_fx_bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2751.59228515625
    'sbg:y': 1268.5
  - id: output_file
    outputSource:
      - abra_fx_cwl/output_file
    type: File?
    label: indel_realign_targets
    'sbg:x': 2751.59228515625
    'sbg:y': 1724
  - id: first_pass_insertions
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_insertions
    type: File
    'sbg:x': 1104.46630859375
    'sbg:y': 1766.0625
  - id: alt_allele_file
    outputSource:
      - marianas_collapsing_first_pass_cwl/alt_allele_file
    type: File
    'sbg:x': 1104.46630859375
    'sbg:y': 1872.9375
  - id: first_pass_output_dir
    outputSource:
      - marianas_collapsing_first_pass_cwl/first_pass_output_dir
    type: Directory
    'sbg:x': 1104.46630859375
    'sbg:y': 1659.1875
  - id: gzip_read1
    outputSource:
      - gzip_Read1/output_file
    type: File
    'sbg:x': 1804.53515625
    'sbg:y': 1465.6875
  - id: gzip_read2
    outputSource:
      - gzip_Read2/output_file
    type: File
    'sbg:x': 1804.53515625
    'sbg:y': 1358.8125
  - id: simplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/simplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2751.59228515625
    'sbg:y': 1375.375
  - id: duplex-bam
    outputSource:
      - marianas_separate_bams_1_8_1/duplex-bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 2751.59228515625
    'sbg:y': 1830.875
  - id: alignment_metrics_unfiltered
    outputSource:
      - picard_collect_alignment_summary_metrics_unfiltered/alignment_metrics
    type: File
    'sbg:x': 2751.59228515625
    'sbg:y': 1937.75
  - id: alignment_metrics_simplex
    outputSource:
      - picard_collect_alignment_summary_metrics_simplex/alignment_metrics
    type: File
    'sbg:x': 3057.587646484375
    'sbg:y': 1549.6875
  - id: alignment_metrics_duplex
    outputSource:
      - picard_collect_alignment_summary_metrics_duplex/alignment_metrics
    type: File
    'sbg:x': 3057.587646484375
    'sbg:y': 1656.5625
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
    'sbg:x': 319.15625
    'sbg:y': 1582.125
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
    'sbg:x': 686.4761962890625
    'sbg:y': 1496.25
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
    'sbg:x': 1104.46630859375
    'sbg:y': 1319.3125
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
    'sbg:x': 1104.46630859375
    'sbg:y': 1496.25
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
    'sbg:x': 1559.23828125
    'sbg:y': 1663.5625
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
    'sbg:x': 1559.23828125
    'sbg:y': 1542.6875
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
    label: Align Collapsed Fastq and Generate BAM file
    'sbg:x': 1804.53515625
    'sbg:y': 1656.5625
  - id: abra_fx_cwl
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
      - id: abra_fx_bam
      - id: output_file
    run: subworkflows/abra_fx-cwl.cwl
    label: abra_fx.cwl
    'sbg:x': 2256.956787109375
    'sbg:y': 1717
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
    'sbg:x': 2256.956787109375
    'sbg:y': 1519.125
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
    'sbg:x': 2256.956787109375
    'sbg:y': 1398.25
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
    'sbg:x': 2751.59228515625
    'sbg:y': 1610.125
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
    'sbg:x': 2751.59228515625
    'sbg:y': 1489.25
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
