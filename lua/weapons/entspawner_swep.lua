SWEP.PrintName = "Entity Spawner"
SWEP.Author = "Chris Wong"
SWEP.Instructions = "Left click to spawn entity, right click to change"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Weight = 1
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Slot = 2
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.ViewModel = "models/weapons/cstrike/c_pist_glock18.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.Primary.Automatic = false
local ShootSound = Sound( "Metal.SawbladeStick" )
local delay = 
local lastOccurance = -delay 


local spawnableEnts = {
    ["ent_ent"] = {
        delay = 200, -- amounts of seconds in delay
        currentDelay = 0,
    }, 

    ["ent2_ent2"] = {
        delay = 200, -- amounts of seconds in delay
        currentDelay = 0,
    }, 
}


function SWEP:PrimaryAttack()
    entToSpawn = SWEP:GetActiveEnt()
	local timeElapsed = CurTime() - lastOccurance
	if timeElapsed < delay then 
		print( "The SWEP is on cooldown and has not been triggered" ) 
	else
		self:GetOwner():LagCompensation(true)
		local trace = self:GetOwner():GetEyeTrace()
		self:GetOwner():LagCompensation(false)

		self:lastOccurance = CurTime()
		self:SpawnEnt(ent)
	end

end

function SWEP:SpawnEnt(ent) 

	self:EmitSound( ShootSound )

	if ( CLIENT ) then return end

	local ent = ents.Create( ent )

	ent:SetPos( self.Owner:EyePos() + (self.Owner:GetAimVector() * 16) )
	ent:SetAngles( self.Owner:EyeAngles() )
	ent:CPPISetOwner(self.Owner)

	local delay = 0
	ent:Spawn()

end

function SWEP:SecondaryAttack()
    

end

function SWEP:GetActiveEnt()


end

local function OpenEntMenu(swep)
    local scrw,scrh = ScrW(), ScrH()
    local isOpen = true
	local Frame = vgui.Create( "DFrame" )
	Frame:SetTitle( "Wong's Weapon Stripper" )
	Frame:SetSize( 700,500)
	Frame:Center()
	Frame:MakePopup()
	Frame.Paint = function(self, w, h)
		draw.RoundedBox( 8, 0, 0, w, h, Color(x,x,x,x) )
	end
	
	local List_Weapons = vgui.Create("DListView", Frame)
	local oldAddColumn = List_Weapons.AddColumn

	List_Weapons.AddColumn = function(self, column, material, position)

		local col = oldAddColumn(self, column, material, position)

		function List_Weapons:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color(x,x,x,x) )
		end
	   return col
	end

	List_Weapons:Dock( TOP )
	List_Weapons:SetSize(0, 380)
	List_Weapons:SetMultiSelect( false )
	List_Weapons:AddColumn( "Weapon" )
	List_Weapons:AddColumn( "Class" )
	List_Weapons:AddColumn("Primary Ammo")
	List_Weapons:AddColumn("Secondary Ammo")

	for k, v in pairs(spawnableEnts) do
		List_Weapons:AddLine(k,v[1],v[2])
	end

end