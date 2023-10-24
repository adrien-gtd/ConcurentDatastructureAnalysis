#!/bin/bash

case $1 in
	"1" )	echo CoarseGrainedListIntSet
			OUTPUT="CoarseGrainedListBasedSet"
	;;
	"2" )	echo HandOverHandListIntSet
			OUTPUT="HandOverHandListIntSet"
	;;
	"3" )	echo LazyLinkedListSortedSet
			OUTPUT="LazyLinkedListSortedSet"
	;;
	*)		echo "Specify algorithm"
			exit 0
esac

echo "Who I am: $OUTPUT on `uname -n`"
echo "started on" `date`

for i in 1 4 6 8 10 12
do
	for j in 0 10 100
	do
		for k in 100 1000 10000
		do 
			echo "$i $j $k $((2*k))"
			java -cp bin contention.benchmark.Test -b linkedlists.lockbased.$OUTPUT -d 2000 -t $i -u $j -i $k -r $((2*k)) -W 0  | grep Throughput
		done
	done 
done
echo "done"
echo "finished on" `date`
echo "DONE \o/"

