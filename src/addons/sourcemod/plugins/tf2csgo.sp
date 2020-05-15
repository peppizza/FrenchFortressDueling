#include <sourcemod>
#include <sdktools>

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
    HookEvent("player_changeclass", Event_PlayerChangeClass);
    PrintToServer("Plugin TF2CS:GO loaded");
}

public void Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
    char critType[5]
    int victimId = event.GetInt("userid");
    int attackerId = event.GetInt("attacker");
    int crit = event.GetInt("crit_type");

    char Victimname[64];
    char Killername[64];
    int victim = GetClientOfUserId(victimId);
    int attacker = GetClientOfUserId(attackerId);
    GetClientName(victim, Victimname, sizeof(Victimname));
    GetClientName(attacker, Killername, sizeof(Killername));

    switch (crit)
    {
        case 1:
            critType = "Mini";
        case 2:
            critType = "Full";
        default:
            critType = "No";
    }

    PrintToChatAll("\"%s\" was killed by \"%s\" with %s crit(s)", Victimname, Killername, critType);
}

public void Event_PlayerChangeClass(Event event, const char[] name, bool dontBroadcast)
{
    char Person[64];
    int personId = event.GetInt("userid");
    int person = GetClientOfUserId(personId);
    GetClientName(person, Person, sizeof(Person));

    char className[9];
    int class = event.GetInt("class");

    switch (class)
    {
        case 1:
            className = "Scout";
        case 2:
            className = "Sniper";
        case 3:
            className = "Soldier";
        case 4:
            className = "Demoman";
        case 5:
            className = "Medic";
        case 6:
            className = "Heavy";
        case 7:
            className = "Pyro";
        case 8:
            className = "Spy";
        case 9:
            className = "Engineer";
    }

    PrintToChatAll("\"%s\" has changed class to \"%s\"", Person, className);
}