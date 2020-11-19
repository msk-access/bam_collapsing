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

### BWA MEM

| Argument Name | Summary | Default Value |
| :---: | :---: | :---: |
| **bwa\_mem\_Y** | Force soft-clipping rather than default hard-clipping of supplementary alignments |  |
| **bwa\_mem\_T** | Don’t output alignment with score lower than INT. This option only affects output. |  |
| **bwa\_mem\_P** | In the paired-end mode, perform SW to rescue missing hits only but do not try to find hits that fit a proper pair. |  |
| **bwa\_mem\_output** | Output SAM file name |  |
| **bwa\_mem\_M** | Mark shorter split hits as secondary |  |
| **bwa\_mem\_K** | to achieve deterministic alignment results \(Note: this is a hidden option\) |  |
| **bwa\_number\_of\_threads** | Number of threads |  |



