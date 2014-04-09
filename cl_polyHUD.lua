include( 'shared.lua' )

local function poly_HUD()

	local scaleX = 5.5
	local scaleY = 5.8
	polyTable = { {}, {}, {}, {}, {}, {}, {}, {}, {} }
	
	polyTable[1]= {
		x = 0,
		y = ScrH() - 180,
		u = nil,
		v = nil 
	}
	polyTable[2]= {
		x = 20,
		y = ScrH() - 180,
		u = nil,
		v = nil 
	}
	polyTable[3]= {
		x = 40,
		y = ScrH() - 200,
		u = nil,
		v = nil 
	}
	polyTable[4]= {
		x = 120,
		y = ScrH() - 200,
		u = nil,
		v = nil 
	}
	polyTable[5]= {
		x = 135,
		y = ScrH() - 180,
		u = nil,
		v = nil 
	}
	polyTable[6]= {
		x = 175,
		y = ScrH() - 180,
		u = nil,
		v = nil 
	}
	polyTable[7]= {
		x = 205,
		y = ScrH() - 145,
		u = nil,
		v = nil 
	}
	polyTable[8]= {
		x = 205,
		y = ScrH() - 0,
		u = nil,
		v = nil 
	}
	polyTable[9]= {
		x = 0,
		y = ScrH() - 0,
		u = nil,
		v = nil 
	}	


end	
	
	
	surface.DrawPoly(