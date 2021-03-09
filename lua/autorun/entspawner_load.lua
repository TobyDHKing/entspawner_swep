ESS = ESS or {}

if SERVER then
    AddCSLuaFile("entspawner_swep/config_entspawner_swep.lua")
    AddCSLuaFile("entspawner_swep/cl_init.lua")
    include("entspawner_swep/config_entspawner_swep.lua")
    include("entspawner_swep/sv_init.lua")
end

if CLIENT then
    include("entspawner_swep/config_entspawner_swep.lua")
    include("entspawner_swep/cl_init.lua")
end
