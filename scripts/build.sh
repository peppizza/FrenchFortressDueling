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

cp src/scripting/FFDuel.sp sourcemod/scripting/
cp src/scripting/include/player.inc sourcemod/scripting/include
cp src/scripting/respawn.sp sourcemod/scripting/
cp src/scripting/variables.sp sourcemod/scripting/
cp src/scripting/dueling.sp sourcemod/scripting/
sourcemod/scripting/./compile.sh FFDuel.sp
mkdir -p build/sourcemod/plugins
cp sourcemod/scripting/compiled/FFDuel.smx build/sourcemod/plugins
