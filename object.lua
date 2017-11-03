local _OBJ = {
	place = {
		["START"]	= { next1 = "A", },
		["A"]		= { isPlaced = false, tile = nil, next1 = "A1", next2 = "HZF1", },
		["A1"] 		= { isPlaced = false, tile = nil, next1 = "A2", },
		["A2"] 		= { isPlaced = false, tile = nil, next1 = "A3", },
		["A3"] 		= { isPlaced = false, tile = nil, next1 = "B", },
		["HZF1"]	= { isPlaced = false, tile = nil, next1 = "HZF2", },
		["HZF2"] 	= { isPlaced = false, tile = nil, next1 = "HZF3", },
		["HZF3"] 	= { isPlaced = false, tile = nil, next1 = "HZF4", },
		["HZF4"] 	= { isPlaced = false, tile = nil, next1 = "HZFA1", },
		["HZFA1"] 	= { isPlaced = false, tile = nil, next1 = "HZFA2", addAct = TODO, },
		["HZFA2"] 	= { isPlaced = false, tile = nil, next1 = "B", addAct = TODO, },
		["B"] 		= { isPlaced = false, tile = nil, next1 = "B1", next2 = "HZD1" },
		["B1"] 		= { isPlaced = false, tile = nil, next1 = "B2", bush = true, },
		["B2"] 		= { isPlaced = false, tile = nil, next1 = "B3", },
		["B3"] 		= { isPlaced = false, tile = nil, next1 = "C", },
		["HZD1"] 	= { isPlaced = false, tile = nil, next1 = "HZD2", },
		["HZD2"] 	= { isPlaced = false, tile = nil, next1 = "HZD3", },
		["HZD3"] 	= { isPlaced = false, tile = nil, next1 = "HZD4", },
		["HZD4"] 	= { isPlaced = false, tile = nil, next1 = "HZDB1", },
		["HZDB1"] 	= { isPlaced = false, tile = nil, next1 = "C", addAct = TODO, },
		["C"] 		= { isPlaced = false, tile = nil, next1 = "C1", next2 = "T", },
		["C1"] 		= { isPlaced = false, tile = nil, next1 = "C2", bush = true, },
		["C2"] 		= { isPlaced = false, tile = nil, next1 = "E", bush = true, },
		["T"] 		= { isPlaced = false, tile = nil, next1 = "D", next2 = "TP1", },
		["D"] 		= { isPlaced = false, tile = nil, next1 = "E", },
		["TP1"] 	= { isPlaced = false, tile = nil, next1 = "TP2", },
		["TP2"] 	= { isPlaced = false, tile = nil, next1 = "TP3", },
		["TP3"] 	= { isPlaced = false, tile = nil, next1 = "TP4", },
		["TP4"] 	= { isPlaced = false, tile = nil, next1 = "TP5", },
		["TP5"] 	= { isPlaced = false, tile = nil, next1 = "TP6", },
		["TP6"] 	= { isPlaced = false, tile = nil, next1 = "TPT1", },
		["TPT1"] 	= { isPlaced = false, tile = nil, next1 = "TPT2", addAct = true, },
		["TPT2"] 	= { isPlaced = false, tile = nil, next1 = "E", addAct = true, },
		["E"] 		= { isPlaced = false, tile = nil, next1 = "E1", next2 = "HZR1", },
		["E1"] 		= { isPlaced = false, tile = nil, next1 = "E2", bush = true, },
		["E2"] 		= { isPlaced = false, tile = nil, next1 = "F", bush = true, },
		["HZR1"] 	= { isPlaced = false, tile = nil, next1 = "HZR2", },
		["HZR2"] 	= { isPlaced = false, tile = nil, next1 = "HZR3", },
		["HZR3"] 	= { isPlaced = false, tile = nil, next1 = "HZR4", },
		["HZR4"] 	= { isPlaced = false, tile = nil, next1 = "HZRE1", },
		["HZRE1"] 	= { isPlaced = false, tile = nil, next1 = "HZRE2", addAct = TODO, },
		["HZRE2"] 	= { isPlaced = false, tile = nil, next1 = "F", addAct = TODO, },
		["F"] 		= { isPlaced = false, tile = nil, next1 = "F1", next2 = "F2", },
		["F1"] 		= { isPlaced = false, tile = nil, next1 = "G", bush = true, },
		["F2"] 		= { isPlaced = false, tile = nil, next1 = "G", },
		["G"] 		= { isPlaced = false, tile = nil, next1 = "G1", next2 = "G2", },
		["G1"] 		= { isPlaced = false, tile = nil, next1 = "KC", },
		["G2"] 		= { isPlaced = false, tile = nil, next1 = "KC", },
		["KC"]		= { },
	},
	building = {
		["A"] = { },
		["B"] = { },
		["C"] = { },
		["D"] = { },
		["E"] = { },
		["F"] = { },
		["G"] = { },
	},
	kc = {
	},
	tileStack = {
	},
	city = {
	}, 
	railroad = {
	}, 
	cattleMarket = {
	}, 
	jobMarket = {
	}, 
	objectiveCard = {
	}, 
	players = {
		player1 = {
			currentManLoc,
			currentEngLoc,
			money, 
			availableBuilding, 
			drawDeck, 
			hand, 
			discardPile, 
			removedCard, 
			objectiveCard,
			hz,
			tp,
			upgrade1 = { dollar = 1, d_d = 1, certUp = 0, engine = 0, remove = 0},
			upgrade2 = { move1 = 0, move2 = 0, hand = 0, cert1 = 0, cert2 = 0},
			employee = { cw = 1, cf = 1, eg = 1 },
			cert = 0,
		},
		computer = {
		},
	},
}

return _OBJ

--[[
	MAP_TILE_TYPE = {
		NOTHING = "NOTHING", 
		NEUTRAL_BUILDING = "NEUTRAL_BUILDING", 
		PRIVATE_BUILDING = "PRIVATE_BUILDING", 
		HAZARD = "HAZARD", 
		TEEPEE = "TEEPEE",
	}
--]]
