---
description: >-
    Collapsing of reads a  aligned to the genome having same unique molecular
    identifier.
---

# BAM Collapsing

[![PyPI version](https://badge.fury.io/py/bam-collapsing.svg)](https://badge.fury.io/py/bam-collapsing) [![Build Status](https://travis-ci.org/msk-access/bam_collapsing.svg?branch=master)](https://travis-ci.org/msk-access/bam_collapsing) [![Updates](https://pyup.io/repos/github/msk-access/bam_collapsing/shield.svg)](https://pyup.io/repos/github/msk-access/bam_collapsing/) [![Python 3](https://pyup.io/repos/github/msk-access/bam_collapsing/python-3-shield.svg)](https://pyup.io/repos/github/msk-access/bam_collapsing/)

The bam collapsing workflow for MSK-ACCESS assay takes in a standard processed bam from standard processing workflow available [here](https://github.com/msk-access/uncollapsed_bam_generation).

-   Free software: Apache Software License 2.0
-   Documentation: [https://msk-access.gitbook.io/bam-collapsing](https://msk-access.gitbook.io/bam-collapsing)

![Workflow](/docs/.gitbook/assets/fgbio_bam_collapsing.png)

## Features

Given a uncollapsed Unique Molecular Index (UMI) tagged BAM file:

1. Group Reads using UMI and generate a BAM file
2. Call Duplex Consensus Reads from the BAM and generate an unmapped BAM file
3. Convert unmapped BAM to FASTQ and do standard BAM alignment.
4. Merge the unmapped BAM with the aligned BAM and this generated the collapsed BAM.
5. Generate Duplex and Simplex BAM files from the collapsed BAM.

## Credits

- CMO cfDNA Informatics Team
- This package was created with Cookiecutter _and the `audreyr/cookiecutter-pypackage`_ project template.
