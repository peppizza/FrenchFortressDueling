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
        public set(bool value)
        {
            if (value)
            {
                TF2_RespawnPlayer(this.client);
            }
            else
            {
                ForcePlayerSuicide(this.client);
            }
        }
    }

    property bool duel
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

    property TFTeam team
    {
        public get()
        {
            return TF2_GetClientTeam(this.client);
        }
        public set(TFTeam team)
        {
            TF2_ChangeClientTeam(this.client, team);
        }
    }
}