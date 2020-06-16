public int DuelMenuHandler(Menu menu, MenuAction action, int param1, int param2)
{
    if (action == MenuAction_Select)
    {
        PrintToConsole(param1, "You selected item: %d", param2);
        if (param2 == 1)
        {
            Player challenger = new Player(challengerId);
            Player challenged = new Player(challengedId);

            challenger.dueling = true;
            challenged.dueling = true;
        }
    }
}

public Action Duel_Menu(int client, int args, const char[] name)
{
    Panel panel = new Panel();
    char title[128];
    Format(title, sizeof(title), "\"%s\" has challenged you to a duel!, do you accept? (may be required to switch teams)", name);
    panel.SetTitle(title);
    panel.DrawItem("Yes");
    panel.DrawItem("No");

    panel.Send(client, DuelMenuHandler, 20);

    delete panel;

    return Plugin_Handled;
}