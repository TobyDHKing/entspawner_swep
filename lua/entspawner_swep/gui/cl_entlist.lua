local PANEL = {}

ESS.CreateFont("Navbar.Lbl",ESS.Scale(20))

AccessorFunc(PANEL, "m_body", "Body")

function PANEL:Init()
    self.ents = {}
end

function PANEL:AddTab(key, tbl)
    local i = table.Count(self.ents) + 1
    self.ents[i] = self:Add("DLabel")
    local Lbl = self.ents[i]
    --local currentDelay = 
    Lbl:Dock(TOP)
    Lbl:DockMargin(ESS.Scale(5),ESS.Scale(5), 0, 0)
    Lbl:SetText(key)
    Lbl:SetFont("ESS.Navbar.Lbl")
    Lbl.id = i
    Lbl:SetContentAlignment(4)
    Lbl.Paint = nil
    Lbl:SizeToContentsY(ESS.Scale(10))
    Lbl:SetTextColor(ESS.CONFIG.Theme.amTextNavbarBtn)
    Lbl.timeleft = Lbl:Add("DLabel")
    Lbl.timeleft:Dock(RIGHT)
    Lbl.timeleft:DockMargin(ESS.Scale(5),ESS.Scale(5), 0, 0)
    Lbl.timeleft:SetText(tbl.currentDelay)
    Lbl.timeleft:SetFont("ESS.Navbar.Lbl")
    Lbl.timeleft:SetContentAlignment(4)
    Lbl.timeleft.Paint = nil
    Lbl.timeleft:SizeToContentsY(ESS.Scale(10))
    Lbl.timeleft:SetTextColor(ESS.CONFIG.Theme.amTextNavbarBtn)

    function Lbl:OnDepressed(self)
        print(2)
        self:SetActive(self.id)
    end
end

function PANEL:SetActive(id)
    if (self.active == id ) then return end
    local Lbl = self.ents[id]
    if (!IsValid(Lbl)) then return end

    local activeLbl = self.ents[self.active]
    if (IsValid(activeLbl)) then
        activeLbl.Paint = nil
        activeLbl:SetTextColor(ESS.CONFIG.Theme.amTextNavbarBtn)
        activeLbl.timeleft:SetTextColor(ESS.CONFIG.Theme.amTextNavbarBtn)
    end

    self.active = id


    Lbl:SetTextColor(ESS.CONFIG.Theme.amTextNavbarBtnActive)
    Lbl.timeleft:SetTextColor(ESS.CONFIG.Theme.amTextNavbarBtnActive)
    Lbl.Paint = function(pnl,w,h)
        surface.SetDrawColor(ESS.CONFIG.Theme.amNavbarBtnActive)
        surface.DrawRect(0, h-ESS.Scale(2), w - ESS.Scale(6), ESS.Scale(3))
    end
end

function PANEL:PerformLayout(w, h)

end

function PANEL:Paint(w, h)   
    draw.RoundedBoxEx(10,0, 0, w, h, ESS.CONFIG.Theme.amPrimary,false,false,true,true)
    surface.SetDrawColor(ESS.CONFIG.Theme.amSecondaryLine)
    surface.DrawRect(0, 0, w,ESS.Scale(1) )
end

vgui.Register("ESS.EntList", PANEL)

print("test")