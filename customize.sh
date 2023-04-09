#!/bin/bash

# External Tools
chmod -R 0755 $MODPATH/tools

chooseport_legacy() {
  # Keycheck binary by someone755 @Github, idea for code below by Zappo @xda-developers
  # Calling it first time detects previous input. Calling it second time will do what we want
  [ "$1" ] && local delay=$1 || local delay=10
  local error=false
  while true; do
    timeout 0 $MODPATH/tools/$ARCH32/keycheck
    timeout $delay $MODPATH/tools/$ARCH32/keycheck
    local sel=$?
    if [ $sel -eq 42 ]; then
      return 0
    elif [ $sel -eq 41 ]; then
      return 1
    elif $error; then
      abort "Volume key not detected!"
    else
      error=true
      echo "Volume key not detected. Try again"
    fi
  done
}

chooseport() {
  # Original idea by chainfire and ianmacd @xda-developers
  [ "$1" ] && local delay=$1 || local delay=10
  local error=false 
  while true; do
    local count=0
    while true; do
      timeout $delay /system/bin/getevent -lqc 1 2>&1 > $TMPDIR/events &
      sleep 0.5; count=$((count + 1))
      if (`grep -q 'KEY_VOLUMEUP *DOWN' $TMPDIR/events`); then
        return 0
      elif (`grep -q 'KEY_VOLUMEDOWN *DOWN' $TMPDIR/events`); then
        return 1
      fi
      [ $count -gt 6 ] && break
    done
    if $error; then
      # abort "Volume key not detected!"
      echo "Volume key not detected. Trying keycheck method"
      export chooseport=chooseport_legacy VKSEL=chooseport_legacy
      chooseport_legacy $delay
      return $?
    else
      error=true
      echo "Volume key not detected. Try again"
    fi
  done
}

# Keep old variable from previous versions of this
cnt=0
echo "installing MiXplorer..."
echo ""
echo " Volume UP (+) = YES"
echo " Volume DOWN (-) = NO"
echo ""
echo "- Storage Access Framework -"
echo ""
echo "  - do you prefer to persists FilesPrebuilt (aka AOSP File Manager)?" 
if chooseport 9999; then
  rm -r "$MODPATH/system/product";
fi
echo ""
echo "  - do you prefer to persist DocumentsUI (aka Vendor File Manager)?" 
if chooseport 9999; then
  $((cnt++))
  rm -r "$MODPATH/system/priv-app/DocumentsUI";
fi
echo ""
echo "  - do you prefer to persist DocumentsUIGoogle (aka Google File Manager)?" 
if chooseport 9999; then
  $((cnt++))
  rm -r "$MODPATH/system/priv-app/DocumentsUIGoogle";
fi
if [ $cnt -eq 2 ]; then
  rm -r "$MODPATH/system/priv-app";
fi
rm -r "$MODPATH/tools";
echo ""
echo "installation completed... ejoy!"


OVERLAY_IMAGE_EXTRA=0     # number of kb need to be added to overlay.img
OVERLAY_IMAGE_SHRINK=true # shrink overlay.img or not?

if [ -f "/data/adb/modules/magisk_overlayfs/util_functions.sh" ] && \
    /data/adb/modules/magisk_overlayfs/overlayfs_system --test; then
  ui_print "- Add support for overlayfs"
  . /data/adb/modules/magisk_overlayfs/util_functions.sh
  support_overlayfs
  rm -rf "$MODPATH"/system
fi
