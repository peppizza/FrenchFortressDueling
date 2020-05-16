#!/bin/sh
cd ..
cp src/addons/sourcemod/plugins/tf2csgo.sp sourcemod/scripting/
sourcemod/scripting/./compile.sh tf2csgo.sp
mkdir -p build/sourcemod/plugins
cp sourcemod/scripting/compiled/tf2csgo.smx build/sourcemod/plugins
