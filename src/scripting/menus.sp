public int DuelMenuHandler(Menu menu, MenuAction action, int param1, int param2)
{
    if (action == MenuAction_Select)
    {
        PrintToConsole(param1, "You selected item: %d", param2);
    }
}

public Action Duel_Menu(int client, int args)
{
    Panel panel = new Panel();
    panel.SetTitle("\"%s\" has challenged you to a duel!, do you accept?", challenger);
    panel.DrawItem("Yes");
    panel.DrawItem("No");

    panel.Send(client, DuelMenuHandler, 20);

    delete panel;

    return Plugin_Handled;
}