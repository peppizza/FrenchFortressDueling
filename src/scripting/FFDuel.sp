#pragma semicolon 1

#undef REQUIRE_PLUGIN
#define AUTOLOAD_EXTENSIONS
#define REQUIRE_EXTENSIONS

#include <morecolors>

#pragma newdecls required

#include "variables.sp"
#include <sourcemod>
#include <sdkhooks>
#include <tf2_stocks>
#include <tf2>
#include <sdktools>
#include <player>
#include "respawn.sp"
#include "dueling.sp"
#include "menus.sp"

#pragma newdecls required

public Plugin myinfo = 
{
    name = "FFDuel",
    author = "Peppizza",
    description = "A plugin to add a unique dueling system to the french fortress tf2 server",
    version = "0.1",
    url = "https://github.com/peppizza"
};

public void OnPluginStart()
{
    char gameFolder[32];
    GetGameFolderName(gameFolder, sizeof(gameFolder));
    if (!StrEqual(gameFolder, "tf"))
    {
        SetFailState("Plugin can only be run in tf2");
    }
    InitRespawn();
    InitDueling();
}