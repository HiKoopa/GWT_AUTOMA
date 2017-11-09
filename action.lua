random_pop = function(tbl)
	if #tbl == 0 then return false end
	return table.remove(tbl, math.random(1, #tbl))
end

local gain_cert1 = function(curCert, upgrade2)
	if (curCert < 3) or (curCert == 3 and upgrade2.cert1 == 1) then
		return curCert + 1
	elseif curCert == 4 and upgrade2.cert2 == 1 then
		return curCert + 2
	else
		print("Can't gain a certificate")
		return false
	end
end

local pay_cert1 = function(curCert)
	if curCert == 6 then
		return 4, 2
	end
	if curCert == 0 then
		print("Can't gain a certificate")
		return false
	end
	return curCert - 1, 1
end

local discard_choice = function(hand, num)
	if num < 0 or num > #hand then
		print("Invalid input")
		return false
	end
	table.remove(hand, num)
	return true
end

local get_pairs = function(hand)
	local card_count = { }
	local pair_ret = { }
	for i, v in ipairs(hand) do
		card_count[v] = card_count[v] + 1
	end
	for i, v in ipairs(card_count) do
		if v > 1 then
			insert.table(pair_ret, v)
		end
	end
end

local discard_pair = function(hand, cardType)
	local isFindCount = 0
	local found
	for i, v in ipairs(hand) do
		if v.type == cardType then
			isFindCount = isFindCount + 1
			if isFindCount == 2 then
				table.remove(hand, i)
				table.remove(hand, found)
			end
			found = i
		end
	end
	if isFindCount ~= 2 then
		print("Not found pair")
		return false
	end
	return true
end

local engine_move1 = function()
end
--------------------------------------------
local gain_dollar_1 = function(obj, currentPlayerNum)
	obj:gain_dollars(currentPlayerNum, 1)
end 
local gain_dollar_2 = function(obj, currentPlayerNum)
	obj:gain_dollars(currentPlayerNum, 2)
end 
local gain_dollar_4 = function(obj, currentPlayerNum)
	obj:gain_dollars(currentPlayerNum, 4)
end 
local draw_discard_cowboy = function(hand, drawDeck, cw)
end
local discard_white_gain_2_dollars = function(obj, currentPlayerNum)
	if obj:discard_1(currentPlayerNum, "white") == false then
		return false
	end
	obj:gain_dollars(currentPlayerNum, 2)
	return true
end
local discard_white_gain_4_dollars = function(obj, currentPlayerNum)
	if obj:discard_1(currentPlayerNum, "white") == false then
		return false
	end
	obj:gain_dollars(currentPlayerNum, 4)
	return true
end
local discard_green_gain_2_dollars = function(obj, currentPlayerNum)
	if obj:discard_1(currentPlayerNum, "green") == false then
		return false
	end
	obj:gain_dollars(currentPlayerNum, 2)
	return true
end
local discard_black_gain_2_dollars = function(obj, currentPlayerNum)
	if obj:discard_1(currentPlayerNum, "black") == false then
		return false
	end
	obj:gain_dollars(currentPlayerNum, 2)
	return true
end
local discard_black_gain_2_cert = function(hand, cert, upgrade2)
	if OBJ:discard_1(hand, "black") == false then
		return false
	end
	gain_cert1(cert, upgrade2)
	gain_cert1(cert, upgrade2)
	return true
end
local discard_yellow_gain_10_dollars = function(hand, money)
	if OBJ:discard_1(hand, "yellow") == false then
		return false
	end
	gain_dollars(money, 10)
	return true
end
local discard_pair_gain_3_dollars = function(hand, money)
	local cardPairs = get_pairs(hand)
	while true do
		for i, v in ipairs(cardPairs) do
			print(string.format("%d ) %s"), i, v)
		end
		print("Please enter what you want to discard : ")
		local input = io.read("*number")
		while cardPairs[input] == nil do
			print(string.format("The value is not valid. please re-enter"))
			input = io.read("*number")
		end
		if discard_pair(hand, cardPairs[io.read("*number")]) == true then
			break
		end
	end
	gain_dollars(money, 3)
	return true
end
local discard_pair_gain_4_dollars = function(hand, money)
	local cardPairs = get_pairs(hand)
	while true do
		for i, v in ipairs(cardPairs) do
			print(string.format("%d ) %s"), i, v)
		end
		print("Please enter what you want to discard : ")
		local input = io.read("*number")
		while cardPairs[input] == nil do
			print(string.format("The value is not valid. please re-enter"))
			input = io.read("*number")
		end
		if discard_pair(hand, cardPairs[io.read("*number")]) == true then
			break
		end
	end
	gain_dollars(money, 4)
	return true
end
local discard_grey_gain_2_dollars = function(hand, money)
	if discard_1(hand, "grey") == false then
		return false
	end
	gain_dollars(money, 2)
	return true
end
local discard_grey_gain_3_dollars = function(hand, money)
	if discard_1(hand, "grey") == false then
		return false
	end
	gain_dollars(money, 3)
	return true
end
local discard_grey_gain_4_dollars = function(hand, money)
	if discard_1(hand, "grey") == false then
		return false
	end
	gain_dollars(money, 4)
	return true
end
local discard_grey_gain_1_engine = function(hand)
	if discard_1(hand, "grey") == false then
		return false
	end
	--gain_dollars(money, 2)
	return true
end
local discard_grey_gain_1_cert = function(hand, upgrade2)
	if discard_1(hand, "grey") == false then
		return false
	end
	gain_cert1(cert, upgrade2)
	return true
end
local discard_grey_gain_1_cert_2_dollars = function(hand, money, upgrade2)
	if discard_1(hand, "grey") == false then
		return false
	end
	gain_cert1(cert, upgrade2)
	gain_dollars(money, 2)
	return true
end
local discard_grey_gain_2_cert = function(hand, upgrade2)
	if discard_1(hand, "grey") == false then
		return false
	end
	gain_cert1(cert, upgrade2)
	gain_cert1(cert, upgrade2)
	return true
end
local discard_obj_gain_1_cert = function()
	return true
end
local discard_any_gain_1_cert = function()
	return true
end
local discard_any_gain_3_dollars_1_obj = function()
	return true
end
local max_cert = function()
	return true
end
local hire = function()
	return true
end
local hire_minus_2 = function()
	return true
end
local hire_plus_2 = function()
	return true
end
local hire_plus_1 = function()
	return true
end
local build2 = function()
	return true
end
local build1 = function()
	return true
end
local gain_1_cert_or_1_obj = function()
	return true
end
local eng = function()
	return true
end
local pay_1_dollar_move_1_eng = function()
	return true
end
local pay_2_dollar_move_2_eng = function()
	return true
end
local eng3 = function()
	return true
end
local eng4 = function()
	return true
end
local eng_minus_1_gain_3_dollars = function()
	return true
end
local eng_minus_1_pay_1_dollar_gain_1_cert = function()
	return true
end
local eng_minus_2_pay_2_dollar_gain_2_cert = function()
	return true
end
local eng_minus_1_remove_1_card = function()
	return true
end
local eng_minus_2_remove_2_card = function()
	return true
end
local gain_dollars_per_eng = function()
	return true
end
local gain_dollars_per_bush = function()
	return true
end
local gain_engines_per_bush = function()
	return true
end
local cattle_market = function()
	return true
end
local remove_hazard7 = function()
	return true
end
local remove_hazard5 = function()
	return true
end
local remove_hazard = function()
	return true
end
local single_auxiliary = function()
	return true
end
local double_auxiliary = function()
	return true
end
local gain_2_cert_2_dollars_per_tp_pair = function()
	return true
end
local gain_1_tp = function()
	return true
end
local gain_1_tp_or_pay_2_dollar_move_2_eng = function()
	return true
end
local gain_1_tp_or_double_auxiliary = function()
	return true
end
local move1 = function()
	return true
end
local move2 = function()
	return true
end
local move3 = function()
	return true
end
local move4 = function()
	return true
end
local move5 = function()
	return true
end
local move3_no_fee = function()
	return true
end
local delivery = function()
	return true
end
local copy = function()
	return true
end
local upgrade_station = function()
	return true
end
local _ACT = {
	["1D"] = {text = "Gain 1 dollars", act = gain_dollar_1}, 
	["2D"] = {text = "Gain 2 dollars", act = gain_dollar_2}, 
	["4D"] = {text = "Gain 4 dollars", act = gain_dollar_4}, 
	["D_D"] = {text = "Draw 1 and discard 1", act = draw_discard_1}, 
	["D_D2"] = {text = "Draw 2 and discard 2", act = draw_discard_2}, 
	["D_D3"] = {text = "Draw 3 and discard 3", act = draw_discard_3}, 
	["D_D_CW"] = {text = "Draw and discard per cowboy", act = draw_discard_cowboy}, 
	["D_W_2D"] = {text = "Discard 1 white, gain 2 dollars", act = discard_white_gain_2_dollars}, 
	["D_W_4D"] = {text = "Discard 1 white, gain 4 dollars", act = discard_white_gain_4_dollars}, 
	["D_G_2D"] = {text = "Discard 1 green, gain 2 dollars", act = discard_green_gain_2_dollars}, 
	["D_B_2D"] = {text = "Discard 1 black, gain 2 dollars", act = discard_black_gain_2_dollars}, 
	["D_B_2C"] = {text = "Discard 1 black, gain 2 certificate", act = discard_black_gain_2_cert}, 
	["D_Y_10D"] = {text = "Discard 1 yellow, gain 10 dollars", act = discard_yellow_gain_10_dollars}, 
	["D_P_3D"] = {text = "Discard 1 pair, gain 3 dollars", act = discard_pair_gain_3_dollars}, 
	["D_P_4D"] = {text = "Discard 1 pair, gain 4 dollars", act = discard_pair_gain_4_dollars}, 
	["D_g_2D"] = {text = "Discard 1 grey, gain 2 dollars", act = discard_grey_gain_2_dollars}, 
	["D_g_3D"] = {text = "Discard 1 grey, gain 3 dollars", act = discard_grey_gain_3_dollars}, 
	["D_g_4D"] = {text = "Discard 1 grey, gain 4 dollars", act = discard_grey_gain_4_dollars}, 
	["D_g_1E"] = {text = "Discard 1 grey, engine moves 1 forward", act = discard_grey_gain_1_engine}, 
	["D_g_1C"] = {text = "Discard 1 grey, gain 1 certificate", act = discard_grey_gain_1_cert}, 
	["D_g_1C_2D"] = {text = "Discard 1 grey, gain 1 certificate, gain 2 dollars", act = discard_grey_gain_1_cert_2_dollars}, 
	["D_g_2C"] = {text = "Discard 1 grey, gain 2 certificate", act = discard_grey_gain_2_cert}, 
	["D_o_2C"] = {text = "Discard 1 objective card, gain 2 certificate", act = discard_obj_gain_1_cert}, 
	["D_A_1C"] = {text = "Discard any 1 card, gain 1 certificate", act = discard_any_gain_1_cert}, 
	["D_A_3D"] = {text = "Discard any 1 card, gain 3 dollars, gain 1 objective card to hand", act = discard_any_gain_3_dollars_1_obj}, 
	["MaxC"] = {text = "Max Certificate", act = max_cert}, 
	["H0"] = {text = "Hire one worker", act = hire}, 
	["H-2"] = {text = "Hire one worker with 2 costs more", act = hire_minus_2}, 
	["H2"] = {text = "Hire one worker with 2 costs less", act = hire_plus_2}, 
	["H1"] = {text = "Hire one worker with 1 cost less", act = hire_plus_1}, 
	["B2"] = {text = "Build with 2 dollars per craftsman", act = build2},
	["B1"] = {text = "Build with 1 dollar per craftsman", act = build1},
	["CorOb"] = {text = "Gain 1 certificate or gain 1 objective card", act = gain_1_cert_or_1_obj},
	["E"] = {text = "Engine moves forward per engineer", act = eng},
	["E1D-1"] = {text = "Pay 1 dollars, engine moves 1 forward", act = pay_1_dollar_move_1_eng},
	["E2D-2"] = {text = "Pay 2 dollars, engine moves 2 forward", act = pay_2_dollar_move_2_eng},
	["E3"] = {text = "Engine moves 3 forward", act = eng3},
	["E4"] = {text = "Engine moves 4 forward", act = eng4},
	["E-1_3D"] = {text = "Engine moves 1 backward, gain 3 dollars", act = eng_minus_1_gain_3_dollars},
	["E-1_D-1_1C"] = {text = "Engine moves 1 backward, pay 1 dollars, gain 1 certificate", act = eng_minus_1_pay_1_dollar_gain_1_cert},
	["E-2_D-2_2C"] = {text = "Engine moves 2 backward, pay 2 dollars, gain 2 certificate", act = eng_minus_2_pay_2_dollar_gain_2_cert},
	["E-1_R1"] = {text = "Engine moves 1 backward, remove 1 card", act = eng_minus_1_remove_1_card},
	["E-2_R2"] = {text = "Engine moves 2 backward, remove 2 card", act = eng_minus_2_remove_2_card},
	["ED"] = {text = "Gain dollars per engineer", act = gain_dollars_per_eng}, 
	["BD"] = {text = "Gain dollars per bush building", act = gain_dollars_per_bush},
	["BE"] = {text = "Engines moves forward per bush building", act = gain_engines_per_bush},
	["CM"] = {text = "Visit cattle market", act = cattle_market},
	["HZ7"] = {text = "Remove a hazard (costs 7 dollars)", act = remove_hazard7},
	["HZ5"] = {text = "Remove a hazard (costs 5 dollars)", act = remove_hazard5},
	["HZ"] = {text = "Remove a hazard", act = remove_hazard},
	["SA"] = {text = "Single auxiliary action", act = single_auxiliary},
	["DA"] = {text = "Double auxiliary action", act = double_auxiliary},
	["TPair"] = {text = "2 certificate and 2 dollars per teepee pair", act = gain_2_cert_2_dollars_per_tp_pair},
	["TP"] = {text = "Trade with the Indians (gain 1 Teepee)", act = gain_1_tp},
	["TPorE2D-2"] = {text = "Trade with the Indians (gain 1 Teepee) or Pay 2 dollars, engine moves 2 forawrd", act = gain_1_tp_or_pay_2_dollar_move_2_eng},
	["TPorDA"] = {text = "Trade with the Indians (gain 1 Teepee) or Double auxiliary action", act = gain_1_tp_or_double_auxiliary},
	["MV1"] = {text = "Move 1", act = move1},
	["MV2"] = {text = "Move 2", act = move2},
	["MV3"] = {text = "Move 3", act = move3},
	["MV4"] = {text = "Move 4", act = move4},
	["MV5"] = {text = "Move 5", act = move5},
	["MV3F"] = {text = "Move 3 with ignoring fee", act = move3_no_fee},
	["Del"] = {text = "Extra delivery", act = delivery},
	["Copy"] = {text = "Copy all action of one adjacent building", act = copy},
	["Up"] = {text = "Upgrade station behind engine", act = upgrade_station},
}
return _ACT
