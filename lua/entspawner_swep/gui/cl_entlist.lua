local PANEL = {}

ESS.CreateFont("Navbar.Lbl",ESS.Scale(20))

function PANEL:Init()
    self.ents = {}
    self.scroll = self:Add("DScrollPanel")
    self.scroll:Dock(TOP)
    self.scroll:DockMargin(ESS.Scale(10),ESS.Scale(5), ESS.Scale(4), 0)
end

function PANEL:AddTab(key, tbl)
    local i = table.Count(self.ents) + 1

    self.ents[i] = self.scroll:Add("DLabel")
    local Lbl = self.ents[i]
    Lbl.id = i
    Lbl.key = key
    Lbl:Dock(TOP)
    Lbl:DockMargin(ESS.Scale(10),ESS.Scale(7), ESS.Scale(10), 0)
    Lbl:SetText(tbl.name or key)
    Lbl:SetFont("ESS.Navbar.Lbl")
    Lbl.Paint = function(pnl ,w ,h)
        surface.SetDrawColor(ESS.CONFIG.Theme.secondaryLine)
        surface.DrawRect(0,ESS.Scale(28), w,ESS.Scale(1) )
    end
    Lbl:SizeToContentsY(ESS.Scale(10))
    Lbl:SetTextColor(ESS.CONFIG.Theme.entText)
    Lbl:SetMouseInputEnabled( true )
    Lbl.DoClick = function(self)
        pnl = self:GetParent()
		pnl:GetParent():GetParent():SetActive(self.id)
	end
    Lbl.timeleft = Lbl:Add("DLabel")
    Lbl.timeleft:Dock(RIGHT)
    Lbl.timeleft:DockMargin(0,ESS.Scale(5), 0, 0)
    Lbl.timeleft:SetText(tbl.currentDelay)
    Lbl.timeleft:SetFont("ESS.Navbar.Lbl")
    Lbl.timeleft.Paint = nil
    Lbl.timeleft:SetTextColor(ESS.CONFIG.Theme.entText)
   
end

function PANEL:SetActive(id)
    if (self.active == id ) then return end
    local Lbl = self.ents[id]
    if (!IsValid(Lbl)) then return end
    
    local activeLbl = self.ents[self.active]
    if (IsValid(activeLbl)) then
        activeLbl.Paint = nil
        activeLbl:SetTextColor(ESS.CONFIG.Theme.entText)
        activeLbl.timeleft:SetTextColor(ESS.CONFIG.Theme.entText)
        activeLbl.Paint = function(pnl,w,h)
            surface.SetDrawColor(ESS.CONFIG.Theme.secondaryLine)
           surface.DrawRect(0,ESS.Scale(28), w,ESS.Scale(1) )
        end
    end

    self.active = id
    ESS.ActiveEnt = Lbl.key
    Lbl:SetTextColor(ESS.CONFIG.Theme.entTextActive)
    Lbl.timeleft:SetTextColor(ESS.CONFIG.Theme.entTextActive)
    Lbl.Paint = function(pnl,w,h)
        surface.SetDrawColor(ESS.CONFIG.Theme.entActive)
        surface.DrawRect(0, h-ESS.Scale(2), w - ESS.Scale(6), ESS.Scale(3))
    end
end

function PANEL:Paint(w, h)   
    draw.RoundedBoxEx(8 ,0, 0, w, ESS.Scale(366), ESS.CONFIG.Theme.secondary,false,false,true,true)
    surface.SetDrawColor(ESS.CONFIG.Theme.secondaryLine)
    surface.DrawRect(0, 0, w,ESS.Scale(1) )
end

function PANEL:PerformLayout(w,h)
    self.scroll:SetTall(ESS.Scale(360))
end


vgui.Register("ESS.EntList", PANEL)

