# MiXplorer

**An Android file explorer** they say, but...

**MiXplorer** is a full featured asset, it allows local management of pdf, images, archives, as well as clound connections to the most well-known repositories (box, drive, etc.), it is a music player, it also allows server engine as ftp and http (so you can share documents cross devices connected to the same network)... and more

all details on <a href="https://forum.xda-developers.com/t/app-2-2-mixplorer-v6-x-released-fully-featured-file-manager.1523691/post-23109280">**XDA**</a>,

all credits to <a href="https://mixplorer.com/">**MiXplorer.com**</a>


### why?
once upon a time, surfing **xda** forum, I discovered **MiXplorer** project.

Installed for testing purpose I became addicted to it in a blink, I think **MiXplorer** is a "must-have", I am still using it as my main file manager on all my devices and roms. 

this repo is aimed to thank you **MiXplorer** team, hoping to introdure **MiXplorer** to new users

### so why?

This package has born as personal-use purpose, just grouping all the features it provides, in order to simplify the installation/update process, making MiXplorer a full "all-in-one" in one shot...

you can start from this module to integrate you debloating settings, in order to make your android device best fitting your needs.

### and then, what?

the module contains:
- [MiXplorer](https://forum.xda-developers.com/t/app-2-2-mixplorer-v6-x-released-fully-featured-file-manager.1523691/post-23109280) v6.58.8
- [MiXplorerPdf](https://play.google.com/store/apps/details?id=com.mixplorer.addon.pdf) v1.12
- [MiXplorerSMB](https://www.apkmirror.com/apk/hootan-parsa/mix-smb-2-0-2-1/) v2.0/2.1
- [MiXplorerImage](https://play.google.com/store/apps/details?id=com.mixplorer.addon.image) v2.9
- [MiXplorerCodecs](https://play.google.com/store/apps/details?id=com.mixplorer.addon.codecs) v2.4
- [MiXplorerSigner](https://archive.is/fxzru) v1.2 ([description](https://forum.xda-developers.com/t/app-2-2-mixplorer-v6-x-released-fully-featured-file-manager.1523691/page-503#post-62471440))
- [MiXplorerTagger](https://play.google.com/store/apps/details?id=com.mixplorer.addon.tagger) v1.4
- [MiXplorerArchive](https://play.google.com/store/apps/details?id=com.mixplorer.addon.archive) v3.13
- [MiXplorerAutotag](https://forum.xda-developers.com/t/mixplorer-q-a-and-faq-user-manual.3308582/page-21#post-75366938) v1.0
- [MiXplorerMetadata](https://web.archive.org/web/20170326154127/https://play.google.com/store/apps/details?id=com.mixplorer.addon.metadata) v1.11

if you like the idea of having all featureds ready, you should just flash the zip via magisk.

if you prefer skipping one or more addons you can just open the zip file, navigate to /system/app/ folder, install **MiXplorer** main apk, plus the add-ons you prefer

or you should go to /data/adb/packages/MiXplorer/system/app/ and simply delete the undesired ones.

### setup

all roms come with embedded "Storage Access Framework" feature, tipically managed by #FilesPrebuilt , #DocumentsUI or #DocumentsUIGoogle (depending on your rom), used by other applications to navigate the file system

since MiXplorer does not implement it, during installation you are required to select (by volume keys) to persist #FilesPrebuilt , #DocumentsUI , #DocumentsUIGoogle

(I could not detect wich ones are available in your rom, so choise is your).


Enjoy!!

## Download
get latest build directly from <a href="https://github.com/Magisk-Modules-Alt-Repo/MiXplorer/releases/latest">here</a>
