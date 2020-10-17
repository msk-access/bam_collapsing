#!/usr/bin/env bash

#GoogleDrive: https://drive.google.com/file/d/1m610MQurhJ2YH3njkHHOozrfw35ffgSu/view?usp=sharing
fileid='1m610MQurhJ2YH3njkHHOozrfw35ffgSu'

filename=test_fgbio_bam_collapsing.tar.gz

# Skip if already have test data
[[ -f $filename ]] && exit 0

curl -c ./cookie -s -k -L "https://drive.google.com/uc?export=download&id=$fileid" >/dev/null

curl -k -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=$(awk '/download/ {print $NF}' ./cookie)&id=${fileid}" -o ${filename}

tar --warning=no-unknown-keyword -xzvf $filename

rm $filename
