#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `bam_collapsing` package."""

import os
import subprocess
import shutil
import difflib
import json
import logging
import coloredlogs

# Create Logger if verbose
loggeroutput = "pytest.log"
logging.basicConfig(
    filename=loggeroutput,
    filemode="w",
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    datefmt="%m/%d/%Y %I:%M:%S %p",
    level=logging.DEBUG,
)
logger = logging.getLogger(__name__)
coloredlogs.install(level="DEBUG")

RESULT_FILE_NAME = [
    "cookie",
    "collapsed_duplex.bai",
    "collapsed_duplex.bam",
    "collapsed_duplex_alignment_summary_metrics.txt",
    "collapsed_simplex-duplex.bai",
    "collapsed_simplex-duplex.bam",
    "collapsed_simplex.bai",
    "collapsed_simplex.bam",
    "collapsed_simplex_alignment_summary_metrics.txt",
    "group_reads_umi.hist.txt",
    "test_fx_group.bam",
    "test_fx_group.duplex_family_sizes.txt",
    "test_fx_group.duplex_umi_counts.txt",
    "test_fx_group.duplex_yield_metrics.txt",
    "test_fx_group.family_sizes.txt",
    "test_fx_group.umi_counts.txt",
    "test_fx_group_cons_R1.fastq.gz",
    "test_fx_group_cons_R2.fastq.gz",
    "pipeline_result.json",
    "pytest.log",
]

OUTPUT_JSON_FILENAME = "pipeline_result.json"


def setup_module():
    """
    Setup and test the workflow with cwltool
    """

    logging.info("### SETUP ###")
    with open(OUTPUT_JSON_FILENAME, "w") as json:

        cmd = [
            "cwltool",
#            "--preserve-environment",
#            "PATH",
            "bam_collapsing.cwl",
            "test_fgbio_bam_collapsing/inputs/inputs.json",
        ]
        logging.info("setup_module: cmd being executed, %s", " ".join(cmd))
        process = subprocess.Popen(
            cmd, stdin=subprocess.PIPE, stdout=json, close_fds=True
        )
        ret_code = process.wait()
        json.flush()
    return ret_code


def teardown_module():
    """
    Tear down the setup by deleteing all the files that are downloaded and produced.
    """
    logging.info("### TEARDOWN ###")
    for outfile in RESULT_FILE_NAME:
        try:
            os.remove(outfile)
        except OSError as e:
            logging.error("ERROR: cannot remove output file, %s: %s" % (outfile, e))
    try:
        shutil.rmtree("test_bam_collapsing")
    except OSError as e:
        logging.error("ERROR: cannot remove folder test_bam_collapsing : %s" % (e))


def test_check_if_metrics_file_are_same():
    """
    General tests for checking if the metrics file is the same
    """
    logging.info(
        "### Check if files are the same from alignment metrics calculation ###"
    )
"""
    compare_picard_metrics_files(
        "collapsed_duplex_alignment_summary_metrics.txt",
        "test_fgbio_bam_collapsing/outputs/collapsed_duplex_alignment_summary_metrics.txt",
    )
    compare_picard_metrics_files(
        "collapsed_simplex_alignment_summary_metrics.txt",
        "test_fgbio_bam_collapsing/outputs/collapsed_simplex_alignment_summary_metrics.txt",
    )
"""

def test_output_json():
    """
    General tests for output json
    """
    logging.info("### Check if json file exists and check some basic stats ###")
    assert os.path.exists(OUTPUT_JSON_FILENAME)
    output_json = json.loads(open(OUTPUT_JSON_FILENAME, "r").read())
    assert (
        output_json["fgbio_group_reads_by_umi_histogram"]["basename"]
        == "group_reads_umi.hist.txt"
    )
    assert (
        output_json["fgbio_collect_duplex_seq_metrics_umi_counts"]["basename"]
        == "test_fx_group.umi_counts.txt"
    )
    assert (
        output_json["fgbio_collect_duplex_seq_metrics_family_size"]["basename"]
        == "test_fx_group.family_sizes.txt"
    )
    assert (
        output_json["fgbio_collect_duplex_seq_metrics_duplex_yield_metrics"]["basename"]
        == "test_fx_group.duplex_yield_metrics.txt"
    )
    assert (
        output_json["fgbio_collect_duplex_seq_metrics_duplex_umi_counts_txt"]["basename"]
        == "test_fx_group.duplex_umi_counts.txt"
    )
    assert (
        output_json["fgbio_collect_duplex_seq_metrics_duplex_family_size"]["basename"]
        == "test_fx_group.duplex_family_sizes.txt"
    )
    assert (
        output_json["gatk_sam_to_fastq_second_end_fastq"]["basename"]
        == "test_fx_group_cons_R2.fastq.gz"
    )
    assert (
        output_json["gatk_sam_to_fastq_fastq"]["basename"]
        == "test_fx_group_cons_R1.fastq.gz"
    )
    assert (
        output_json["gatk_collect_alignment_summary_metrics_txt_simplex"]["basename"]
        == "collapsed_simplex_alignment_summary_metrics.txt"
    )
    assert (
        output_json["gatk_collect_alignment_summary_metrics_txt_duplex"]["basename"]
        == "collapsed_duplex_alignment_summary_metrics.txt"
    )
    assert (
        output_json["fgbio_postprocessing_simplex_bam"]["basename"]
        == "collapsed_simplex.bam"
    )
    assert (
        output_json["fgbio_filter_consensus_reads_duplex_bam"]["basename"]
        == "collapsed_duplex.bam"
    )


def compare_picard_metrics_files(output, expected):
    """
    Remove lines starting with `#` in picard metrics and use difflib to print differences if any and then assert
    """
    lines_result = open(output, "r").readlines()
    lines_result = list(filter(predicate, lines_result))
    lines_expected = open(expected, "r").readlines()
    lines_expected = list(filter(predicate, lines_expected))
    print("\n".join(difflib.ndiff(lines_result, lines_expected)))
    assert all([a == b for a, b in zip(lines_result, lines_expected)])


def predicate(line):
    """
    Remove lines starting with `#`
    """
    if "#" in line:
        return False
    return True
