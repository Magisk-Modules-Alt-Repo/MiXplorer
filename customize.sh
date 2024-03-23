#!/system/bin/sh

## MiXplorer Sharing
## https://drive.google.com/drive/folders/1BfeK39boriHy-9q76eXLLqbCwfV17-Gv

tmp=$MODPATH/tmp
list=$tmp/MiX-List
names=$tmp/MiX-Names

echo Installing... 
echo    - MiXplorer...
if [ "$API" -lt "30" ] ; then
  pm install --dont-kill "$tmp/v-29/MiXplorer_v6.64.3-API29_B23090720.apk" > /dev/null 2>&1
else
  pm install --dont-kill "$tmp/v-30/MiXplorer_v6.64.3_B23090710.apk" > /dev/null 2>&1
fi
sleep 1

if [ "$ARCH" = "arm" ] ; then
  # 32-bit
  echo    - MiXArchive...
  pm install --dont-kill "$tmp/arm/MiXArchive_B2308301-arm.apk" > /dev/null 2>&1
  sleep 1

  echo    - MiXCodecs...
  pm install --dont-kill "$tmp/arm/MiXCodecs_B2308302-arm.apk" > /dev/null 2>&1
  sleep 1

  echo    - MiXImage...
  pm install --dont-kill "$tmp/arm/MiXImage_B2308302-arm.apk" > /dev/null 2>&1
  sleep 1

  echo    - MiXPDF...
  pm install --dont-kill "$tmp/arm/MiXPDF_B2308301-arm.apk" > /dev/null 2>&1
else
  # 64-bit
  echo    - MiXArchive...
  pm install --dont-kill "$tmp/arm-64/MiXArchive_B2308302-arm64.apk" > /dev/null 2>&1
  sleep 1

  echo    - MiXCodecs...
  pm install --dont-kill "$tmp/arm-64/MiXCodecs_B2308303-arm64.apk" > /dev/null 2>&1
  sleep 1

  echo    - MiXImage...
  pm install --dont-kill "$tmp/arm-64/MiXImage_B2308303-arm64.apk" > /dev/null 2>&1
  sleep 1

  echo    - MiXPDF...
  pm install --dont-kill "$tmp/arm-64/MiXPDF_B2308302-arm64.apk" > /dev/null 2>&1
fi
sleep 1

echo    - MiXAutoTag...
pm install --dont-kill "$tmp/MiXAutoTag_1.0.apk" > /dev/null 2>&1
sleep 1

echo    - MiXMetadata...
pm install --dont-kill "$tmp/MiXMetadata.apk" > /dev/null 2>&1
sleep 1

echo    - MiXSMB...
pm install --dont-kill "$tmp/MiXSMB.apk" > /dev/null 2>&1
sleep 1

echo    - MiXTagger...
pm install --dont-kill "$tmp/MiXTagger_B2309031.apk" > /dev/null 2>&1
sleep 1

echo
echo Cleaning... 
rm -rf $MODPATH/tmp

echo > $MODPATH/remove
echo > $MODPATH/disabled
echo > /data/adb/modules/$MODID/remove
echo > /data/adb/modules/$MODID/disabled

echo
echo
echo
echo visit https://mixplorer.com/beta/ for latest beta
echo
echo chekout MiXplorer silver on playstore
echo to supporting MiXplorer dev-team 
echo
echo Enjoy!
echo
