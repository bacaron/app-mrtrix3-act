#!/bin/bash

##figure out amount of wall time we really need by parsing config.json with jq
if [ "$(jq .num_fibers -r config.json)" > 35000 ]; then
    walltime=12:00:00
else
    walltime=06:00:00
fi

echo "#PBS -l nodes=1:ppn=8,vmem=16gb"
echo "#PBS -l walltime=$walltime"