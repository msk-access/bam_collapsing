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
    doc: 'Fgbio GroupReadsByUmi: The input BAM file.'
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 2774.9375
  - id: fgbio_group_reads_by_umi_strategy
    type: string
    doc: >-
      Fgbio GroupReadsByUmi: The UMI assignment strategy.(identity, edit,
      adjacency, paired)
    'sbg:x': 0
    'sbg:y': 2348
  - id: fgbio_group_reads_by_umi_raw_tag
    type: string?
    doc: 'Fgbio GroupReadsByUmi: The tag containing the raw UMI. (Default:RX)'
    'sbg:x': 0
    'sbg:y': 2454.734375
  - id: fgbio_group_reads_by_umi_output_file_name
    type: string?
    doc: 'Fgbio GroupReadsByUmi: The output BAM file name'
    'sbg:x': 0
    'sbg:y': 2561.46875
  - id: fgbio_group_reads_by_umi_min_umi_length
    type: int?
    doc: >-
      Fgbio GroupReadsByUmi: The minimum UMI length. If not specified then all
      UMIs must have the same length, otherwise discard reads with UMIs shorter
      than this length and allow for differing UMI lengths.
    'sbg:x': 0
    'sbg:y': 2668.203125
  - id: fgbio_group_reads_by_umi_include_non_pf_reads
    type: boolean?
    doc: 'Fgbio GroupReadsByUmi: Include non-PF reads.'
    'sbg:x': 0
    'sbg:y': 2881.671875
  - id: fgbio_group_reads_by_umi_family_size_histogram
    type: string
    doc: 'Fgbio GroupReadsByUmi: Optional output of tag family size counts.'
    'sbg:x': 0
    'sbg:y': 2988.40625
  - id: fgbio_group_reads_by_umi_edits
    type: int?
    doc: 'Fgbio GroupReadsByUmi:  The allowable number of edits between UMIs.'
    'sbg:x': 0
    'sbg:y': 3095.140625
  - id: fgbio_group_reads_by_umi_assign_tag
    type: string?
    doc: 'Fgbio GroupReadsByUmi: The output tag for UMI grouping. (Default:MI)'
    'sbg:x': 0
    'sbg:y': 3201.875
  - id: fgbio_collect_duplex_seq_metrics_intervals
    type: File?
    doc: >-
      Fgbio CollectDuplexSeqMetrics:  Optional set of intervals over which to
      restrict analysis.
    'sbg:x': 0
    'sbg:y': 3735.546875
  - id: fgbio_collect_duplex_seq_metrics_output_prefix
    type: string?
    doc: 'Fgbio CollectDuplexSeqMetrics: Prefix of output files to write.'
    'sbg:x': 0
    'sbg:y': 3308.609375
  - id: fgbio_collect_duplex_seq_metrics_min_ba_reads
    type: int?
    doc: >-
      Fgbio CollectDuplexSeqMetrics: Minimum BA reads to call a tag family a
      ‘duplex’.
    'sbg:x': 0
    'sbg:y': 3415.34375
  - id: fgbio_collect_duplex_seq_metrics_min_ab_reads
    type: int?
    doc: >-
      Fgbio CollectDuplexSeqMetrics: Minimum AB reads to call a tag family a
      ‘duplex’.
    'sbg:x': 0
    'sbg:y': 3522.078125
  - id: fgbio_collect_duplex_seq_metrics_mi_tag
    type: string?
    doc: >-
      Fgbio CollectDuplexSeqMetrics: The output tag for UMI grouping. (Default:
      MI)
    'sbg:x': 0
    'sbg:y': 3628.8125
  - id: fgbio_collect_duplex_seq_metrics_duplex_umi_counts
    type: boolean
    doc: >-
      Fgbio CollectDuplexSeqMetrics: If true, produce the .duplex_umi_counts.txt
      file with counts of duplex UMI observations.
    'sbg:x': 0
    'sbg:y': 3842.28125
  - id: fgbio_collect_duplex_seq_metrics_description
    type: string?
    doc: >-
      Fgbio CollectDuplexSeqMetrics:Description of data set used to label plots.
      Defaults to sample/library.
    'sbg:x': 0
    'sbg:y': 3949.015625
  - id: fgbio_call_duplex_consensus_reads_trim
    type: boolean?
    doc: >-
      Fgbio CallDuplexConsensusReads : If true, quality trim input reads in
      addition to masking low Q bases.
    'sbg:x': 0
    'sbg:y': 4055.75
  - id: fgbio_call_duplex_consensus_reads_sort_order
    type: string?
    doc: >-
      Fgbio CallDuplexConsensusReads: The sort order of the output, if :none:
      then the same as the input.
    'sbg:x': 0
    'sbg:y': 4162.484375
  - id: fgbio_call_duplex_consensus_reads_read_name_prefix
    type: string?
    doc: 'Fgbio CallDuplexConsensusReads: The prefix all consensus read names'
    'sbg:x': 0
    'sbg:y': 4269.21875
  - id: fgbio_call_duplex_consensus_reads_read_group_id
    type: string?
    doc: >-
      Fgbio CallDuplexConsensusReads: The new read group ID for all the
      consensus reads.
    'sbg:x': 0
    'sbg:y': 4375.953125
  - id: fgbio_call_duplex_consensus_reads_output_file_name
    type: string?
    doc: >-
      Fgbio CallDuplexConsensusReads: Output SAM or BAM file to write consensus
      reads.
    'sbg:x': 0
    'sbg:y': 4482.6875
  - id: fgbio_call_duplex_consensus_reads_min_reads
    type: 'int[]'
    doc: >-
      Fgbio CallDuplexConsensusReads: The minimum number of input reads to a
      consensus read.
    'sbg:x': 0
    'sbg:y': 4589.421875
  - id: fgbio_call_duplex_consensus_reads_min_input_base_quality
    type: int?
    doc: >-
      Fgbio CallDuplexConsensusReads: Ignore bases in raw reads that have Q
      below this value.
    'sbg:x': 0
    'sbg:y': 4696.15625
  - id: fgbio_call_duplex_consensus_reads_max_reads_per_strand
    type: int?
    doc: >-
      Fgbio CallDuplexConsensusReads: The maximum number of reads to use when
      building a single-strand consensus. If more than this many reads are
      present in a tag family, the family is randomly downsampled to exactly
      max-reads reads.
    'sbg:x': 0
    'sbg:y': 4802.890625
  - id: fgbio_call_duplex_consensus_reads_error_rate_pre_umi
    type: int?
    doc: >-
      Fgbio CallDuplexConsensusReads: The Phred-scaled error rate for an error
      prior to the UMIs being integrated.
    'sbg:x': 0
    'sbg:y': 4909.625
  - id: fgbio_call_duplex_consensus_reads_error_rate_post_umi
    type: int?
    doc: >-
      Fgbio CallDuplexConsensusReads: The Phred-scaled error rate for an error
      post the UMIs have been integrated.
    'sbg:x': 0
    'sbg:y': 5016.359375
  - id: reference_sequence
    type: File
    doc: >-
      Reference sequence file. Please include ".fai", "^.dict", ".amb" , ".sa",
      ".bwt", ".pac" as secondary files if they are not present in the same
      location as the ".fasta" file
    secondaryFiles:
      - .fai
      - ^.dict
      - .amb
      - .sa
      - .ann
      - .bwt
      - .pac
    'sbg:x': 0
    'sbg:y': 320.15625
  - id: validation_stringency
    type: string
    doc: >-
      GATK Validation stringency for all SAM files read by this program. Setting
      stringency to SILENT can improve performance when processing a BAM file in
      which variable-length data (read, qualities, tags) do not otherwise need
      to be decoded.
    'sbg:x': 0
    'sbg:y': 0
  - id: gatk_sam_to_fastq_output_name_unpaired
    type: string?
    doc: 'GATK SamToFastq: unpaired fastq output file name'
    'sbg:x': 0
    'sbg:y': 1600.859375
  - id: gatk_sam_to_fastq_output_name_R2
    type: string
    doc: 'GATK SamToFastq: R2 fastq.gz output file name'
    'sbg:x': 0
    'sbg:y': 1707.59375
  - id: gatk_sam_to_fastq_include_non_primary_alignments
    type: boolean?
    doc: >-
      GATK SamToFastq: If true, include non-primary alignments in the output.
      Support of non-primary alignments in SamToFastq is not comprehensive, so
      there may be exceptions if this is set to true and there are paired reads
      with non-primary alignments.
    'sbg:x': 0
    'sbg:y': 1921.0625
  - id: gatk_sam_to_fastq_include_non_pf_reads
    type: boolean?
    doc: >-
      GATK SamToFastq: Include non-PF reads from the SAM file into the output
      FASTQ files. PF means 'passes filtering'. Reads whose 'not passing quality
      controls' flag is set are non-PF reads. See GATK Dictionary for more info.
    'sbg:x': 0
    'sbg:y': 2027.796875
  - id: gatk_sam_to_fastq_output_name_R1
    type: string
    doc: 'GATK SamToFastq: R1 fastq.gz output file name'
    'sbg:x': 0
    'sbg:y': 1814.328125
  - id: bwa_mem_Y
    type: boolean?
    doc: >-
      bwa mem: to force soft-clipping rather than default hard-clipping of
      supplementary alignments
    'sbg:x': 0
    'sbg:y': 5229.78125
  - id: bwa_mem_T
    type: int?
    doc: >-
      bwa mem: Don’t output alignment with score lower than INT. This option
      only affects output.
    'sbg:x': 0
    'sbg:y': 5336.484375
  - id: sort_order
    type: string
    doc: The order in which the merged reads should be output.
    'sbg:x': 0
    'sbg:y': 213.453125
  - id: picard_addRG_read_group_sequencing_platform
    type: string
    doc: 'PicardAddOrReplaceReadGroups: Read-Group platform (e.g. ILLUMINA, SOLID)'
    'sbg:x': 0
    'sbg:y': 640.28125
  - id: picard_addRG_read_group_sequencing_center
    type: string
    doc: 'PicardAddOrReplaceReadGroups: Read-Group sequencing center name'
    'sbg:x': 0
    'sbg:y': 747.015625
  - id: picard_addRG_read_group_run_date
    type: string?
    doc: 'PicardAddOrReplaceReadGroups: Read-Group Run date'
    'sbg:x': 0
    'sbg:y': 960.484375
  - id: picard_addRG_read_group_platform_unit
    type: string
    doc: 'PicardAddOrReplaceReadGroups: Read-Group Platform Unit (eg. run barcode)'
    'sbg:x': 0
    'sbg:y': 1067.21875
  - id: picard_addRG_read_group_library
    type: string
    doc: 'PicardAddOrReplaceReadGroups: Read-Group library'
    'sbg:x': 0
    'sbg:y': 1173.953125
  - id: picard_addRG_read_group_identifier
    type: string
    doc: 'PicardAddOrReplaceReadGroups: Read-Group ID'
    'sbg:x': 0
    'sbg:y': 1280.6875
  - id: picard_addRG_read_group_description
    type: string?
    doc: 'PicardAddOrReplaceReadGroups: Read-Group Description'
    'sbg:x': 0
    'sbg:y': 1387.421875
  - id: picard_addRG_output_file_name
    type: string?
    doc: PicardAddOrReplaceReadGroups output file name
    'sbg:x': 0
    'sbg:y': 1494.140625
  - id: bwa_mem_P
    type: boolean?
    doc: >-
      bwa mem : In the paired-end mode, perform SW to rescue missing hits only
      but do not try to find hits that fit a proper pair.
    'sbg:x': 0
    'sbg:y': 5443.1875
  - id: bwa_mem_output
    type: string?
    doc: 'bwa mem: Output SAM file name'
    'sbg:x': 0
    'sbg:y': 5549.890625
  - id: create_bam_index
    type: boolean?
    'sbg:x': 2248.361328125
    'sbg:y': 2901.7421875
  - id: bwa_mem_M
    type: boolean?
    doc: Mark shorter split hits as secondary
    'sbg:x': 0
    'sbg:y': 5656.59375
  - id: bwa_mem_K
    type: int?
    doc: >-
      bwa mem : to achieve deterministic alignment results (Note: this is a
      hidden option)
    'sbg:x': 0
    'sbg:y': 5763.296875
  - id: abra2_window_size
    type: string?
    doc: 'Processing window size and overlap (size,overlap) (default: 400,200)'
    'sbg:x': 3001.30419921875
    'sbg:y': 2614.8671875
  - id: abra2_soft_clip_contig
    type: string?
    doc: >-
      Soft clip contig args
      [max_contigs,min_base_qual,frac_high_qual_bases,min_soft_clip_len]
      (default:16,13,80,15)
    'sbg:x': 3001.30419921875
    'sbg:y': 2721.5859375
  - id: abra2_scoring_gap_alignments
    type: string?
    doc: >-
      Scoring used for contig alignments(match,
      mismatch_penalty,gap_open_penalty,gap_extend_penalty) (default:8,32,48,1)
    'sbg:x': 3001.30419921875
    'sbg:y': 2828.3203125
  - id: picard_fixmate_information_output_file_name
    type: string?
    doc: 'PicardFixMateInformaiton: The output file to write to'
    'sbg:x': 0
    'sbg:y': 426.859375
  - id: abra2_output_bams
    type:
      - string
      - type: array
        items: string
    doc: Required list of output sam or bam file (s) separated by comma
    'sbg:x': 3001.30419921875
    'sbg:y': 2935.0390625
  - id: bedtools_genomecov_option_bedgraph
    type: boolean?
    doc: >-
      option flag parameter to choose output file format. -bg refers to bedgraph
      format
    'sbg:x': 3001.30419921875
    'sbg:y': 2508.1484375
  - id: abra2_no_sort
    type: boolean?
    doc: Do not attempt to sort final output
    'sbg:x': 3001.30419921875
    'sbg:y': 3041.7421875
  - id: abra2_no_edge_complex_indel
    type: boolean?
    doc: Prevent output of complex indels at read start or read end
    'sbg:x': 3001.30419921875
    'sbg:y': 3148.4609375
  - id: abra2_maximum_mixmatch_rate
    type: float?
    doc: >-
      Max allowed mismatch rate when mapping reads back to contigs (default:
      0.05)
    'sbg:x': 3001.30419921875
    'sbg:y': 3255.1796875
  - id: abra2_maximum_average_depth
    type: int?
    doc: >-
      Regions with average depth exceeding this value will be downsampled
      (default: 1000)
    'sbg:x': 3001.30419921875
    'sbg:y': 3361.8984375
  - id: bedtools_merge_distance_between_features
    type: int?
    doc: Maximum distance between features allowed for features to be merged.
    'sbg:x': 3001.30419921875
    'sbg:y': 2401.4140625
  - id: abra2_contig_anchor
    type: string?
    doc: >-
      Contig anchor [M_bases_at_contig_edge,max_mismatches_near_edge]
      (default:10,2)
    'sbg:x': 3001.30419921875
    'sbg:y': 3468.6328125
  - id: abra2_consensus_sequence
    type: boolean?
    doc: Use positional consensus sequence when aligning high quality soft clipping
    'sbg:x': 3001.30419921875
    'sbg:y': 3575.3515625
  - id: gatk_merge_bam_alignment_output_file_name
    type: string?
    doc: 'GATK MergeBamAlignment: Output File Name'
    'sbg:x': 0
    'sbg:y': 2134.53125
  - id: fgbio_filter_consensus_read_reverse_per_base_tags_simplex_duplex
    type: boolean?
    doc: >-
      Fgbio FilterConsensusReads: Reverse [complement] per base tags on reverse 
      strand reads.- Simplex+Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 1974.3984375
  - id: fgbio_filter_consensus_read_reverse_per_base_tags_duplex
    type: boolean?
    doc: >-
      Fgbio FilterConsensusReads: Reverse [complement] per base tags on reverse 
      strand reads. - Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 2081.1328125
  - id: fgbio_filter_consensus_read_require_single_strand_agreement_simplex_duplex
    type: boolean?
    doc: >-
      Fgbio FilterConsensusReads: Mask (make N) consensus bases where the AB and
      BA consensus reads disagree (for duplex-sequencing only).
    'sbg:x': 3467.848876953125
    'sbg:y': 2187.8671875
  - id: fgbio_filter_consensus_read_require_single_strand_agreement_duplex
    type: boolean?
    doc: >-
      Fgbio FilterConsensusReads: Mask (make N) consensus bases where the AB and
      BA consensus reads disagree (for duplex-sequencing only).
    'sbg:x': 3467.848876953125
    'sbg:y': 2294.6015625
  - id: fgbio_filter_consensus_read_max_base_error_rate_duplex
    type: 'float[]?'
    doc: >-
      Fgbio FilterConsensusReads: The maximum error rate for a single consensus 
      base. (Max 3 values) - Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 4109.0859375
  - id: fgbio_filter_consensus_read_max_base_error_rate_simplex_duplex
    type: 'float[]?'
    doc: >-
      Fgbio FilterConsensusReads: The maximum error rate for a single consensus 
      base. (Max 3 values) - Simplex + Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 4002.3515625
  - id: fgbio_filter_consensus_read_max_no_call_fraction_duplex
    type: float?
    doc: >-
      Fgbio FilterConsensusReads: Maximum fraction of no-calls in the read 
      after filtering - Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 3895.6171875
  - id: fgbio_filter_consensus_read_max_read_error_rate_duplex
    type: 'float[]?'
    doc: >-
      Fgbio FilterConsensusReads: The maximum raw-read error rate across the 
      entire consensus read. (Max 3 values) - Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 3682.1484375
  - id: fgbio_filter_consensus_read_max_no_call_fraction_simplex_duplex
    type: float?
    doc: >-
      Fgbio FilterConsensusReads: Maximum fraction of no-calls in the read 
      after filtering - Simplex + Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 3788.8828125
  - id: fgbio_filter_consensus_read_max_read_error_rate_simplex_duplex
    type: 'float[]?'
    doc: >-
      The maximum raw-read error rate across the entire consensus read. (Max 3
      values) - Simplex + Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 3575.4140625
  - id: fgbio_filter_consensus_read_min_base_quality_duplex
    type: int?
    doc: >-
      Fgbio FilterConsensusReads: Mask (make N) consensus bases with quality 
      less than this threshold. - Dupelx
    'sbg:x': 3467.848876953125
    'sbg:y': 3468.6796875
  - id: fgbio_filter_consensus_read_min_base_quality_simplex_duplex
    type: int?
    doc: >-
      Fgbio FilterConsensusReads: Mask (make N) consensus bases with quality 
      less than this threshold. - Simplex + Dupelx
    'sbg:x': 3467.848876953125
    'sbg:y': 3361.9453125
  - id: fgbio_filter_consensus_read_min_mean_base_quality_duplex
    type: int?
    doc: >-
      Fgbio FilterConsensusReads: The minimum mean base quality across the 
      consensus read - Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 3255.2109375
  - id: fgbio_filter_consensus_read_min_mean_base_quality_simplex_duplex
    type: int?
    doc: >-
      Fgbio FilterConsensusReads: The minimum mean base quality across the 
      consensus read - Simplex + Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 3148.4765625
  - id: fgbio_filter_consensus_read_min_reads_duplex
    type: 'int[]'
    doc: >-
      Fgbio FilterConsensusReads: The minimum number of reads supporting a 
      consensus base/read. (Max 3 values) - Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 3041.7421875
  - id: fgbio_filter_consensus_read_min_reads_simplex_duplex
    type: 'int[]'
    doc: >-
      Fgbio FilterConsensusReads: The minimum number of reads supporting a 
      consensus base/read. (Max 3 values) - Simplex+Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 2935.0078125
  - id: fgbio_filter_consensus_read_output_file_name_simplex_duplex
    type: string
    doc: 'Fgbio FilterConsensusReads: Output file name Simplex + Duplex'
    'sbg:x': 3467.848876953125
    'sbg:y': 2401.3359375
  - id: fgbio_filter_consensus_read_output_file_name_simplex_aln_metrics
    type: string?
    doc: 'Fgbio FilterConsensusReads: Output file name Simplex alignment metrics'
    'sbg:x': 3467.848876953125
    'sbg:y': 2508.0703125
  - id: fgbio_postprocessing_output_file_name_simplex
    type: string
    doc: 'Fgbio Postprocessing: Output file name Simplex'
    'sbg:x': 3467.848876953125
    'sbg:y': 1867.6640625
  - id: fgbio_filter_consensus_read_output_file_name_duplex_aln_metrics
    type: string?
    doc: 'Fgbio FilterConsensusReads: Output file name Duplex alignment metrics'
    'sbg:x': 3467.848876953125
    'sbg:y': 2614.8046875
  - id: fgbio_filter_consensus_read_output_file_name_duplex
    type: string
    doc: 'Fgbio FilterConsensusReads: Output file name Duplex'
    'sbg:x': 3467.848876953125
    'sbg:y': 2721.5390625
  - id: fgbio_filter_consensus_read_min_simplex_reads
    type: int?
    doc: >-
      Fgbio FilterConsensusReads: The minimum number of reads supporting a 
      consensus base/read. (Max 3 values) - Simplex+Duplex
    'sbg:x': 3467.848876953125
    'sbg:y': 2828.2734375
  - id: picard_addRG_read_group_sample_name
    type: string
    doc: 'PicardAddOrReplaceReadGroups: Read-Group sample name'
    'sbg:x': 0
    'sbg:y': 853.75
  - id: bwa_number_of_threads
    type: int?
    doc: 'bwa mem: Number of threads'
    'sbg:x': 0
    'sbg:y': 5123.078125
  - id: gatk_collect_alignment_summary_metrics_output_file_name
    type: string?
    doc: >-
      GATK CollectAlignmentSummaryMetrics: Output file name for metrics on
      collapsed BAM (Duplex+Simplex+Singletons)
    'sbg:x': 0
    'sbg:y': 2241.265625
  - id: picard_addRG_sort_order
    type: string
    'sbg:x': 0
    'sbg:y': 533.5625
  - id: temporary_directory
    type: string?
    'sbg:x': 0
    'sbg:y': 106.734375
  - id: async_io
    type: string?
    'sbg:x': 0
    'sbg:y': 5870.015625
