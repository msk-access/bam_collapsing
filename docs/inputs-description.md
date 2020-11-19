---
description: Input files and parameters required to run workflow
---

# Inputs Description

{% hint style="warning" %}
 Common workflow language execution engines accept two types of input that are [JSON](https://json.org) or [YAML](https://yaml.org), please make sure to use one of these while generating the input file. For more information refer to: [http://www.commonwl.org/user\_guide/yaml/](http://www.commonwl.org/user_guide/yaml/)
{% endhint %}

## **Parameter Used by Tools**

### Common Parameters Across Tools

| **Argument Name** | Summary | Default Value |
| :---: | :---: | :---: |
| **reference\_sequence** | Reference sequence file. Please include ".fai", "^.dict", ".amb" , ".sa", ".bwt", ".pac" as secondary files if they are not present in the same location as the ".fasta" file |  |
| **validation\_stringency** | GATK: Validation stringency for all SAM files read by this program. Setting stringency to SILENT can improve performance when processing a BAM file in which variable-length data \(read, qualities, tags\) do not otherwise need to be decoded. |  |
| **create\_bam\_index** | GATK: Generate BAM index file when possible |  |
| **sort\_order** | GATK: The order in which the merged reads should be output. |  |

### Fgbio [GroupReadsByUmi](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fgbio_group_reads_by_umi_1.2.0)

| **Argument Name** | Summary | Default Value |
| :---: | :---: | :---: |
| **fgbio\_group\_reads\_by\_umi\_input** | The input BAM file |  |
| **fgbio\_group\_reads\_by\_umi\_strategy** | The UMI assignment strategy. \(identity, edit, adjacency, paired\) |  |
| **fgbio\_group\_reads\_by\_umi\_raw\_tag** | The tag containing the raw UMI. | RX |
| **fgbio\_group\_reads\_by\_umi\_output\_file\_name** | The output BAM file name |  |
| **fgbio\_group\_reads\_by\_umi\_min\_umi\_length** | The minimum UMI length. If not specified then all UMIs must have the same length, otherwise, discard reads with UMIs shorter than this length and allow for differing UMI lengths. |  |
| **fgbio\_group\_reads\_by\_umi\_include\_non\_pf\_reads** | Include non-PF reads. | False |
| **fgbio\_group\_reads\_by\_umi\_family\_size\_histogram** | Optional output of tag family size counts. |  |
| **fgbio\_group\_reads\_by\_umi\_edits** | The allowable number of edits between UMIs. | 1 |
| **fgbio\_group\_reads\_by\_umi\_assign\_tag** | The output tag for UMI grouping. | MI |

### Fgbio [CollectDuplexSeqMetrics](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fgbio_collect_duplex_seq_metrics_1.2.0)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **fgbio\_collect\_duplex\_seq\_metrics\_intervals** | Optional set of intervals over which to restrict analysis. |  |
| **fgbio\_collect\_duplex\_seq\_metrics\_output\_prefix** | Prefix of output files to write. |  |
| **fgbio\_collect\_duplex\_seq\_metrics\_min\_ba\_reads** | Minimum BA reads to call a tag family a ‘duplex’. |  |
| **fgbio\_collect\_duplex\_seq\_metrics\_min\_ab\_reads** | Minimum AB reads to call a tag family a ‘duplex’. |  |
| **fgbio\_collect\_duplex\_seq\_metrics\_mi\_tag** | The output tag for UMI grouping. | MI |
| **fgbio\_collect\_duplex\_seq\_metrics\_duplex\_umi\_counts** | If true, produce the .duplex\_umi\_counts.txt file with counts of duplex UMI observations. |  |
| **fgbio\_collect\_duplex\_seq\_metrics\_description** | Description of data set used to label plots. Defaults to sample/library. |  |

### Fgbio [CallDuplexConsensusReads](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fgbio_call_duplex_consensus_reads_1.2.0)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **fgbio\_call\_duplex\_consensus\_reads\_trim** | If true, quality trim input reads in addition to masking low Q bases. |  |
| **fgbio\_call\_duplex\_consensus\_reads\_sort\_order** | The sort order of the output, if :none: then the same as the input. |  |
| **fgbio\_call\_duplex\_consensus\_reads\_read\_name\_prefix** | The prefix all consensus read names |  |
| **fgbio\_call\_duplex\_consensus\_reads\_read\_group\_id** | The new read group ID for all the consensus reads. |  |
| **fgbio\_call\_duplex\_consensus\_reads\_output\_file\_name** | Output SAM or BAM file to write consensus reads. |  |
| **fgbio\_call\_duplex\_consensus\_reads\_min\_reads** | The minimum number of input reads to a consensus read. |  |
| **fgbio\_call\_duplex\_consensus\_reads\_min\_input\_base\_quality** | Ignore bases in raw reads that have Q below this value. |  |
| **fgbio\_call\_duplex\_consensus\_reads\_max\_reads\_per\_strand** | The maximum number of reads to use when building a single-strand consensus. If more than this many reads are present in a tag family, the family is randomly downsampled to exactly max-reads reads. |  |
| **fgbio\_call\_duplex\_consensus\_reads\_error\_rate\_pre\_umi** | The Phred-scaled error rate for an error prior to the UMIs being integrated. |  |
| **fgbio\_call\_duplex\_consensus\_reads\_error\_rate\_post\_umi** | The Phred-scaled error rate for an error post the UMIs have been integrated. |  |

### GATK [SamToFastq](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_sam_to_fastq_4.1.8.0)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **gatk\_sam\_to\_fastq\_output\_name\_unpaired** | unpaired fastq output file name |  |
| **gatk\_sam\_to\_fastq\_output\_name\_R1** | Read1 fastq.gz output file name |  |
| **gatk\_sam\_to\_fastq\_output\_name\_R2** | Read2 fastq.gz output file name |  |
| **gatk\_sam\_to\_fastq\_include\_non\_primary\_alignments** | If true, include non-primary alignments in the output. Support of non-primary alignments in SamToFastq is not comprehensive, so there may be exceptions if this is set to true and there are paired reads with non-primary alignments. |  |
| **gatk\_sam\_to\_fastq\_include\_non\_pf\_reads** | Include non-PF reads from the SAM file into the output FASTQ files. PF means 'passes filtering'. Reads whose 'not passing quality controls' flag is set are non-PF reads. See GATK Dictionary for more info. |  |

### [BWA MEM](https://github.com/msk-access/cwl-commandlinetools/tree/develop/bwa_mem_0.7.17)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **bwa\_mem\_Y** | Force soft-clipping rather than default hard-clipping of supplementary alignments |  |
| **bwa\_mem\_T** | Don’t output alignment with score lower than INT. This option only affects output. |  |
| **bwa\_mem\_P** | In the paired-end mode, perform SW to rescue missing hits only but do not try to find hits that fit a proper pair. |  |
| **bwa\_mem\_output** | Output SAM file name |  |
| **bwa\_mem\_M** | Mark shorter split hits as secondary |  |
| **bwa\_mem\_K** | to achieve deterministic alignment results \(Note: this is a hidden option\) |  |
| **bwa\_number\_of\_threads** | Number of threads |  |

### Picard [AddOrReplaceReadGroups](https://github.com/msk-access/cwl-commandlinetools/tree/develop/picard_add_or_replace_read_groups_4.1.8.1)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **picard\_addRG\_read\_group\_sequencing\_platform** | Read-Group platform \(e.g. ILLUMINA, SOLID\) |  |
| **picard\_addRG\_read\_group\_sequencing\_center** | Read-Group sequencing center name |  |
| **picard\_addRG\_read\_group\_run\_date** | Read-Group date in \(Iso8601Date\) |  |
| **picard\_addRG\_read\_group\_platform\_unit** | Read-Group Platform Unit \(eg. run barcode\) |  |
| **picard\_addRG\_read\_group\_library** | Read-Group library |  |
| **picard\_addRG\_read\_group\_identifier** | Read-Group ID |  |
| **picard\_addRG\_read\_group\_description** | Read-Group Description |  |
| **picard\_addRG\_output\_file\_name** | Output BAM file name |  |
| **picard\_addRG\_read\_group\_sample\_name** | Read-Group sample name |  |

### GATK [MergeBamAlignment](https://github.com/msk-access/cwl-commandlinetools/tree/develop/gatk_merge_bam_alignment_4.1.8.0)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **gatk\_merge\_bam\_alignment\_output\_file\_name** | Output BAM file name |  |

### bedtools [genomecov](https://github.com/msk-access/cwl-commandlinetools/tree/develop/bedtools_genomecov_v2.28.0_cv2)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **bedtools\_genomecov\_option\_bedgraph** | option flag parameter to choose output file format. -bg refers to bedgraph format |  |

### bedtools [merge](https://github.com/msk-access/cwl-commandlinetools/tree/develop/bedtools_merge_v2.28.0_cv2)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **bedtools\_merge\_distance\_between\_features** | Maximum distance between features allowed for features to be merged. |  |

### [ABRA2](https://github.com/msk-access/cwl-commandlinetools/tree/develop/abra2_2.22)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **abra2\_window\_size** | Processing window size and overlap \(size,overlap\) \(default: 400,200\) |  |
| **abra2\_soft\_clip\_contig** | Soft clip contig args \[max_contigs,min\_base\_qual,frac_ high\_qual\_bases,min\_soft\_clip\_len\] \(default:16,13,80,15\) |  |
| **abra2\_scoring\_gap\_alignments** | Scoring used for contig alignments\(match, mismatch\_penalty,gap\_open\_penalty,gap\_extend\_penalty\) \(default:8,32,48,1\) |  |
| **abra2\_no\_sort** | Do not attempt to sort final output |  |
| **abra2\_no\_edge\_complex\_indel** | Prevent output of complex indels at read start or read end |  |
| **abra2\_maximum\_mixmatch\_rate** | Max allowed mismatch rate when mapping reads back to contigs \(default: 0.05\) |  |
| **abra2\_maximum\_average\_depth** | Regions with average depth exceeding this value will be downsampled \(default: 1000\) |  |
| **abra2\_contig\_anchor** | Contig anchor \[M\_bases\_at\_contig\_edge,max\_mismatches\_near\_edge\] \(default:10,2\) |  |
| **abra2\_consensus\_sequence** | Use positional consensus sequence when aligning high quality soft clipping |  |

### Picard [FixMateInformation](https://github.com/msk-access/cwl-commandlinetools/tree/develop/picard_fix_mate_information_4.1.8.1)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **picard\_fixmate\_information\_output\_file\_name** | The output BAM file to write to |  |

### Fgbio [FilterConsensusReads](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fgbio_filter_consensus_reads_1.2.0)

<table>
  <thead>
    <tr>
      <th style="text-align:center">Argument Name</th>
      <th style="text-align:center">Summary</th>
      <th style="text-align:center">Default Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_reverse_per_base_tags_simplex_duplex</b>
      </td>
      <td style="text-align:center">Reverse [complement] per base tags on reverse strand reads.- Simplex+Duplex</td>
      <td
      style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_reverse_per_base_tags_duplex</b>
      </td>
      <td style="text-align:center">Reverse [complement] per base tags on reverse strand reads. - Duplex</td>
      <td
      style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_require_single_strand_agreement_simplex_duplex</b>
      </td>
      <td style="text-align:center">Mask (make N) consensus bases where the AB and BA consensus reads disagree
        (for duplex-sequencing only).</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center">f<b>gbio_filter_consensus_read_require_single_strand_agreement_duplex</b>
      </td>
      <td style="text-align:center">Mask (make N) consensus bases where the AB and BA consensus reads disagree
        (for duplex-sequencing only).</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_max_base_error_rate_duplex</b>
      </td>
      <td style="text-align:center">The maximum error rate for a single consensus base. (Max 3 values) - Duplex</td>
      <td
      style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_max_base_error_rate_simplex_duplex</b>
      </td>
      <td style="text-align:center">The maximum error rate for a single consensus base. (Max 3 values) - Simplex
        + Duplex</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_max_no_call_fraction_duplex</b>
      </td>
      <td style="text-align:center">Maximum fraction of no- calls in the read after filtering - Duplex</td>
      <td
      style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_max_read_error_rate_duplex</b>
      </td>
      <td style="text-align:center">
        <p></p>
        <p>The maximum raw-read error rate across the entire consensus read. (Max
          3 values) - Duplex</p>
      </td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_max_no_call_fraction_simplex_duplex</b>
      </td>
      <td style="text-align:center">Maximum fraction of no- calls in the read after filtering - Simplex +
        Duplex</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_max_read_error_rate_simplex_duplex</b>
      </td>
      <td style="text-align:center">The maximum raw-read error rate across the entire consensus read. (Max
        3 values) - Simplex + Duplex</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_min_base_quality_duplex</b>
      </td>
      <td style="text-align:center">Mask (make N) consensus bases with quality less than this threshold. -
        Dupelx</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_min_base_quality_simplex_duplex</b>
      </td>
      <td style="text-align:center">
        <p></p>
        <p>Mask (make N) consensus bases with quality less than this threshold. -
          Simplex+Dupelx</p>
      </td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_min_mean_base_quality_duplex</b>
      </td>
      <td style="text-align:center">The minimum mean base quality across the consensus read - Duplex</td>
      <td
      style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_min_mean_base_quality_simplex_duplex</b>
      </td>
      <td style="text-align:center">The minimum mean base quality across the consensus read - Simplex + Duplex</td>
      <td
      style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_min_reads_duplex</b>
      </td>
      <td style="text-align:center">
        <p></p>
        <p>The minimum number of reads supporting a consensus base/read. (Max 3 values)
          - Duplex</p>
      </td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_min_reads_simplex_duplex</b>
      </td>
      <td style="text-align:center">
        <p></p>
        <p>The minimum number of reads supporting a consensus base/read. (Max 3 values)</p>
        <p>-Simplex+Duplex</p>
      </td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_output_file_name_simplex_duplex</b>
      </td>
      <td style="text-align:center">Output BAM file name Simplex + Duplex</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_output_file_name_duplex_aln_metrics</b>
      </td>
      <td style="text-align:center">Output file name Duplex alignment metrics</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_output_file_name_simplex_aln_metrics</b>
      </td>
      <td style="text-align:center">Output file name Simplex alignment metrics</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_output_file_name_duplex</b>
      </td>
      <td style="text-align:center">Output BAM file name - Duplex</td>
      <td style="text-align:center"></td>
    </tr>
    <tr>
      <td style="text-align:center"><b>fgbio_filter_consensus_read_min_simplex_reads</b>
      </td>
      <td style="text-align:center">
        <p></p>
        <p>The minimum number of reads supporting a consensus base/read. (Max 3 values)
          -</p>
        <p>Simplex+Duplex</p>
      </td>
      <td style="text-align:center"></td>
    </tr>
  </tbody>
</table>

### Fgbio [Postprocessing](https://github.com/msk-access/cwl-commandlinetools/tree/develop/fgbio_postprocessing_simplex_filter_0.1.8)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **fgbio\_postprocessing\_output\_file\_name\_simplex** | Output BAM file name Simplex |  |

### Picard [CollectAlignmentSummaryMetrics](https://github.com/mskcc/cwl-commandlinetools/tree/develop/picard_collect_alignment_summary_metrics_2.8.1)

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **gatk\_collect\_alignment\_summary\_metrics\_output\_file\_name** | Output file name for metrics on collapsed BAM \(Duplex+Simplex+Singletons\) |  |

