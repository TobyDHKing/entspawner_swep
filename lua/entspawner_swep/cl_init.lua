include("entspawner_swep/gui/cl_functions.lua")
include("entspawner_swep/gui/cl_frame.lua")
include("entspawner_swep/gui/cl_entlist.lua")
include("entspawner_swep/gui/cl_entmenu.lua")

net.Receive("ESS.SendCacheDelays",function( _ , ply)
    key = net.ReadString()
    curDelay = net.ReadFloat()
    ESS.CONFIG.SpawnableEnts[key].currentDelay = math.floor(curDelay+0.5)
end)