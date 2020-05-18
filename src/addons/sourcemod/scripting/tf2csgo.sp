#include <sourcemod>
#include <tf2_stocks>
#include <tf2>
#include "player.sp"

#pragma semicolon 1
#pragma newdecls required 

public Plugin myinfo = 
{
    name = "TF2CS:GO",
    author = "Peppizza",
    description = "A plugin to add cs:go buy mechanics to tf2",
    version = "0.1",
    url = "https://github.com/peppizza"
};

public void OnPluginStart()
{
    HookEvent("player_death", Event_PlayerDeath);
    PrintToServer("Plugin TF2CS:GO loaded");
}

public void Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
    int playerId = event.GetInt("userid");

    int playerClient = GetClientOfUserId(playerId);

    Player player = Player(playerClient);
    TFClassType playerClass = player.class;
    switch (playerClass)
    {
        case TFClass_Scout:
            PrintToChatAll("scout");
        case TFClass_Soldier:
            PrintToChatAll("soldier");
        case TFClass_Pyro:
            PrintToChatAll("pyro");
        case TFClass_DemoMan:
            PrintToChatAll("demoman");
        case TFClass_Heavy:
            PrintToChatAll("heavy");
        case TFClass_Engineer:
            PrintToChatAll("engineer");
        case TFClass_Medic:
            PrintToChatAll("medic");
        case TFClass_Sniper:
            PrintToChatAll("sniper");
        case TFClass_Spy:
            PrintToChatAll("spy");
        case TFClass_Unknown:
            PrintToChatAll("Unkown: could not get class");
        default:
            PrintToChatAll("default: could not get class");
    }
}
