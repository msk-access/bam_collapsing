---
description: Input files and parameters required to run workflow
---

# Inputs Description

<table>
  <thead>
    <tr>
      <th style="text-align:left">Input</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"><b>bed_file</b>
      </td>
      <td style="text-align:left">The genotype from positions in this bed file will be used as the consensus
        base if <b>min_consensus_percent</b> threshold is not reached. Otherwise,
        the reference base from the supplied <b>reference_fasta</b> will be used</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>bam</b>
      </td>
      <td style="text-align:left">Input bam file</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>wobble</b>
      </td>
      <td style="text-align:left">Allowable left and right shift amount for grouping UMI families together</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>mismatches</b>
      </td>
      <td style="text-align:left">Allowable mismatch count in UMI bases for grouping UMI families</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>min_consensus_percent</b>
      </td>
      <td style="text-align:left">Percentage of bases that must be in agreement at each position in the
        consensus read before masking that base as &quot;N&quot;</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>min_base_quality</b>
      </td>
      <td style="text-align:left">? used for masking as &quot;N&quot;?</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>key</b>
      </td>
      <td style="text-align:left">Keys to sort on for collapsing first-pass file</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>output_name_collapsed_gzip_R1</b>
      </td>
      <td style="text-align:left">Filename for collapsed read 1 fastq</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>output_name_collapsed_gzip_R2</b>
      </td>
      <td style="text-align:left">Filename for collapsed read 2 fastq</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>read_group_sequencing_center</b>
      </td>
      <td style="text-align:left">Organization that performed sequencing</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>read_group_sequencing_platform</b>
      </td>
      <td style="text-align:left">Sequencer type, e.g. Illumina HiSeq</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>read_group_sample_name</b>
      </td>
      <td style="text-align:left">Unique identifier for the current sample being run</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>read_group_platform_unit</b>
      </td>
      <td style="text-align:left">{flowcell_barcode}{lane_number}.{sample_barcode}</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>read_group_library</b>
      </td>
      <td style="text-align:left">DNA library identifier (Only used during MarkDuplicates step)</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>read_group_identifier</b>
      </td>
      <td style="text-align:left">Unique read group ID (Only used during BQSR step)</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>picard_output_file_name</b>
      </td>
      <td style="text-align:left">Filename to be given to final re-aligned bam (SHOULD BE A DEFAULT?)</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>aln_output_file_name</b>
      </td>
      <td style="text-align:left">Filename to be given to intermediate sam file (SHOULD BE A DEFAULT?)</td>
    </tr>
    <tr>
      <td style="text-align:left"><b>reference_fasta</b>
      </td>
      <td style="text-align:left">
        <p>Used in the follwing steps:</p>
        <ul>
          <li>Waltz PileupMetrics</li>
          <li>Marianas Collapsing</li>
          <li>Re-alignment of collapsed fastqs with BWA mem</li>
          <li>Indel Realignment with Abra</li>
          <li>Picard CollectAlignmentSummaryMetrics</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><b>min_map_quality</b>
      </td>
      <td style="text-align:left">? used for masking as &quot;N&quot;?</td>
    </tr>
  </tbody>
</table>



