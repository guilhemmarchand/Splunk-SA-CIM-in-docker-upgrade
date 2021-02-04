#!/bin/bash
# set -x

cd /opt/splunk/etc/apps/Splunk_SA_CIM

for fullfile in $(ls local/data/models/*.json); do 
    filenamewithext=$(basename -- "$fullfile")
    extension="${filenamewithext##*.}"
    filename="${filenamewithext%.*}"    
    cp -p $fullfile local/data/models/${filename}_premigration.json
    cp -p default/data/models/${filenamewithext} local/data/models/
    echo "$filenamewithext done"
done

exit 0
