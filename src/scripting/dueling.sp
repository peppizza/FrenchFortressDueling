public void InitDueling()
{
    RegConsoleCmd("duel", OnCmdDuel);
}

public Action OnCmdDuel(int client, int args)
{
    if (!args)
    {
        ReplyToCommand(client, "Usage: /duel \"<name>\"");
        ReplyToCommand(client, "%i", args);
        return Plugin_Handled;
    }
    int target = -1;
    char sPlayerName[MAX_NAME_LENGTH];
    GetCmdArgString(sPlayerName, sizeof(sPlayerName));
    PrintToChat(client, "%s", sPlayerName);

    for (int i = 1; i <= MaxClients; i++)
    {
        if (!IsClientConnected(i))
        {
            continue;
        }

        char other[32];
        GetClientName(i, other, sizeof(other));

        if (StrEqual(sPlayerName, other))
        {
            target = i;
        }
    }

    if (target == -1)
    {
        CPrintToChat(client, "{red}Could not find a player with the name: {default}\"%s\"", sPlayerName);
        return Plugin_Handled;
    }

    if(GetClientTeam(client) == GetClientTeam(target)) {
        CPrintToChat(client, "{red}You cannot challenge someone on your own team.");
        return Plugin_Handled;
    }

    Player player = Player(client);
    Player challenged = Player(target);
    GetClientName(client, challenger, sizeof(challenger));
    Duel_Menu(client, 0);
    CPrintToChatAll("{teamcolor}\"%s\" {default}has challenged {teamcolor}\"%s\" {default}to a duel!", challenger);

    return Plugin_Continue;
}