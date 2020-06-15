#!/bin/sh
cd ..

if [ ! -d sourcemod ]; then
	wget https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6488-linux.tar.gz
	tar zxf sourcemod-1.10.0-git6488-linux.tar.gz
	mv addons/sourcemod .
	rm -r cfg
	rm -r addons
	rm sourcemod-1.10.0-git6488-linux.tar.gz
fi

if [ ! -f sourcemod/scripting/include/morecolors.inc ]; then
	wget https://www.doctormckay.com/download/scripting/include/morecolors.inc
	mv morecolors.inc sourcemod/scripting/include
fi

rsync -avhu --progress src/scripting sourcemod/scripting
sourcemod/scripting/./compile.sh FFDuel.sp
mkdir -p build/sourcemod/plugins
cp sourcemod/scripting/compiled/FFDuel.smx build/sourcemod/plugins
