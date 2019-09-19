---
description: >-
  Collapsing of reads a  aligned to the genome having same unique molecular
  identifier.
---

# BAM Collapsing

[![PyPI version](https://badge.fury.io/py/bam-collapsing.svg)](https://badge.fury.io/py/bam-collapsing) [![Build Status](https://travis-ci.org/msk-access/bam_collapsing.svg?branch=master)](https://travis-ci.org/msk-access/bam_collapsing) [![Updates](https://pyup.io/repos/github/msk-access/bam_collapsing/shield.svg)](https://pyup.io/repos/github/msk-access/bam_collapsing/) [![Python 3](https://pyup.io/repos/github/msk-access/bam_collapsing/python-3-shield.svg)](https://pyup.io/repos/github/msk-access/bam_collapsing/)

The bam collapsing workflow for MSK-ACCESS assay takes in a standard processed bam from standard processing workflow available [here](https://github.com/msk-access/standard_bam_processing).

* Free software: Apache Software License 2.0
* Documentation: [https://msk-access.gitbook.io/bam-collapsing](https://msk-access.gitbook.io/bam-collapsing)

## Features

Given a standard bam file:

1. Generate a pileup using Waltz.
2. Using the pileup with the bam file run Marianas bam collapsing, thus generating collapsed fastq.
3. Using the collapsed fastq align and indel realign the reads generating unfiltered bam files.
4. Using the unfiltered bam file with help of Marianas separate them into duplex and simplex bam.
5. Calculate alignment metrics for unfiltered, duplex and simplex bam file.

## Credits

This package was created with Cookiecutter _and the `audreyr/cookiecutter-pypackage`_ project template.

* Cookiecutter: [https://github.com/audreyr/cookiecutter](https://github.com/audreyr/cookiecutter)
* `audreyr/cookiecutter-pypackage`: [https://github.com/audreyr/cookiecutter-pypackage](https://github.com/audreyr/cookiecutter-pypackage)



