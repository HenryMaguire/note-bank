#!/bin/bash
DIR="/home/henry/Work/phd-work/note-bank"
mkdir -p $DIR
file_path="$DIR/monomer_notes.txt"
looking_for_path=true
while $looking_for_path; do
        echo "This session will save to $file_path. Press enter or type a new file path."
        read new_path
	echo [ -z $new_path]
        if [ $new_path == "" ]; then
		$looking_for_path=false
	else
		file_path=$new_path
	fi
done

#john=21
#jessie=9
#a=21; b=9
#if [[ $john == "$a" && $jessie == "9" ]]; then
#  echo "John is $john and Jessie is $jessie"
#fi
#if [[ $john == $a && $jessie == "9" ]]; then
#  echo "John is $john and Jessie is $jessie"
#fi

