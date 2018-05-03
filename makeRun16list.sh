#!/bin/bash

now=`date +"%F-%T"`
stPhysicsStreamList=pico"$now".list
stSstStreamList=st_sstStream_pico"$now".list

echo Creating pico.list ...
get_file_list.pl -keys path,filename -cond production=P16ij,trgsetupname=AuAu_200_production_2016,filetype=daq_reco_picoDst,filename~st_physics,storage=local -limit 0 -delim / -distinct > "$stPhysicsStreamList"
echo Creating st_sstStream_pico.list ...
get_file_list.pl -keys path,filename -cond production=P16ij,trgsetupname=AuAu200_production2_2016,filetype=daq_reco_picoDst,filename~st_sst,storage=local,daynumber[]169-179 -limit 0 > "$stSstStreamList"

echo List created, adjusting for XRootD:
echo XRootDfying pico.list ...
./xRootDify.sh "$stPhysicsStreamList"
echo XRootDfying st_sstStream_pico.list ...
./xRootDify.sh "$stSstStreamList"
