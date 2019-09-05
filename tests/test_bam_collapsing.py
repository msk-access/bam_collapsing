#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `bam_collapsing` package."""

import os
import pytest
import filecmp
import subprocess
import shutil

RESULT_FILE_NAME = ["chr14-intervals-without-duplicates.txt",
                    "chr14-intervals.txt",
                    "chr14-pileup-without-duplicates.txt",
                    "chr14_R1_fastq.gz",
                    "chr14_R2_fastq.gz",
                    "chr14_unfiltered_srt_abra_fm-duplex.bai",
                    "chr14_unfiltered_srt_abra_fm-duplex.bam",
                    "chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt",
                    "chr14_unfiltered_srt_abra_fm-simplex.bai",
                    "chr14_unfiltered_srt_abra_fm-simplex.bam",
                    "chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt",
                    "chr14_unfiltered_srt_abra_fm.bai",
                    "chr14_unfiltered_srt_abra_fm.bam",
                    "chr14_unfiltered_srt_abra_fm_alignment_metrics.txt",
                    "collapsed_R1_.fastq",
                    "collapsed_R2_.fastq",
                    "goodls",
                    "second-pass-alt-alleles.txt",
                    "second-pass-insertions.txt",
                    "test_bam_collapsing.tar.gz"
                    ]


def setup_module():
    """Test the workflow with cwltool"""
    print('SETUP')

    cmd = [
        "cwltool",
        "--preserve-environment",
        "PATH",
        "bam_collapsing.cwl",
        "test_bam_collapsing/test_input/inputs.yaml",
    ]
    process = subprocess.run(cmd)
    return process

'''
def teardown_module():
    """
    Delete output files
    """
    print('TEARDOWN')    
    for outfile in RESULT_FILE_NAME:
        try:
            os.remove(outfile)
        except OSError as e:
            print("ERROR: cannot remove output file, %s: %s" % (outfile, e))
    try:
        shutil.rmtree(os.path.join("test_bam_collapsing","/"))
    except OSError as e:
        print("ERROR: cannot remove folder test_bam_collapsing : %s" % (e))

'''
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
