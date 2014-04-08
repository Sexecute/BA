AddCSLuaFile( "cl_init.lua" )
--AddCSLuaFile( "cl_hud.lua" )
AddCSLuaFile( "shared.lua" )

include( 'shared.lua' )

loadoutBoard 	= { "weapon_pistol", "weapon_ar2" } -- placeholder
loadoutDefend 	= { "weapon_pistol", "weapon_smg1" }

function GM:PlayerInitialSpawn( ply ) -- Call menu
	ply:ConCommand( "team_menu" )
	
	
end

function GM:PlayerLoadout( ply )  -- Team base loadouts

	ply:StripWeapons()
	
	if ply:Team() == (2) then
		ply:Give( loadoutBoard[1] )
		ply:Give( loadoutBoard[2] )
	
	elseif ply:Team() == (3) then
		ply:Give( loadoutDefend[1] )
		ply:Give( loadoutDefend[2] )
	
	end
	

end


function GM:PlayerSetHandsModel( ply, ent ) -- Set hands based on model
	
	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

end


function team_1( ply )   -- Team set functions
	
	ply:SetTeam( 1 )

end

function team_2( ply )
	
	ply:SetTeam( 2 )
		ply:Spawn()
	
end

function team_3( ply )

	ply:SetTeam( 3 )
		ply:Spawn()
	
end
	
concommand.Add( "team_1", team_1 )
concommand.Add( "team_2", team_2 )
concommand.Add( "team_3", team_3 )
