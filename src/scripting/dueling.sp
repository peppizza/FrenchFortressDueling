public void InitDueling()
{
    RegConsoleCmd("duel", OnCmdDuel);
}

public Action OnCmdDuel(int client, int args)
{
    if (!args)
    {
        ReplyToCommand(client, "Usage: /duel <name>");
        return Plugin_Handled;
    }
    int target = -1;
    char sPlayerName[MAX_NAME_LENGTH];
    GetCmdArgString(sPlayerName, sizeof(sPlayerName));

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

    char challengedName[MAX_NAME_LENGTH];
    char challengerName[MAX_NAME_LENGTH];
    challenged = new Player(target);
    challenger = new Player(client);
    GetClientName(client, challengerName, sizeof(challengerName));
    GetClientName(target, challengedName, sizeof(challengedName));
    Duel_Menu(target, 0, challengerName);
    CPrintToChatAll("{teamcolor}\"%s\" {default}has challenged {teamcolor}\"%s\" {default}to a duel!", challengerName, challengedName);

    return Plugin_Continue;
}