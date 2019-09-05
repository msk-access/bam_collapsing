#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `bam_collapsing` package."""

import os
import pytest
import filecmp


def test_confirm_cwltool_run(cwltool_setup):
    assert cwltool_setup.returncode == 0


def test_check_metrics_file_exists(cwltool_setup):
    assert os.path.exists(
        "chr14_unfiltered_srt_abra_fm_alignment_metrics.txt"
    ), "File does not exist!"
    assert os.path.exists(
        "chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt"
    ), "File does not exist!"
    assert os.path.exists(
        "chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt"
    ), "File does not exist!"


def test_compare_metrics_file(cwltool_setup):
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
