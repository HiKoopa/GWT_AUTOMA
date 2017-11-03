random_pop = function(tbl)
	if #tbl == 0 then return false end
	return table.remove(tbl, math.random(1, #tbl))
end

local gain_dollars = function(money, gain)
	return money + gain
end

local pay_dollars = function(money, pay)
	if money < pay then
		print("Not enough money")
		return false
	end

	return money - pay 
end

local gain_cert1 = function(curCert, upgrade2)
	if (curCert < 3) or (curCert == 3 and upgrade2.cert1 == 1) then
		return curCert + 1
	else if curCert == 4 and upgrade2.cert2 == 1 then
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

local draw_1 = function(hand, drawDeck)
	if #drawDeck == 0 then shuffle() end
	
	local drawCard = random_pop(drawDeck)

	if drawCard then
		print("Draw : ", drawCard)
		table.insert(hand, drawCard)
	else
		print("There is no card to draw")
	end
end

local discard_1 = function(hand, cardType)
	local isFind = false
	for i, v in ipairs(hand) do
		if v.type == cardType then
			isFind = true
			table.remove(hand, i)
		end
	end
	if isFind == false then
		print("Not found card type")
		return false
	end
	return true
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

local _ACT = {
	actions = {
		["1D"] = {text = "Gain 1 dollars", act = nil}, 
		["2D"] = {text = "Gain 2 dollars", act = nil}, 
		["4D"] = {text = "Gain 4 dollars", act = nil}, 
		["D_D"] = {text = "Draw 1 and discard 1", act = nil}, 
		["D_D2"] = {text = "Draw 2 and discard 2", act = nil}, 
		["D_D3"] = {text = "Draw 3 and discard 3", act = nil}, 
		["D_W_2D"] = {text = "Discard 1 white, gain 2 dollars", act = nil}, 
		["D_W_4D"] = {text = "Discard 1 white, gain 4 dollars", act = nil}, 
		["D_G_2D"] = {text = "Discard 1 green, gain 2 dollars", act = nil}, 
		["D_B_2D"] = {text = "Discard 1 black, gain 2 dollars", act = nil}, 
		["D_B_2C"] = {text = "Discard 1 black, gain 2 certificate", act = nil}, 
		["D_Y_10D"] = {text = "Discard 1 yellow, gain 10 dollars", act = nil}, 
		["D_P_3D"] = {text = "Discard 1 pair, gain 3 dollars", act = nil}, 
		["D_P_4D"] = {text = "Discard 1 pair, gain 4 dollars", act = nil}, 
		["D_g_2D"] = {text = "Discard 1 grey, gain 2 dollars", act = nil}, 
		["D_g_3D"] = {text = "Discard 1 grey, gain 3 dollars", act = nil}, 
		["D_g_4D"] = {text = "Discard 1 grey, gain 4 dollars", act = nil}, 
		["D_g_1E"] = {text = "Discard 1 grey, engine moves 1 forward", act = nil}, 
		["D_g_1C"] = {text = "Discard 1 grey, gain 1 certificate", act = nil}, 
		["D_g_1C_2D"] = {text = "Discard 1 grey, gain 1 certificate, gain 2 dollars", act = nil}, 
		["D_g_2C"] = {text = "Discard 1 grey, gain 2 certificate", act = nil}, 
		["D_o_2C"] = {text = "Discard 1 objective card, gain 2 certificate", act = nil}, 
		["D_D_CW"] = {text = "Draw and discard per cowboy", act = nil}, 
		["D_A_1C"] = {text = "Discard any 1 card, gain 1 certificate", act = nil}, 
		["D_A_3D"] = {text = "Discard any 1 card, gain 3 dollars, gain 1 objective card to hand", act = nil}, 
		["MaxC"] = {text = "Max Certificate", act = nil}, 
		["H0"] = {text = "Hire one worker", act = nil}, 
		["H-2"] = {text = "Hire one worker with 2 costs more", act = nil}, 
		["H2"] = {text = "Hire one worker with 2 costs less", act = nil}, 
		["H1"] = {text = "Hire one worker with 1 cost less", act = nil}, 
		["B2"] = {text = "Build with 2 dollars per craftsman", act = nil},
		["B1"] = {text = "Build with 1 dollar per craftsman", act = nil},
		["CorOb"] = {text = "Gain 1 certificate or gain 1 objective card", act = nil},
		["E"] = {text = "Engine moves forward per engineer", act = nil},
		["E1D-1"] = {text = "Pay 1 dollars, engine moves 1 forward", act = nil},
		["E2D-2"] = {text = "Pay 2 dollars, engine moves 2 forward", act = nil},
		["E3"] = {text = "Engine moves 3 forward", act = nil},
		["E4"] = {text = "Engine moves 4 forward", act = nil},
		["E-1_3D"] = {text = "Engine moves 1 backward, gain 3 dollars", act = nil},
		["E-1_D-1_1C"] = {text = "Engine moves 1 backward, pay 1 dollars, gain 1 certificate", act = nil},
		["E-2_D-2_2C"] = {text = "Engine moves 2 backward, pay 2 dollars, gain 2 certificate", act = nil},
		["E-1_R1"] = {text = "Engine moves 1 backward, remove 1 card", act = nil},
		["E-2_R2"] = {text = "Engine moves 2 backward, remove 2 card", act = nil},
		["ED"] = {text = "Gain dollars per engineer", act = nil}, 
		["CM"] = {text = "Visit cattle market", act = nil},
		["HZ7"] = {text = "Remove a hazard (costs 7 dollars)", act = nil},
		["HZ5"] = {text = "Remove a hazard (costs 5 dollars)", act = nil},
		["HZ"] = {text = "Remove a hazard", act = nil},
		["SA"] = {text = "Single auxiliary action", act = nil},
		["DA"] = {text = "Double auxiliary action", act = nil},
		["BD"] = {text = "Gain dollars per bush building", act = nil},
		["BE"] = {text = "Engines moves forward per bush building", act = nil},
		["TPair"] = {text = "2 certificate and 2 dollars per teepee pair", act = nil},
		["TP"] = {text = "Trade with the Indians (gain 1 Teepee)", act = nil},
		["TPorDA"] = {text = "Trade with the Indians (gain 1 Teepee) or Double auxiliary action", act = nil},
		["MV1"] = {text = "Move 1", act = nil},
		["MV2"] = {text = "Move 2", act = nil},
		["MV3"] = {text = "Move 3", act = nil},
		["MV4"] = {text = "Move 4", act = nil},
		["MV5"] = {text = "Move 5", act = nil},
		["MV3F"] = {text = "Move 3 with ignoring fee", act = nil},
		["Del"] = {text = "Extra delivery", act = nil},
		["Copy"] = {text = "Copy all action of one adjacent building", act = nil},
		["Up"] = {text = "Upgrade station behind engine", act = nil},
	},
	gain_dollar_1 = function(money)
		gain_dollars(money, 1)
		return true
	end, 
	gain_dollar_2 = function(money)
		gain_dollars(money, 2)
		return true
	end, 
	gain_dollar_4 = function(money)
		gain_dollars(money, 4)
		return true
	end, 
	draw_discard_1 = function(hand, drawDeck)
		draw_1(hand, drawDeck)

		while true do
			print_hand()
			print("Please enter what you want to discard : ")
			if discard_choice(hand, io.read("number")) == true then
				break
			end
		end
		return true
	end, 
	draw_discard_2 = function(hand, drawDeck)
		draw_1(hand, drawDeck)
		draw_1(hand, drawDeck)

		while true do
			print_hand()
			print("Please enter what you want to discard : ")
			if discard_choice(hand, io.read("number")) == true then
				break
			end
		end

		while true do
			print_hand()
			print("Please enter what you want to discard : ")
			if discard_choice(hand, io.read("number")) == true then
				break
			end
		end
		return true
	end, 
	draw_discard_3 = function(hand, drawDeck)
		draw_1(hand, drawDeck)
		draw_1(hand, drawDeck)
		draw_1(hand, drawDeck)

		while true do
			print_hand()
			print("Please enter what you want to discard : ")
			if discard_choice(hand, io.read("number")) == true then
				break
			end
		end

		while true do
			print_hand()
			print("Please enter what you want to discard : ")
			if discard_choice(hand, io.read("number")) == true then
				break
			end
		end

		while true do
			print_hand()
			print("Please enter what you want to discard : ")
			if discard_choice(hand, io.read("number")) == true then
				break
			end
		end
		return true
	end, 
	discard_white_gain_2_dollars = function(hand, money)
		if discard_1(hand, "white") == false then
			return false
		end
		gain_dollars(money, 2)
		return true
	end
	discard_white_gain_4_dollars = function(hand, money)
		if discard_1(hand, "white") == false then
			return false
		end
		gain_dollars(money, 4)
		return true
	end
	discard_green_gain_2_dollars = function(hand, money)
		if discard_1(hand, "green") == false then
			return false
		end
		gain_dollars(money, 2)
		return true
	end
	discard_black_gain_2_dollars = function(hand, money)
		if discard_1(hand, "black") == false then
			return false
		end
		gain_dollars(money, 2)
		return true
	end
	discard_black_gain_2_cert = function(hand, cert, upgrade2)
		if discard_1(hand, "black") == false then
			return false
		end
		gain_cert1(cert, upgrade2)
		gain_cert1(cert, upgrade2)
		return true
	end
	discard_yellow_gain_10_dollars = function(hand, money)
		if discard_1(hand, "yellow") == false then
			return false
		end
		gain_dollars(money, 10)
		return true
	end
	discard_pair_gain_3_dollars = function(hand, money)
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
	discard_pair_gain_4_dollars = function(hand, money)
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
	discard_grey_gain_2_dollars = function(hand, money)
		if discard_1(hand, "grey") == false then
			return false
		end
		gain_dollars(money, 2)
		return true
	end
	discard_grey_gain_3_dollars = function(hand, money)
		if discard_1(hand, "grey") == false then
			return false
		end
		gain_dollars(money, 3)
		return true
	end
	discard_grey_gain_4_dollars = function(hand, money)
		if discard_1(hand, "grey") == false then
			return false
		end
		gain_dollars(money, 4)
		return true
	end
	discard_grey_gain_2_dollars = function(hand, money)
		if discard_1(hand, "grey") == false then
			return false
		end
		gain_dollars(money, 2)
		return true
	end
	discard_grey_gain_2_dollars = function(hand, money)
		if discard_1(hand, "grey") == false then
			return false
		end
		gain_dollars(money, 2)
		return true
	end
	discard_grey_gain_2_dollars = function(hand, money)
		if discard_1(hand, "grey") == false then
			return false
		end
		gain_dollars(money, 2)
		return true
	end
	discard_grey_gain_2_dollars = function(hand, money)
		if discard_1(hand, "grey") == false then
			return false
		end
		gain_dollars(money, 2)
		return true
	end
}
return _ACT
