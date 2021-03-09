if ( CLIENT ) then return end

local files, folders = file.Find("entspawner_swep/gui/*.lua", "LUA")
for k,v in ipairs(files) do
    AddCSLuaFile("entspawner_swep/gui/" .. v)
end

util.AddNetworkString("ESS.SpawnEnt")
util.AddNetworkString("ESS.CacheDelays")
util.AddNetworkString("ESS.SendCacheDelays")


net.Receive("ESS.SpawnEnt",function( _ , ply)
    entString = net.ReadString()
    if not IsValid(ply) then return end
    if not ESS.CONFIG.SpawnableEnts[entstring] then return end
    if timer.Exists("ESS.".. ply:SteamID().. entstring) then 
        ply:PrintMessage( HUD_PRINTTALK, "This Entity is on timeout" )
    return end

    local ent = ents.Create( entstring )

    ent:SetPos( ply:EyePos() + (ply:GetAimVector() * 16) )
    ent:SetAngles( ply:EyeAngles() )
    ent:CPPISetOwner(ply)

    timer.Create("ESS.".. ply:SteamID() .. entString, ESS.CONFIG.SpawnableEnts[entstring].delay, 1)
    ent:Spawn()
end)

net.Receive("ESS.CacheDelays",function( _ , ply)
    print(1)
    if not IsValid(ply) then return end
    for k,v in pairs(ESS.CONFIG.SpawnableEnts) do
        if timer.Exists("ESS.".. ply:SteamID().. k) then
            timeleft = timer.TimeLeft("ESS.".. ply:SteamID().. k)
            net.Start("ESS.SendCacheDelays")
            net.WriteString(k)
            net.WriteFloat(timeleft)
            net.Send(ply)
        end
    end
end)