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
SWEP.Secondary.Automatic = false
local ShootSound = Sound( "Metal.SawbladeStick" )
local delay = 5



function SWEP:PrimaryAttack()
	if self.ActiveEnt == nil then return end
	local timeElapsed = CurTime() - lastOccurance
	if timeElapsed < delay then 
		print( "The SWEP is on cooldown and has not been triggered" ) 
	else

		self.lastOccurance = CurTime()
		self:SpawnEnt(self.ActiveEnt)
	end

end

function SWEP:SpawnEnt(ent) 

	self:EmitSound( ShootSound )
	net.Start("ESS.SpawnEnt")
	net.WriteString(ent)
	net.SendToServer()
end

function SWEP:SecondaryAttack()
	if SERVER then return end
	local timeElapsed = CurTime() - lastOccurance
	if timeElapsed < delay then 
		print( "The SWEP is on cooldown and has not been triggered" ) 
	else
		lastOccurance = CurTime()
		net.Start("ESS.CacheDelays")
		net.SendToServer()
		ESS.openEntMenu()
	end
end


