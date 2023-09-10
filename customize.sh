#!/system/bin/sh

tmp=$MODPATH/tmp
list=$tmp/MiX-List
names=$tmp/MiX-Names

if [ "$API" -lt "30" ] ; then
  echo 1E3lVWnPdf3YaEuwlacgFWGyG7aTcstKK>$list
  echo 1E3lVWnPdf3YaEuwlacgFWGyG7aTcstKK=MiXplorer-api29>$names
else
  echo 1Z90pssJkf6puabWuKe0XoZXhDQ5dZ7CD>$list
  echo 1Z90pssJkf6puabWuKe0XoZXhDQ5dZ7CD=MiXplorer>$names
fi

if [ "$ARCH" = "arm" ] ; then
  # 32-bit
  wget=$MODPATH/tools/wget/armeabi-v7a/wget
  echo 1M2am9N9ym6yB6nKz697QMnldzSMWgdK->>$list
  echo 1M2am9N9ym6yB6nKz697QMnldzSMWgdK-=MiX.addon.PDF-arm>>$names

  echo 1A3DpEqgQ_zXJWIcHR17-QXUwK1Tgy5hc>>$list
  echo 1A3DpEqgQ_zXJWIcHR17-QXUwK1Tgy5hc=MiX.addon.Image-arm>>$names

  echo 1M1EgQca6_DR7KneUAdvCiFFs1HNz5BmB>>$list
  echo 1M1EgQca6_DR7KneUAdvCiFFs1HNz5BmB=MiX.addon.Codecs-arm>>$names

  echo 1Uefuy7X1-akcdkmxckxdM1PyO2nNUB-a>>$list
  echo 1Uefuy7X1-akcdkmxckxdM1PyO2nNUB-a=MiX.addon.Archive-arm>>$names
else
  # 64-bit
  wget=$MODPATH/tools/wget/arm64-v8a/wget
  echo 1bWjIUHWvyLPnJ9L3FDDg0tdJuxJoQC54>>$list
  echo 1bWjIUHWvyLPnJ9L3FDDg0tdJuxJoQC54=MiX.addon.PDF-arm64>>$names

  echo 1htfYSPjCTCzMerfdg6jdekiQSw4K7Nhb>>$list
  echo 1htfYSPjCTCzMerfdg6jdekiQSw4K7Nhb=MiX.addon.Image-arm64>>$names

  echo 12xga5i6BKa3L_Ina_CLOvmGmbiJPs1wQ>>$list
  echo 12xga5i6BKa3L_Ina_CLOvmGmbiJPs1wQ=MiX.addon.Codecs-arm64>>$names

  echo 1_zPA03z1kgUlTUjuR9ACn7yX9csMiHj5>>$list
  echo 1_zPA03z1kgUlTUjuR9ACn7yX9csMiHj5=MiX.addon.Archive-arm64>>$names
fi

# common
echo 1ipfIkKo1DuvXIYrkLQ8l-WmBFzaDzRnp>>$list
echo 1ipfIkKo1DuvXIYrkLQ8l-WmBFzaDzRnp=MiX.addon.AutoTag>>$names

echo 1QF60JtXjhif5ZOwfrYuwCtUS7NeeAL7I>>$list
echo 1QF60JtXjhif5ZOwfrYuwCtUS7NeeAL7I=MiX.addon.Tagger>>$names

chmod 777 $wget

echo
echo
echo Downloading... 
for i in $(cat $list)
do
  name=`grep ^$i= $names | cut -d "=" -f 2`
  echo    - $name...
  $wget -q --no-check-certificate -O "$tmp/$name.apk" "https://docs.google.com/uc?export=download&confirm=&id=$i"
done

sleep 1

echo
echo
echo Installing... 
for i in $(cat $list)
do
  name=`grep ^$i= $names | cut -d "=" -f 2`
  echo    - $name...
  pm install --dont-kill "$tmp/$name.apk" > /dev/null 2>&1
done
echo    - MiX.addon.Metadata...
pm install --dont-kill "$tmp/MiX.addon.Metadata.apk" > /dev/null 2>&1

echo    - MiX.addon.Signer...
pm install --dont-kill "$tmp/MiX.addon.Signer.apk" > /dev/null 2>&1

echo    - MiX.addon.SMB...
pm install --dont-kill "$tmp/MiX.addon.SMB.apk" > /dev/null 2>&1

sleep 1

echo
echo
echo Cleaning... 
for i in $(cat $list)
do
  name=`grep ^$i= $names | cut -d "=" -f 2`
  echo    - $name...
  rm -rf "$tmp/$name.apk" > /dev/null 2>&1
done
echo    - MiX.addon.Metadata...
rm -rf "$tmp/MiX.addon.Metadata.apk" > /dev/null 2>&1

echo    - MiX.addon.Signer...
rm -rf "$tmp/MiX.addon.Signer.apk" > /dev/null 2>&1

echo    - MiX.addon.SMB...
rm -rf "$tmp/MiX.addon.SMB.apk" > /dev/null 2>&1

rm -rf $MODPATH/tmp
rm -rf $MODPATH/tools

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
