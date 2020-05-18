methodmap Player
{
    public Player(int client)
    {
        return view_as<Player>(client);
    }
    
    property int client
    {
        public get()
        {
            return view_as<int>(this);
        }
    }

    property TFClassType class
    {
        public get()
        {
            return TF2_GetPlayerClass(this.client);
        }
        public set(TFClassType value)
        {
            TF2_SetPlayerClass(this.client, value);
        }
    }
}