outputs:
  - id: fgbio_group_reads_by_umi_histogram
    outputSource:
      - fgbio_group_reads_by_umi_1_2_0/fgbio_group_reads_by_umi_histogram
    type: File
    'sbg:x': 1079.60107421875
    'sbg:y': 2627.90625
  - id: fgbio_collect_duplex_seq_metrics_umi_counts
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_umi_counts
    type: File
    'sbg:x': 1680.5753173828125
    'sbg:y': 2721.5390625
  - id: fgbio_collect_duplex_seq_metrics_family_size
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_family_size
    type: File
    'sbg:x': 1680.5753173828125
    'sbg:y': 2828.2734375
  - id: fgbio_collect_duplex_seq_metrics_duplex_yield_metrics
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_yield_metrics
    type: File
    'sbg:x': 1680.5753173828125
    'sbg:y': 2935.0078125
  - id: fgbio_collect_duplex_seq_metrics_duplex_umi_counts_txt
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_umi_counts
    type: File
    'sbg:x': 1680.5753173828125
    'sbg:y': 3041.7421875
  - id: fgbio_collect_duplex_seq_metrics_duplex_qc
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_qc
    type: File
    'sbg:x': 1680.5753173828125
    'sbg:y': 3148.4765625
  - id: fgbio_collect_duplex_seq_metrics_duplex_family_size
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_family_size
    type: File
    'sbg:x': 1680.5753173828125
    'sbg:y': 3255.2109375
  - id: gatk_sam_to_fastq_unpaired_fastq
    outputSource:
      - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_unpaired_fastq
    type: File?
    'sbg:x': 2248.361328125
    'sbg:y': 2581.5546875
  - id: gatk_sam_to_fastq_second_end_fastq
    outputSource:
      - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_second_end_fastq
    type: File?
    'sbg:x': 2248.361328125
    'sbg:y': 2688.2890625
  - id: gatk_sam_to_fastq_fastq
    outputSource:
      - gatk_sam_to_fastq_4_1_8_0/gatk_sam_to_fastq_fastq
    type: File?
    'sbg:x': 2248.361328125
    'sbg:y': 2795.0234375
  - id: gatk_collect_alignment_summary_metrics_txt_simplex
    outputSource:
      - fgbio_separate_bams/gatk_collect_alignment_summary_metrics_txt_simplex
    type: File
    'sbg:x': 5103.671875
    'sbg:y': 2668.171875
  - id: gatk_collect_alignment_summary_metrics_txt_duplex
    outputSource:
      - fgbio_separate_bams/gatk_collect_alignment_summary_metrics_txt_duplex
    type: File
    'sbg:x': 5103.671875
    'sbg:y': 2774.90625
  - id: fgbio_postprocessing_simplex_bam
    outputSource:
      - fgbio_separate_bams/fgbio_postprocessing_simplex_bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 5103.671875
    'sbg:y': 2988.375
  - id: fgbio_filter_consensus_reads_duplex_bam
    outputSource:
      - fgbio_separate_bams/fgbio_filter_consensus_reads_duplex_bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 5103.671875
    'sbg:y': 3201.84375
  - id: fgbio_collapsed_bam
    outputSource:
      - indel_realignment/indel_realignment_bam
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 4160.3173828125
    'sbg:y': 3230.7421875
  - id: gatk_collect_alignment_summary_metrics_txt_collapsed
    outputSource:
      - >-
        gatk_collect_alignment_summary_metrics_4_1_8_0/gatk_collect_alignment_summary_metrics_txt
    type: File
    'sbg:x': 5103.671875
    'sbg:y': 2881.640625
  - id: fgbio_group_reads_by_umi_bam
    outputSource:
      - fgbio_group_reads_by_umi_1_2_0/fgbio_group_reads_by_umi_bam
    type: File
    'sbg:x': 1079.60107421875
    'sbg:y': 2734.640625
  - id: fgbio_filter_consensus_reads_simplex_duplex_bam
    outputSource:
      - fgbio_separate_bams/fgbio_filter_consensus_reads_simplex_duplex_bam
    type: File
    'sbg:x': 5103.671875
    'sbg:y': 3095.109375
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
      - id: temporary_directory
        source: temporary_directory
      - id: async_io
        source: async_io
    out:
      - id: fgbio_group_reads_by_umi_bam
      - id: fgbio_group_reads_by_umi_histogram
    run: >-
      command_line_tools/fgbio_group_reads_by_umi_1.2.0/fgbio_group_reads_by_umi_1.2.0.cwl
    label: fgbio_group_reads_by_umi_1.2.0
    'sbg:x': 541.75
    'sbg:y': 2865.0078125
  - id: fgbio_collect_duplex_seq_metrics_1_2_0
    in:
      - id: input
        source: fgbio_group_reads_by_umi_1_2_0/fgbio_group_reads_by_umi_bam
      - id: output_prefix
        source: fgbio_collect_duplex_seq_metrics_output_prefix
      - id: intervals
        source: fgbio_collect_duplex_seq_metrics_intervals
      - id: description
        source: fgbio_collect_duplex_seq_metrics_description
      - id: duplex_umi_counts
        source: fgbio_collect_duplex_seq_metrics_duplex_umi_counts
      - id: min_ab_reads
        source: fgbio_collect_duplex_seq_metrics_min_ab_reads
      - id: min_ba_reads
        source: fgbio_collect_duplex_seq_metrics_min_ba_reads
      - id: mi_tag
        source: fgbio_collect_duplex_seq_metrics_mi_tag
      - id: temporary_directory
        source: temporary_directory
      - id: async_io
        source: async_io
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
    'sbg:x': 1079.60107421875
    'sbg:y': 2904.375
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
      - id: temporary_directory
        source: temporary_directory
      - id: async_io
        source: async_io
    out:
      - id: fgbio_call_duplex_consensus_reads_bam
    run: >-
      command_line_tools/fgbio_call_duplex_consensus_reads_1.2.0/fgbio_call_duplex_consensus_reads_1.2.0.cwl
    label: fgbio_call_duplex_consensus_reads_1.2.0
    'sbg:x': 1079.60107421875
    'sbg:y': 3158.109375
  - id: gatk_sam_to_fastq_4_1_8_0
    in:
      - id: fastq
        source: gatk_sam_to_fastq_output_name_R1
      - id: input
        source: >-
          fgbio_call_duplex_consensus_reads_1_2_0/fgbio_call_duplex_consensus_reads_bam
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
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: gatk_sam_to_fastq_fastq
      - id: gatk_sam_to_fastq_unpaired_fastq
      - id: gatk_sam_to_fastq_second_end_fastq
    run: command_line_tools/gatk_sam_to_fastq_4.1.8.0/gatk_sam_to_fastq_4.1.8.0.cwl
    label: GATK-SamToFastq
    'sbg:x': 1680.5753173828125
    'sbg:y': 2558.8203125
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
        source: picard_addRG_sort_order
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
      - id: T
        source: bwa_mem_T
      - id: 'Y'
        source: bwa_mem_Y
      - id: K
        source: bwa_mem_K
      - id: bwa_number_of_threads
        source: bwa_number_of_threads
    out:
      - id: picard_add_or_replace_read_groups_bam
    run: subworkflows/alignment/alignment.cwl
    label: alignment
    'sbg:x': 2248.361328125
    'sbg:y': 3148.4609375
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
        source: gatk_merge_bam_alignment_4_1_8_0/gatk_merge_bam_alignment_bam
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
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: indel_realignment_bam
    run: subworkflows/indel_realignment/indel_realignment.cwl
    label: indel_realignment
    'sbg:x': 3467.848876953125
    'sbg:y': 1627.9296875
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
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: gatk_merge_bam_alignment_bam
    run: >-
      command_line_tools/gatk_merge_bam_alignment_4.1.8.0/gatk_merge_bam_alignment_4.1.8.0.cwl
    label: GATK-MergeBamAlignment
    'sbg:x': 3001.30419921875
    'sbg:y': 2245.6796875
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
        source: fgbio_postprocessing_output_file_name_simplex
      - id: min_simplex_reads
        source: fgbio_filter_consensus_read_min_simplex_reads
      - id: temporary_directory
        source: temporary_directory
      - id: async_io
        source: async_io
    out:
      - id: fgbio_filter_consensus_reads_duplex_bam
      - id: fgbio_postprocessing_simplex_bam
      - id: gatk_collect_alignment_summary_metrics_txt_duplex
      - id: fgbio_filter_consensus_reads_simplex_duplex_bam
      - id: gatk_collect_alignment_summary_metrics_txt_simplex
    run: subworkflows/fgbio_separate_bams/fgbio_separate_bams.cwl
    label: fgbio_separate_bams
    'sbg:x': 4160.3173828125
    'sbg:y': 2935.0078125
  - id: gatk_collect_alignment_summary_metrics_4_1_8_0
    in:
      - id: input
        source: indel_realignment/indel_realignment_bam
      - id: output_file_name
        source: gatk_collect_alignment_summary_metrics_output_file_name
      - id: reference
        source: reference_sequence
      - id: validation_stringency
        source: validation_stringency
      - id: temporary_directory
        source: temporary_directory
    out:
      - id: gatk_collect_alignment_summary_metrics_txt
    run: >-
      command_line_tools/gatk_collect_alignment_summary_metrics_4.1.8.0/gatk_collect_alignment_summary_metrics_4.1.8.0.cwl
    label: GATK-CollectAlignmentSummaryMetrics
    'sbg:x': 4160.3173828125
    'sbg:y': 2611.2734375
requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement
$schemas:
  - 'http://schema.org/version/latest/schemaorg-current-http.rdf'
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
