public Action OnClientSayCommand(int client, const char[] command, const char[] sArgs)
{
    if (strcmp(sArgs, "duel", false) == 0)
    {
        int target = -1;

        for (int i = 1; i <= MaxClients; i++)
        {
            if (!IsClientConnected(i))
            {
                continue;
            }

            char other[32];
            GetClientName(i, other, sizeof(other));

            if (StrEqual(sArgs[0], other))
            {
                target = i;
            }
        }

        if (target == -1)
        {
            CPrintToChat(client, "{red}Could not find a player with the name: {default}\"%s\"", sArgs[0]);
            return Plugin_Handled;
        }

        if(GetClientTeam(client) == GetClientTeam(target)) {
            CPrintToChat(client, "{red}You cannot challenge someone on your own team.");
            return Plugin_Handled;
        }

        Player player = Player(client);
        Player challenged = Player(target);
        GetClientName(client, challenger, sizeof(challenger));
        Duel_Menu(client, 0)
        CPrintToChatAll("{teamcolor}\"%s\" {default}has challenged {teamcolor}\"%s\" {default}to a duel!", challenger);
    }

    return Plugin_Continue;
}