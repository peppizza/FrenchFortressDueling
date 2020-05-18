#!/bin/sh
cd ..

if [ ! -d sourcemod ]
then
	wget https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6488-linux.tar.gz
	tar zxf sourcemod-1.10.0-git6488-linux.tar.gz
	mv addons/sourcemod .
	rm -r cfg
	rm -r addons
	rm sourcemod-1.10.0-git6488-linux.tar.gz
fi

cp src/addons/sourcemod/scripting/tf2csgo.sp sourcemod/scripting/
cp src/addons/sourcemod/scripting/player.sp sourcemod/scripting/
sourcemod/scripting/./compile.sh tf2csgo.sp
mkdir -p build/sourcemod/plugins
cp sourcemod/scripting/compiled/tf2csgo.smx build/sourcemod/plugins
