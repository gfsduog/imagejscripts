#!/bin/sh
for file in ../fives/CAM-RD\ -1463_D11\.lif\ -\ TileScan\ 4\.*\.Merged*\.tif; do
    out=${file#*CAM-RD -1463_D11\.lif - TileScan 4\.}
    out=${out%\.Merged*\.tif}
    echo $out
    magick convert "$file" -crop 5x1@ $out.%d.tif
done
