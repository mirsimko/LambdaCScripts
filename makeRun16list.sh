#!/bin/bash

echo Creating pico.list ...
get_file_list.pl -keys path,filename -cond production=P16ij,trgsetupname=AuAu_200_production_2016,filetype=daq_reco_picoDst,filename~st_physics,storage=local -limit 0 -delim / -distinct > pico.list

echo List created, adjusting for XRootD ...
./xRootDify.sh pico.list
