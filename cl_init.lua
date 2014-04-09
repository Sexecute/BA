include( 'shared.lua' )
include( 'cl_polyHUD.lua' )

function set_team() 	--Team picker Frame

	local frame = vgui.Create( "DFrame" )
	frame:Center()
	frame:SetSize( 600, 400 )
	frame:SetTitle( "Select a Team" )
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:ShowCloseButton( true )
	frame:MakePopup()
	
	team_1 = vgui.Create( "DButton", frame )
	team_1:SetPos( 30, ( frame:GetTall() - 95 ))
	team_1:SetSize( 300, 75 )
	team_1:SetText( "Spectators" )
	team_1.DoClick = function()
		RunConsoleCommand( "team_1" )
		frame:Close()
	end
	
	team_2 = vgui.Create( "DButton", frame )
	team_2:SetPos( 30, ( frame:GetTall()  - 180 ))
	team_2:SetSize( 300, 75 )
	team_2:SetText( "Boarding Party" )
	team_2.DoClick = function()
		RunConsoleCommand( "team_2" )
		frame:Close()
	end
		
	team_3 = vgui.Create( "DButton", frame )
	team_3:SetPos( 30, ( frame:GetTall() - 265 ))
	team_3:SetSize( 300, 75 )
	team_3:SetText( "Defending Crew" )
	team_3.DoClick = function()
		RunConsoleCommand( "team_3" )
		frame:Close()
	end
	
end


function GM:PostDrawViewModel( vm, ply, weapon ) --- Draw Hands
	
	if ( weapon.UseHands || !weapon:IsScripted() ) then
	
		local hands = LocalPlayer():GetHands()
		if ( IsValid( hands ) ) then hands:DrawModel() end
		
	end xc

end



local function draw_HUD()

	local client = LocalPlayer()
	if not client:Alive() then return end
	if (client:GetActiveWeapon() == NULL or client:GetActiveWeapon() == "Camera" ) then return end
			
	local scale = 5.5		--player settable
	local x = 0
	local y = ScrH() - (ScrH() / scale)
	local w = ScrW() / scale
	local h = ScrH() / scale
			
	draw.RoundedBoxEx( 16, x, y, w, h, Color( 0, 0, 0, 100 ), false, true, false, false) -- Hud box
	draw.RoundedBox( 8, x + ( w * 0.07), y + ( h * 0.58), w * 0.85, h * 0.15, Color( 191, 191, 191, 130 ) )  -- Health bar
		
	if client:Health() <= 92 then
		draw.RoundedBoxEx( 8, x + 30, y + 140, w * 0.85 * (client:Health() / 100), h * 0.2, Color(255, 0, 0, 250 ), true, false, true, false)  --current health bar
	else
		draw.RoundedBox( 8, x + 30, y + 140, w * 0.85 * (client:Health() / 100), h * 0.2, Color(255, 0, 0, 250 ))  --current health bar
	end
		
	draw.SimpleText( client:Health(), "DermaLarge", x + 50, y + 150, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )



end

	
hook.Add( "HUDPaint", "draw_HUD", draw_HUD)

local tohide = { -- This is a table where the keys are the HUD items to hide
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true
}
	
local function HUDShouldDraw(name) -- This is a local function because all functions should be local unless another file needs to run it
	if (tohide[name]) then     -- If the HUD name is a key in the table
		return false;      -- Return false.
	end
end

hook.Add("HUDShouldDraw", "Default HUD hider", HUDShouldDraw)





concommand.Add( "team_menu", set_team ) -- Adds the console command that sets the team



