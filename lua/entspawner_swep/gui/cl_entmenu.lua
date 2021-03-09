function ESS.openEntMenu()
    
	ESS.Frame = vgui.Create( "ESS.Frame" )
	ESS.Frame:SetTitle( "Entity Spawner" )
	ESS.Frame:SetSize( ESS.Scale(300),ESS.Scale(400))
	ESS.Frame:Center()
	ESS.Frame:MakePopup()
	
	local List_Ents = vgui.Create("ESS.EntList", ESS.Frame)
	List_Ents:Dock( TOP )
	List_Ents:SetSize(0, ESS.Scale(400))
	for k, v in pairs(ESS.CONFIG.SpawnableEnts) do
        print(k , v)
		List_Ents:AddTab(k,v)
	end
    List_Ents:SetActive(1)
end