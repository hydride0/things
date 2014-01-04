#/bin/bash

# Useful script to encode several flac files in .opus by keeping the same name

args=("@")
n=${#args[@]}

for (( i=0; i<$n; i++ )) do
  ffmpeg -i ${args[${i}]} -c:a libopus -b:a 150k "`echo ${args[${i}]} | sed 's/.\{5\}$//'`.opus"
done

