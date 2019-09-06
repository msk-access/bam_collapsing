#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `bam_collapsing` package."""

import os
import pytest
import filecmp
import subprocess
import shutil
import difflib

RESULT_FILE_NAME = [
    "chr14-intervals-without-duplicates.txt",
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
    "test_bam_collapsing.tar.gz",
]


def setup_module():
    """Test the workflow with cwltool"""
    print("\n### SETUP ###\n")
    cmd = [
        "cwltool",
        "--preserve-environment",
        "PATH",
        "bam_collapsing.cwl",
        "test_bam_collapsing/test_input/inputs.yaml"
    ]
    return_code = subprocess.check_call(cmd)
    assert return_code == 0


def teardown_module():
    print("\n### TEARDOWN ###\n")
    for outfile in RESULT_FILE_NAME:
        try:
            os.remove(outfile)
        except OSError as e:
            print("ERROR: cannot remove output file, %s: %s" % (outfile, e))
    try:
        shutil.rmtree("test_bam_collapsing")
    except OSError as e:
        print("ERROR: cannot remove folder test_bam_collapsing : %s" % (e))


def test_check_if_metrics_file_exists():
        print("\n### Check if files exists ###\n")
        assert os.path.exists("chr14_unfiltered_srt_abra_fm_alignment_metrics.txt")
        assert os.path.exists(
            "chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt"
        )
        assert os.path.exists(
            "chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt"
        )


def test_check_if_metrics_file_are_same():
        print(
            "\n### Check if files are the same from alignment metrics calculation ###\n"
        )
        compare_files(
            "chr14_unfiltered_srt_abra_fm_alignment_metrics.txt",
            "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm_alignment_metrics.txt",
        )
        compare_files(
            "chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt",
            "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt",
        )
        compare_files(
            "chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt",
            "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt",
        )


def compare_files(output, expected):
    lines_result = open(output, 'r').readlines()
    lines_expected = open(expected, 'r').readlines()
    print("\n".join(difflib.ndiff(lines_result, lines_expected)))
    assert filecmp.cmp(output, expected)
