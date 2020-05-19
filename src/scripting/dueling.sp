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
            PrintToChat(client, "Could not find a player with the name: \"%s\"", sArgs[0]);
            return Plugin_Handled;
        }

        Player player = Player(client);
        player.duel = true;
    }
}