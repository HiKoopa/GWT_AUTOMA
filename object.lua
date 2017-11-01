local _OBJ = {
--[[
	MAP_TILE_TYPE = {
		NOTHING = "NOTHING", 
		NETURAL_BUILDING = "NETURAL_BUILDING", 
		PRIVATE_BUILDING = "PRIVATE_BUILDING", 
		HAZARD = "HAZARD", 
		TEEPEE = "TEEPEE",
	}
--]]
}

return _OBJ

--[[
object
	map = {
		place = {
				--initial
["START"]	= { next1 = "A", },
["A"]		= { next1 = "A1", next2 = "HZF1", },
["A1"] 		= { next1 = "A2", },
["A2"] 		= { next1 = "A3", },
["A3"] 		= { next1 = "B", },
["HZF1"]	= { next1 = "HZF2", },
["HZF2"] 	= { next1 = "HZF3", },
["HZF3"] 	= { next1 = "HZF4", },
["HZF4"] 	= { next1 = "HZFA1", },
["HZFA1"] 	= { next1 = "HZFA2", addAct = TODO, },
["HZFA2"] 	= { next1 = "B", addAct = TODO, },
["B"] 		= { next1 = "B1", next2 = "HZD1" },
["B1"] 		= { next1 = "B2", bush = true, },
["B2"] 		= { next1 = "B3", },
["B3"] 		= { next1 = "C", },
["HZD1"] 	= { next1 = "HZD2", },
["HZD2"] 	= { next1 = "HZD3", },
["HZD3"] 	= { next1 = "HZD4", },
["HZD4"] 	= { next1 = "HZDB1", },
["HZDB1"] 	= { next1 = "C", addAct = TODO, },
["C"] 		= { next1 = "C1", next2 = "T", },
["C1"] 		= { next1 = "C2", bush = true, },
["C2"] 		= { next1 = "E", bush = true, },
["T"] 		= { next1 = "D", next2 = "TP1", },
["D"] 		= { next1 = "E", },
["TP1"] 	= { next1 = "TP2", },
["TP2"] 	= { next1 = "TP3", },
["TP3"] 	= { next1 = "TP4", },
["TP4"] 	= { next1 = "TP5", },
["TP5"] 	= { next1 = "TP6", },
["TP6"] 	= { next1 = "TPT1", },
["TPT1"] 	= { next1 = "TPT2", addAct = true, },
["TPT2"] 	= { next1 = "E", addAct = true, },
["E"] 		= { next1 = "E1", next2 = "HZR1", },
["E1"] 		= { next1 = "E2", bush = true, },
["E2"] 		= { next1 = "F", bush = true, },
["HZR1"] 	= { next1 = "HZR2", },
["HZR2"] 	= { next1 = "HZR3", },
["HZR3"] 	= { next1 = "HZR4", },
["HZR4"] 	= { next1 = "HZRE1", },
["HZRE1"] 	= { next1 = "HZRE2", addAct = TODO, },
["HZRE2"] 	= { next1 = "F", addAct = TODO, },
["F"] 		= { next1 = "F1", next2 = "F2", },
["F1"] 		= { next1 = "G", bush = true, },
["F2"] 		= { next1 = "G", },
["G"] 		= { next1 = "G1", next2 = "G2", },
["G1"] 		= { next1 = "KC", },
["G2"] 		= { next1 = "KC", },
			}
		}
	}, 
	kc = {
	},
	tiles = {
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
			money, 
			availableBuilding, 
			drawDeck, 
			hand, 
			discardPile, 
			removedCard, 
			objectiveCard,
		},
		computer = {
		},
	},
--]]
