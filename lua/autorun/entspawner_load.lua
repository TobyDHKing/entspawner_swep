ESS = ESS or {}

if SERVER then
    AddCSLuaFile("config_entspawner_swep.lua")
    AddCSLuaFile("entspawner_swep/cl_init.lua")
    include("config_entspawner_swep.lua")
    include("entspawner_swep/sv_init.lua")
end

if CLIENT then
    include("config_entspawner_swep.lua")
    include("entspawner_swep/cl_init.lua")
end
