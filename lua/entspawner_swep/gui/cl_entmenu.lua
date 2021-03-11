local PANEL = {}

function PANEL:Init()
	ply = LocalPlayer()
    self.EntList = self:Add("ESS.EntList")
    self.EntList:Dock(TOP)    
	for k, v in pairs(ESS.CONFIG.SpawnableEnts) do
		if v.jobs[team.GetName( ply:Team())] then 
			self.EntList:AddTab(k,v)
		end
	end
	self.EntList:SetActive(1)
    self.EntList:InvalidateLayout()
end

function PANEL:PerformLayout(w, h)
    self.BaseClass.PerformLayout(self, w ,h)
	self.EntList:SetTall(ESS.Scale(400))
end

vgui.Register("ESS.EntsMenu",PANEL,"ESS.Frame")


function ESS.openEntMenu()    
	ESS.Frame = vgui.Create( "ESS.EntsMenu" )
	ESS.Frame:SetSize( ESS.Scale(300),ESS.Scale(400))
	ESS.Frame:Center()
	ESS.Frame:MakePopup()
	ESS.Frame:SetTitle( "Entity Spawner" )
end