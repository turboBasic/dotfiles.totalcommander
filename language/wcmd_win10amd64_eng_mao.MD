# Extended English Menus for Total Commander 9.0 64bit under Windows 10 64bit (by petermad)

` ALL REFERENCES TO WCMD_WIN10AMD64_2_ENG.* FILES ARE DELETED TO SIMPLIFY READING (A.M.)

## Contents:

* wcmd_win10amd64_1_eng.mnu
* wcmd_win10amd64_1_eng.lng
* wcmd_win10amd64_1_eng.inc
* wcmd_win10amd64_1_eng.ini

* wcmd_win10amd64_eng\*.bar
* wcmd_win10amd64_eng.zip
* wcmd_win10amd64_eng.MD


`WCMD_WIN10AMD64_1_ENG.MNU` are alternative menus for TC that includes almost all the internal commands that it makes sense to use in
the menu.  Includes among others separate menu items for "Filter", "Navigate",
"Focus", "Lister", "Tabs", "FTP", "Folders" and "Misc.". Furthermore there is
a "Windows 10" menu item that holds most programs installed with Windows 10
and an extended "Help" menu item with links to Total Commander related web pages.

`WCMD_WIN10AMD64_1_ENG.MNU` has a single "View" menu which is common to both file
panels.  Variant with suffix "_2" has separate "Left" and "Right" menus (like
Norton Commander).

`WCMD_WIN10AMD64_1_ENG.LNG` are (almost) identical
to TC's internal dialog, and the use of these two files makes it easy to change
language and menu at the same time with just one click - simply just choose
"English with Extended Menu I for TC 9.0 64bit under Windows 10 64bit" in the language dialog.

`WCMD_WIN10AMD64_1_ENG.INC` are slightly improved versions of the original commands descriptions.

`WCMD_WIN10AMD64_1_ENG.INI` are user command files which are necessary for the user commands in the "Windows 10" and "Help" menu entries among others.

`WCMD_WIN10AMD64_ENG\*.bar` is a folder with a series of button bars with the same programs as the "Windows 10" menu item together with a button bar that shows all the internal commands that has an icon in the wcmicons.dll file.  You can switch between the button bars using the menu item "Windows 10".


`WCMD_WIN10AMD64_ENG.ZIP` is a self installing archive containing several Addons for Total Commander:

1: Extended Icon Set for TC (with 48x48 icons) (`WCMICON_WIN10AMD64.DLL`, `WCMICON_WIN10AMD64.INC`).
2: Old Style Help for TC (TOTALCMD.HLP, WINHLP32.EXE).
3: English Standalone Lister (lister.exe, lister.exe.manifest).
4: Extended File Comments for TC (descript.ion).
5: Folder Icon for TC (desktop.ini). Write protect TC's program folder to see the icon.
6: Official English language files (WCMD_ENG.LNG, WCMD_ENG.MNU and WCMD_ENG.INC).

You can install this package from the Menu: "Help" -> "Install Addons for Total Commander".  If the files already exists, you will be asked whether you want to overwrite them.


WCMD_WIN10AMD64_ENG.MD is this file.


Contact: petermad@madsenworld.dk, turbobasic@github.com


-------------------------------------------

About Plugins

As from version 7.55 a new item "Lister" is added to the Extended Menus.

From this item a separate version of Lister can be opened in forced view mode.
If the chosen mode is not possible with the selected file, then Total Commander will fallback to text view or binary text view.


The following plugin/addon programs are supported in the "Lister" menu item:

Imagine:            http://www.totalcmd.net/plugring/imagine.html | http://www.nyam.pe.kr/phpBB3/viewtopic.php?f=2&t=14
IrfanView:          http://www.irfanview.com/main_download_engl.htm
XnView:             http://www.xnview.com/en/download.html
HTMLView:           http://sites.google.com/site/htmlview/
Multimedia Player:  http://www.totalcmd.net/plugring/mmedia.html | http://physio-a.univ-tours.fr/tcplugins/MMEDIA.htm
ICLView:            http://www.totalcmd.net/plugring/iclview.html
Office2007:         http://www.totalcmd.net/plugring/office2007wlx_64.html
RedCell:            http://www.totalcmd.net/plugring/wlx_redcell.html
SWFView:            http://www.totalcmd.net/plugring/swfview.html
Syn2:               http://www.totalcmd.net/plugring/syn2.html | http://atorg.net.ru/temp/beta/syn2.rar | http://sepa.spb.ru/?syn
FileInfo:           http://www.totalcmd.net/plugring/fileinfo.html | http://physio-a.univ-tours.fr/tcplugins/FILEINFO.htm
DirSizeCalc Charts: http://totalcmd.net/plugring/dirsizecalc_charts.html


The menus are prepared for the following Lister plugins in case they should
come in 64bit versions - just remove the semicolons in front of the appropriate
lines in `WCMD_WIN10AMD64_1_ENG.MNU`:

SGViewer:        http://www.totalcmd.net/plugring/sgviewer.html
IMGView:         http://www.totalcmd.net/plugring/imgv.html
Office:          http://www.totalcmd.net/plugring/office.html
Listdoc:         http://www.totalcmd.net/plugring/wordfileviewer.html
Excellence:      http://www.totalcmd.net/plugring/xlsview.html | http://sites.google.com/site/ivansdump/excellence
IEView:          http://www.totalcmd.net/plugring/ieview.html 
FlashView:       http://www.totalcmd.net/plugring/flashview.html
SWF Lister Lite: http://www.totalcmd.net/plugring/swf_lister_lite.html
Font lister:     http://users.telenet.be/liontech/Downloads.htm | http://www.totalcmd.net/plugring/font.html
TTFViewer:       http://www.totalcmd.net/plugring/TTFviewer.html
SynPlus:         http://www.totalcmd.net/plugring/synplus.html
VisualDirSize:   http://www.totalcmd.net/plugring/visdirsize.html | http://members.multimania.co.uk/kajoj100/
