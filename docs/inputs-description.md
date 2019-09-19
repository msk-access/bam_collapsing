---
description: Input files and parameters required to run workflow
---

# Inputs Description

* [Waltz Pileupmetrics](https://github.com/mskcc/cwl-commandlinetools/tree/master/waltz_pileupmatrices_3.1.1)
  * **bed\_file** - the genotype from positions in this bed file will be used as the consensus base if **min\_consensus\_percent** threshold is not reached. Otherwise, the reference base from the supplied **reference\_fasta** will be used
* [Marianas](https://github.com/mskcc/cwl-commandlinetools/tree/master/marianas_collapsing_first_pass_1.8.1) collapsing - First / Second passes
  * **bam** - input bam file
  * **wobble** - allowable left and right shift amount for grouping UMI families
  * **reference\_fasta** - currently, hg19
  * **mismatches** - allowable mismatch count in UMI bases for grouping UMI families
  * **min\_consensus\_percent** - percentage of bases that must be in agreement at each position in the consensus read before masking that base as "N"
  * **min\_base\_quality** - ? used for masking as "N"?
* [unix sort](https://github.com/mskcc/cwl-commandlinetools/tree/master/utilities_ubuntu_18.04) \(a simple sort step for the first-pass output file\)
  * key - SHOULD BE A DEFAULT!
* [gzip\_read\_1 / gzip\_read\_2](https://github.com/mskcc/cwl-commandlinetools/tree/master/utilities_ubuntu_18.04)
  * **output\_name\_collapsed\_gzip\_R1** - filename for collapsed read 1 fastq
  * **output\_name\_collapsed\_gzip\_R2** - filename for collapsed read 2 fastq
* [Alignment](https://github.com/msk-access/cwl_subworkflows) of collapsed fastqs with [BWA mem](https://github.com/mskcc/cwl-commandlinetools/tree/master/bwa_mem_0.7.5a) / [Picard AddOrReplaceReadGroups](https://github.com/mskcc/cwl-commandlinetools/tree/master/picard_add_or_replace_read_groups_1.96)
  * identifiers to be placed in Bam header:
    * **read\_group\_sequencing\_center** - organization that performed sequencing
    * **read\_group\_sequencing\_platform** - sequencer type, e.g. Illumina HiSeq
    * **read\_group\_sample\_name** - unique identifier for the sample 
    * **read\_group\_platform\_unit** - {flowcell\_barcode}{lane\_number}.{sample\_barcode}
    * **read\_group\_library** - DNA library identifier \(Only necessary for MarkDuplicates\)
    * **read\_group\_identifier** - unique read group ID \(Only necessary for BQSR\)
    * **picard\_output\_file\_name** - Filename to be given to final re-aligned bam \(SHOULD BE A DEFAULT?\)
    * **aln\_output\_file\_name** - Filename to be given to intermediate sam file \(SHOULD BE A DEFAULT?\)



Parameters used across multiple steps:

* **reference\_fasta** - Used in the follwing steps:
  * Waltz PileupMetrics
  * Marianas Collapsing
  * Re-alignment of collapsed fastqs with BWA mem
  * Indel Realignment with Abra
  * Picard CollectAlignmentSummaryMetrics
* **min\_map\_quality** - ? used for masking as "N"?



