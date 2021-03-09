local files, folders = file.Find("entspawner_swep/gui/*.lua", "LUA")
for k,v in ipairs(files) do
    AddCSLuaFile("entspawner_swep/gui/" .. v)
end

