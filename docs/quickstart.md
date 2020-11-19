# Quickstart

## Step 1: Clone the workflow

```text
$ git clone --recursive https://github.com/msk-access/bam_collapsing.git
$ cd bam_collapsing
$ git submodule init
```

## Step 2: Install Toil and cwltool

```text
$ pip install toil[cwl]==4.2.0

```

Note: you may use any CWL executor available, provided it works with your batch system

## Step 3: Create an inputs file

As specified in:

{% page-ref page="inputs-description.md" %}

### Step 4 - Run the workflow with a CWL executor:

```text
$ cwltool bam_collapsing.cwl inputs.json
```

Or, to run the workflow on a HPC cluster using toil:

```text
$ toil-cwl-runner \
    --singularity \
    --jobStore my_jobStore \
    --batchSystem lsf \
    --workDir `pwd` \
    --outdir `pwd` \
    --logFile cwltoil.log \
    --writeLogs `pwd` \
    --logLevel DEBUG \
    --retryCount 2 \
    --disableCaching \
    --maxLogFileSize 20000000000 \
    --stats \
    bam_collapsing.cwl \
    inputs.yaml
```

{% hint style="info" %}
**Note:** To see help for the inputs for any cwl workflow you can use:

$ cwltool bam\_collapsing.cwl --help
{% endhint %}
