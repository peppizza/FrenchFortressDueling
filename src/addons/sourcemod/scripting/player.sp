methodmap Player __nullable__
{
    public Player(int client)
    {
        return view_as<Player>(client);
    }

    property int clientId
    {
        public get()
        {
            return view_as<int>(this);
        }
    }
    
    property TFClassType Class
    {
        public get()
        {
            TF2_GetPlayerClass(this.clientId);
        }
        public set(TFClassType value)
        {
            TF2_SetPlayerClass(this.clientId, value);
        }
    }
}