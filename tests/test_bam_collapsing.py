#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `bam_collapsing` package."""

import os
import pytest
import subprocess


def test_cwltool_workflow():
    """Test the workflow with cwltool"""

    cmd = [
        "cwltool",
        "--preserve-environment",
        "PATH",
        "bam_collapsing.cwl",
        "test_inputs.yaml",
    ]
    rc = subprocess.check_call(cmd)
    print(rc)

    assert os.path.exists(
        "chr14_unfiltered_srt_abra_fm_alignment_metrics.txt"
    ), "File does not exist!"
    assert os.path.exists(
        "chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt"
    ), "File does not exist!"
    assert os.path.exists(
        "chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt"
    ), "File does not exist!"
    assert filecmp(
        "chr14_unfiltered_srt_abra_fm_alignment_metrics.txt",
        "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm_alignment_metrics.txt",
    ), "File are not the same!"
    assert filecmp(
        "chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt",
        "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm-duploex_alignment_metrics.txt",
    ), "File are not the same!"
    assert filecmp(
        "chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt",
        "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt",
    ), "File are not the same!"


pytest.main()
