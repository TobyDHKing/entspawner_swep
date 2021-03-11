if ( CLIENT ) then return end
local files, folders = file.Find("entspawner_swep/gui/*.lua", "LUA")
for k,v in ipairs(files) do
    AddCSLuaFile("entspawner_swep/gui/" .. v)
end

ESS.ents = {}

util.AddNetworkString("ESS.SpawnEnt")
util.AddNetworkString("ESS.CacheDelays")
util.AddNetworkString("ESS.SendCacheDelays")


net.Receive("ESS.SpawnEnt",function( _ , ply)
    entString = net.ReadString()
    if not IsValid(ply) then return end
    if not istable(ESS.CONFIG.SpawnableEnts[entString]) then return end
    if timer.Exists("ESS.".. ply:SteamID().. entString) then 
        ply:PrintMessage( HUD_PRINTTALK, "This Entity is on timeout" )
    return end

    local steamID = ply:SteamID()
    
    if IsValid(ESS.ents[steamID]) then 
        ESS.ents[steamID]:Remove()
    end
    
    ESS.ents[steamID] = ents.Create( entString )

    ESS.ents[steamID]:SetPos( ply:EyePos() + (ply:GetAimVector() * 100) )
    ESS.ents[steamID]:SetAngles( ply:EyeAngles() )
    ESS.ents[steamID]:CPPISetOwner(ply)

    timer.Create("ESS.".. ply:SteamID() .. entString, ESS.CONFIG.SpawnableEnts[entString].delay, 1, function() return end)
    ESS.ents[steamID]:Spawn()
end)

net.Receive("ESS.CacheDelays",function( _ , ply)
    if not IsValid(ply) then return end
    for k,v in pairs(ESS.CONFIG.SpawnableEnts) do
        if timer.Exists("ESS.".. ply:SteamID().. k) then
            timeleft = timer.TimeLeft("ESS.".. ply:SteamID().. k)
            net.Start("ESS.SendCacheDelays")
            net.WriteString(k)
            net.WriteFloat(timeleft)
            net.Send(ply)
        else
            net.Start("ESS.SendCacheDelays")
            net.WriteString(k)
            net.WriteFloat(0)
            net.Send(ply)
        end
    end
end)