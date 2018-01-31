#!/bin/bash
john=21
jessie=9
a=21; b=9
if [[ $john == "$a" && $jessie == "9" ]]; then
  echo "John is $john and Jessie is $jessie"
fi
if [[ $john == $a && $jessie == "9" ]]; then
  echo "John is $john and Jessie is $jessie"
fi

