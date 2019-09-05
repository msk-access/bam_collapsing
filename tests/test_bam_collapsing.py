#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `bam_collapsing` package."""

import os
import pytest
import subprocess
import filecmp


def setup_module():
    """Test the workflow with cwltool"""

    cmd = [
        "cwltool",
        "--preserve-environment",
        "PATH",
        "bam_collapsing.cwl",
        "/test_bam_collapsing/test_input/inputs.yaml",
    ]
    assert subprocess.check_call(cmd) == 0


def test_check_metrics_file_exists():
    assert os.path.exists(
        "chr14_unfiltered_srt_abra_fm_alignment_metrics.txt"
    ), "File does not exist!"
    assert os.path.exists(
        "chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt"
    ), "File does not exist!"
    assert os.path.exists(
        "chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt"
    ), "File does not exist!"


def test_compare_metrics_file():
    assert filecmp(
        "chr14_unfiltered_srt_abra_fm_alignment_metrics.txt",
        "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm_alignment_metrics.txt",
    ), "File are not the same!"
    assert filecmp(
        "chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt",
        "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt",
    ), "File are not the same!"
    assert filecmp(
        "chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt",
        "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt",
    ), "File are not the same!"


pytest.main()
