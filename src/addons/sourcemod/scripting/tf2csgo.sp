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
    RegConsoleCmd("sm_respawntime", Command_RespawnTime);
    RegConsoleCmd("sm_respawnplayer", Command_RespawnPlayer);
    PrintToServer("Plugin TF2CS:GO loaded");
}

ConVar g_cvRespawnWaveTime;
public Action Command_RespawnTime(int client, int args)
{
    if (args < 1)
    {
        PrintToConsole(client, "Usage: sm_respawntime <time>");
        return Plugin_Handled;
    }

    char value[32];
    int time;
    GetCmdArg(1, value, sizeof(value));
    time = StringToInt(value);
    if (time == 0)
    {
        PrintToConsole(client, "value \"%s\" is not an int", value);
        return Plugin_Handled;
    }
    g_cvRespawnWaveTime = FindConVar("mp_respawnwavetime");
    g_cvRespawnWaveTime.IntValue = time;
    for (int i = 1; i <= MaxClients; i++)
    {
        if (!IsClientConnected(i))
        {
            continue;
        }

        if (!IsPlayerAlive(i))
        {
            TF2_RespawnPlayer(i);
        }
    }
    return Plugin_Handled;
}

public Action Command_RespawnPlayer(int client, int args)
{
    if (args < 1)
    {
        PrintToConsole(client, "Usage: sm_respawnplayer <player>");
        return Plugin_Handled;
    }

    char name[32];
    int target = -1;
    GetCmdArg(1, name, sizeof(name));

    for (int i = 1; i <= MaxClients; i++)
    {
        if (!IsClientConnected(i))
        {
            continue;
        }

        char other[32];
        GetClientName(i, other, sizeof(other));

        if (StrEqual(name, other))
        {
            target = i;
        }
    }

    if (target == -1)
    {
        PrintToConsole(client, "Could not find any player with the name \"%s\"", name);
        return Plugin_Handled;
    }

    Player player = Player(client);
    if (player.alive)
    {
        PrintToConsole(client, "User: \"%s\" is already alive", name);
        return Plugin_Handled;
    }
    player.alive = true;
    return Plugin_Handled;
}