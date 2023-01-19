#!/bin/bash
echo "🔥 Welcome to my script"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "Do you want to update to version " $version "?"
echo "Enter 1 for Yes, 0 for No"
read versioncontinue
if [ $versioncontinue == 1 ]; then
    echo "OK"
    for filename in source/*      
        do
          echo $filename
          if [ "$filename" == "source/secretinfo.md" ]
            then
              echo "Not copying" $filename
            else
              echo "Copying" $filename
              cp $filename build/.
            fi
        done
  else
    echo "Please come back when you are ready"
fi
cd build/
echo "Build version $version contains:"
ls
cd ..