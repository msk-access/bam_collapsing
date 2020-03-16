#!/usr/bin/env bash

#GoogleDrive: https://drive.google.com/open?id=1huZX5fk0PN1kmo9VEA2H1_9fvY3fEpbb
fileid='1huZX5fk0PN1kmo9VEA2H1_9fvY3fEpbb'

filename=test_bam_collapsing.tar.gz

# Skip if already have test data
[[ -f $filename ]] && exit 0

curl -c ./cookie -s -k -L "https://drive.google.com/uc?export=download&id=$fileid" >/dev/null

curl -k -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=$(awk '/download/ {print $NF}' ./cookie)&id=${fileid}" -o ${filename}

tar -xzvf $filename

#rm $filename
