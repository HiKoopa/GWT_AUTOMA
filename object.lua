local ACT = require("action")

local _OBJ = {
	place = {
		["START"]	= { tile = false, next1 = "A", },
		["A"]		= { tile = nil, next1 = "A1", next2 = "HZF1", },
		["A1"] 		= { tile = nil, next1 = "A2", },
		["A2"] 		= { tile = nil, next1 = "A3", },
		["A3"] 		= { tile = nil, next1 = "B", },
		["HZF1"]	= { tile = nil, next1 = "HZF2", },
		["HZF2"] 	= { tile = nil, next1 = "HZF3", },
		["HZF3"] 	= { tile = nil, next1 = "HZF4", },
		["HZF4"] 	= { tile = nil, next1 = "HZFA1", },
		["HZFA1"] 	= { tile = nil, next1 = "HZFA2", addAct = TODO, },
		["HZFA2"] 	= { tile = nil, next1 = "B", addAct = TODO, },
		["B"] 		= { tile = nil, next1 = "B1", next2 = "HZD1" },
		["B1"] 		= { tile = nil, next1 = "B2", bush = true, },
		["B2"] 		= { tile = nil, next1 = "B3", },
		["B3"] 		= { tile = nil, next1 = "C", },
		["HZD1"] 	= { tile = nil, next1 = "HZD2", },
		["HZD2"] 	= { tile = nil, next1 = "HZD3", },
		["HZD3"] 	= { tile = nil, next1 = "HZD4", },
		["HZD4"] 	= { tile = nil, next1 = "HZDB1", },
		["HZDB1"] 	= { tile = nil, next1 = "C", addAct = TODO, },
		["C"] 		= { tile = nil, next1 = "C1", next2 = "T", },
		["C1"] 		= { tile = nil, next1 = "C2", bush = true, },
		["C2"] 		= { tile = nil, next1 = "E", bush = true, },
		["T"] 		= { tile = nil, next1 = "D", next2 = "TP1", },
		["D"] 		= { tile = nil, next1 = "E", },
		["TP1"] 	= { tile = nil, next1 = "TP2", },
		["TP2"] 	= { tile = nil, next1 = "TP3", },
		["TP3"] 	= { tile = nil, next1 = "TP4", },
		["TP4"] 	= { tile = nil, next1 = "TP5", },
		["TP5"] 	= { tile = nil, next1 = "TP6", },
		["TP6"] 	= { tile = nil, next1 = "TPT1", },
		["TPT1"] 	= { tile = nil, next1 = "TPT2", addAct = true, },
		["TPT2"] 	= { tile = nil, next1 = "E", addAct = true, },
		["E"] 		= { tile = nil, next1 = "E1", next2 = "HZR1", },
		["E1"] 		= { tile = nil, next1 = "E2", bush = true, },
		["E2"] 		= { tile = nil, next1 = "F", bush = true, },
		["HZR1"] 	= { tile = nil, next1 = "HZR2", },
		["HZR2"] 	= { tile = nil, next1 = "HZR3", },
		["HZR3"] 	= { tile = nil, next1 = "HZR4", },
		["HZR4"] 	= { tile = nil, next1 = "HZRE1", },
		["HZRE1"] 	= { tile = nil, next1 = "HZRE2", addAct = TODO, },
		["HZRE2"] 	= { tile = nil, next1 = "F", addAct = TODO, },
		["F"] 		= { tile = nil, next1 = "F1", next2 = "F2", },
		["F1"] 		= { tile = nil, next1 = "G", bush = true, },
		["F2"] 		= { tile = nil, next1 = "G", },
		["G"] 		= { tile = nil, next1 = "G1", next2 = "G2", },
		["G1"] 		= { tile = nil, next1 = "KC", },
		["G2"] 		= { tile = nil, next1 = "KC", },
		["KC"]		= { tile = false,},
	},
	neutral_building = {
		["A"] = { ACT["D_W_2D"], 	ACT["H0"], 	ACT["H-2"]},
		["B"] = { ACT["D_G_2D"], 	ACT["B2"],},
		["C"] = { ACT["CorOb"], 	ACT["E"],},
		["D"] = { ACT["TPorE2D-2"], ACT["DA"],},
		["E"] = { ACT["D_B_2D"], 	ACT["CM"],},
		["F"] = { ACT["D_P_4D"], 	ACT["HZ7"],},
		["G"] = { ACT["E"], 		ACT["DA"],},
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
	player = {
		human = {
			[1] = {
				currentManLoc = "START",
				currentEngLoc = 0,
				money = 0, 
				availableBuilding = {}, 
				drawDeck = {"grey", "grey", "grey", "grey", "grey", "white", "white", "white", "black", "black", "black", "green", "green", "green" }, 
				hand = {}, 
				discardPile = {}, 
				removedCard = {}, 
				objectiveCard = {},
				hz = {},
				tp = {},
				upgrade1 = { dollar = 1, d_d = 1, certUp = 0, engine = 0, remove = 0},
				upgrade2 = { move1 = 0, move2 = 0, hand = 0, cert1 = 0, cert2 = 0},
				worker = { cw = 1, cf = 1, eg = 1 },
				cert = 0,
			}
		},
		computer = {
			[1] = {
			}
		},
	}
}

function _OBJ:set_neutral_building()
	local index = {"A", "B", "C", "D", "E", "F", "G"}
	self.place["A"].tile = self.neutral_building[random_pop(index)]
	self.place["B"].tile = self.neutral_building[random_pop(index)]
	self.place["C"].tile = self.neutral_building[random_pop(index)]
	self.place["D"].tile = self.neutral_building[random_pop(index)]
	self.place["E"].tile = self.neutral_building[random_pop(index)]
	self.place["F"].tile = self.neutral_building[random_pop(index)]
	self.place["G"].tile = self.neutral_building[random_pop(index)]
end

function _OBJ:gain_dollars(playerNum, gain)
	self.player.human[playerNum].money = self.player.human[playerNum].money + gain
	--local money = self.player.human[playerNum].money
	--money = money + gain
	return true
end

function _OBJ:pay_dollars(playerNum, pay)
	local money = self.player.human[playerNum].money
	if money < pay then
		print("Not enough money")
		return false
	end

	money = money - pay
	return true
end

function _OBJ:set_current_loc(playerNum, loc)
	self.player.human[playerNum].currentManLoc = loc
	return true
end

function _OBJ:get_player_info(playerNum)
	return self.player.human[playerNum]
end

function _OBJ:draw_1(playerNum)
	local drawDeck = self.player.human[playerNum].drawDeck
	local hand = self.player.human[playerNum].hand
	if #drawDeck == 0 then shuffle() end
	
	local drawCard = random_pop(drawDeck)

	if drawCard then
		print("Draw : ", drawCard)
		table.insert(hand, drawCard)
	else
		print("There is no card to draw")
	end
end

function _OBJ:discard_1(playerNum, cardType)
	local hand = self.player.human[playerNum].hand
	local isFind = false
	for i, v in ipairs(hand) do
		if v == cardType then
			isFind = true
			table.remove(hand, i)
			break
		end
	end
	if isFind == false then
		print("Not found card type")
		return false
	end
	return true
end

function _OBJ:draw_discard_1(playerNum)
	local hand = self.player.human[playerNum].hand
	local drawDeck = self.player.human[playerNum].drawDeck

	draw_1(hand, drawDeck)

	while true do
		--print_hand()
		print("Please enter what you want to discard : ")
		if discard_choice(hand, io.read("number")) == true then
			break
		end
	end
	return true
end

function _OBJ:draw_discard_2(playerNum)
	local hand = self.player.human[playerNum].hand
	local drawDeck = self.player.human[playerNum].drawDeck

	draw_1(hand, drawDeck)
	draw_1(hand, drawDeck)

	while true do
		--print_hand()
		print("Please enter what you want to discard : ")
		if discard_choice(hand, io.read("number")) == true then
			break
		end
	end

	while true do
		--print_hand()
		print("Please enter what you want to discard : ")
		if discard_choice(hand, io.read("number")) == true then
			break
		end
	end
	return true
end

function _OBJ:draw_discard_3(playerNum)
	local hand = self.player.human[playerNum].hand
	local drawDeck = self.player.human[playerNum].drawDeck

	draw_1(hand, drawDeck)
	draw_1(hand, drawDeck)
	draw_1(hand, drawDeck)

	while true do
		--print_hand()
		print("Please enter what you want to discard : ")
		if discard_choice(hand, io.read("number")) == true then
			break
		end
	end

	while true do
		--print_hand()
		print("Please enter what you want to discard : ")
		if discard_choice(hand, io.read("number")) == true then
			break
		end
	end

	while true do
		--print_hand()
		print("Please enter what you want to discard : ")
		if discard_choice(hand, io.read("number")) == true then
			break
		end
	end
	return true
end

function _OBJ:gain_cert1(playerNum)
	local curCert = self.player.human[playerNum].cert
	local upgrade2 = self.player.human[playerNum].upgrade2
	if (curCert < 3) or (curCert == 3 and upgrade2.cert1 == 1) then
		self.player.human[playerNum].cert = curCert + 1
		return true
	elseif curCert == 4 and upgrade2.cert2 == 1 then
		self.player.human[playerNum].cert = curCert + 2
		return true
	else
		print("Can't gain a certificate")
		return false
	end
end
--[[
function _OBJ:pay_cert1(playerNum)
	local curCert = self.player.human[playerNum].cert
	if curCert == 6 then
		self.player.human[playerNum].cert = curCert - 2
		return 2
		return 4, 2
	end
	if curCert == 0 then
		print("Can't gain a certificate")
		return false
	end
	return curCert - 1, 1
end
--]]
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
