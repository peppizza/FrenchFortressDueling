methodmap Player __nullable__
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

    property bool alive
    {
        public get()
        {
            return IsPlayerAlive(this.client);
        }
    }

    property bool dueling
    {
        public get()
        {
            return isDueling[this.client];
        }
        public set(bool value)
        {
            isDueling[this.client] = value;
        }
    }

    public void KillPlayer()
    {
        ForcePlayerSuicide(this.client);
    }

    public void RespawnPlayer()
    {
        TF2_RespawnPlayer(this.client);
    }
}