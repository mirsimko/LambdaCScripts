#!/bin/bash

treeList=${1:-lists/LambdaC.kPionKaonProton.picoHFtree/LambdaC.kPionKaonProton.picoHFtree_all.list}
picoList=${2:-picoLists/picoList_all.list}
diffedListName=diffedTreesAug15.list

touch temp.list

treeDirectory=/global/project/projectdirs/starprod/rnc/jthaeder/lambdaC/production/LambdaC.kPionKaonProton.picoHFtree
treeDirectory2=/global/project/projectdirs/star/pwg/starhf/simkomir/LambdaC/production/LambdaC.kPionKaonProton.picoHFtree
picoDirectory=/project/projectdirs/starprod/picodsts/Run14/AuAu/200GeV/physics2/P16id
treeSuffix=LambdaC.kPionKaonProton.picoHFtree.root
# treeSuffix=picoHFLambdaCMaker.root
picoSuffix=picoDst.root

echo rewriting trees from $treeList so that they match the picoDst format
iTree=0
nTrees=$( wc -l < $treeList )
while read -r tree; do
  # progress percentage
  if (( "$iTree" % 1000 == 0)); then
    percentage=$(( $iTree*100/$nTrees))
    echo -ne ... $percentage%'\r'
  fi
  iTree=$(( $iTree+1 ))

  echo $tree | sed 's:'$treeDirectory':'$picoDirectory':g' | sed 's:'$treeDirectory2':'$picoDirectory':g' | sed 's:'$treeSuffix':'$picoSuffix':g' >> temp.list
done < $treeList
echo ... 100%  ...done

echo diffing into $diffedListName
sort $picoList temp.list | uniq -u > $diffedListName

echo removing temp.list
rm temp.list
echo done
