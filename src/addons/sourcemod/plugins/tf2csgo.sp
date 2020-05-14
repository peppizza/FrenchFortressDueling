#include <sourcemod>

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
    PrintToServer("Hello world!");
}