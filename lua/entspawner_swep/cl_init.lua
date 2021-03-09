local files, folders = file.Find("entspawner_swep/gui/*.lua", "LUA")
for k,v in ipairs(files) do
    print(v)
    include("entspawner_swep/gui/" .. v)
end
