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
    "second-pass-alt-alleles.txt",
    "second-pass-insertions.txt",
    "pipeline_result.json",
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
            "--preserve-environment",
            "PATH",
            "bam_collapsing.cwl",
            "test_bam_collapsing/test_input/inputs.yaml",
        ]
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
    logging.info("### Check if files are the same from alignment metrics calculation ###")
    compare_picard_metrics_files(
        "chr14_unfiltered_srt_abra_fm_alignment_metrics.txt",
        "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm_alignment_metrics.txt",
    )
    compare_picard_metrics_files(
        "chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt",
        "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm-duplex_alignment_metrics.txt",
    )
    compare_picard_metrics_files(
        "chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt",
        "test_bam_collapsing/test_output/chr14_unfiltered_srt_abra_fm-simplex_alignment_metrics.txt",
    )


def test_output_json():
    """
    General tests for output json
    """
    logging.info("### Check if json file exists and check some basic stats ###")
    assert os.path.exists(OUTPUT_JSON_FILENAME)
    OUTPUT_JSON = json.loads(open(OUTPUT_JSON_FILENAME, "r").read())
    assert len(OUTPUT_JSON) == 18


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
