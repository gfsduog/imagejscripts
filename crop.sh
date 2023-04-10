#!/bin/sh
for file in ../ones/*.tif; do
    echo $file
    magick convert $file +repage -gravity center -crop 3000x3000+0+0 +repage ${file##*/}
done
