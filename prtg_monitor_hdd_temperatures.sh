#!/bin/bash
# Version 1.0.3
# set -x 		#uncomment this for debugging

arrVar=()

echo -n "<?xml version=\"10.0\" encoding=\"UTF-8\" ?><prtg>"

for i in 0 1 2 3 4 5
do
	arrVar+=( "$(smartctl -a /dev/"ada$i" | grep Temp | awk '{print $10}')" )
	echo -n "<result><channel>ada$i</channel><value>${arrVar[$i]}</value><unit>°C</unit><LimitMode>1</LimitMode><LimitMaxWarning>55</LimitMaxWarning><LimitMaxError>60</LimitMaxError></result>"
done

echo "<text>HDD temperatures</text></prtg>"
exit
