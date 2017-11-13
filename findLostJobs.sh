#/bin/bash

directory="$1"
listDirectory=${2:-"/global/homes/s/simkomir/LambdaC/jobs/$directory/list"}
touch temp.list	

# write job numbers from files into temp.list
for rootFile in $( ls $directory ); do
  echo $rootFile | sed 's/2017-05-19_04-10_//' | sed 's/.picoMEtree.root//'>> temp.list
done

# write a sequence of numbers from zero to number of lists - 1
seq 0 $( expr $( ls $listDirectory | wc -l ) - 1 ) >> temp.list

# find unique numbers (i.e. lists that don't have a root file) end write them into lostJobs.list
echo Writing to lostJobs.list
sort temp.list | uniq -u > lostJobs.list

rm temp.list
