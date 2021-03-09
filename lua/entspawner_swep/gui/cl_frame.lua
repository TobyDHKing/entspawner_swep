local PANEL = {}

ESS.CreateFont("Header",ESS.Scale(20))
ESS.CreateFont("CloseBtn",ESS.Scale(26))

function PANEL:Init()
    self.header = self:Add("Panel")
    self.header:Dock(TOP)
    self.header.Paint = function(pnl,w,h)
        draw.RoundedBoxEx(10, 0, 0, w, h, ESS.Theme.amPrimary, true, true, false, false )
    end
    self.header.closeBtn = self.header:Add("DButton")
    self.header.closeBtn:Dock(RIGHT)
    self.header.closeBtn.DoClick = function(pnl)
        self:Remove()
    end
    self.header.closeBtn:SetFont("CWDM.CloseBtn")
    self.header.closeBtn:SetText("X")
    self.header.closeBtn.Paint = nil

    self.header.title = self.header:Add("DLabel")
    self.header.title:Dock(LEFT)
    self.header.title:SetFont("CWDM.Header")
    self.header.title:SetTextColor(ESS.Theme.amTextHead)
    self.header.title:SetTextInset(ESS.Scale(10),0)
    
end

function PANEL:SetTitle(text)
    self.header.title:SetText(text)
    self.header.title:SizeToContents()
end

function PANEL:PerformLayout(w, h)
    self.header:SetTall(ESS.Scale(35))
    self.header.closeBtn:SetWide(self.header:GetTall())
end

function PANEL:Paint(w, h)
    draw.RoundedBox(10,0,0,w,h,CWDM.CONFIG.INGAME.Theme.amBackground,true,true,true,true)
end

vgui.Register("ESS.Frame",PANEL,"EditablePanel")