#pragma semicolon 1
#pragma newdecls required 

#include <sourcemod>
#include <sdkhooks>
#include <tf2_stocks>
#include <tf2>
#include "player.sp"
#include "respawn.sp"

public Plugin myinfo = 
{
    name = "FrenchFortressDuel",
    author = "Peppizza",
    description = "A plugin to add a unique dueling system to the french fortress tf2 server",
    version = "0.1",
    url = "https://github.com/peppizza"
};

public void OnPluginStart()
{
    char gameFolder[32];
    GetGameFolderName(gameFolder, sizeof(gameFolder));
    if (!StrEqual(gamefolder, "tf"))
    {
        SetFailState("Plugin can only be run in tf2");
    }
    InitRespawn();
}