local OBJ = require "object"

local print_personal_info = function()
end

local print_map = function()
end

local function cal_next_placed(nextPlaceRet, currentManLoc, placeInfo, nextNum)
	local nextPlace 

	if nextNum == 1 then
		nextPlace = placeInfo[currentManLoc].next1
	else 
		if placeInfo[currentManLoc].next2 then
			nextPlace = placeInfo[currentManLoc].next2
		else
			nextPlace = placeInfo[currentManLoc].next1
		end
	end

	if placeInfo[nextPlace].isPlaced == false then
		cal_next_placed(nextPlaceRet, nextPlace, placeInfo, nextNum)
	else
		table.insert(nextPlaceRet, nextPlace)
	end
end

local cal_available_move = function(currentManLoc, placeInfo)
	local availableMoveList	= { }
	local nextPlaceRet = { }
	local nextPlace1
	local nextPlace2
	local nextPlaceC

	cal_next_placed(nextPlaceRet, currentManLoc, placeInfo, 1)
	nextPlace1 = table.remove(nextPlaceRet)

	table.insert(availableMoveList, "STOP")
	print(string.format("1) STOP"))

	table.insert(availableMoveList, nextPlace1)
	print(string.format("2) %s", nextPlace1))

	if currentManLoc == "C" and placeInfo["T"].isPlaced == false then
		cal_next_placed(nextPlaceRet, "T", placeInfo, 1)
		nextPlaceC = table.remove(nextPlaceRet)
		table.insert(availableMoveList, nextPlaceC)
		print(string.format("3) %s", nextPlaceC))

		cal_next_placed(nextPlaceRet, "T", placeInfo, 2)
		nextPlaceC = table.remove(nextPlaceRet)
		if nextPlace1 ~= nextPlaceC then
			table.insert(availableMoveList, nextPlaceC)
			print(string.format("4) %s", nextPlaceC))
		end

		return availableMoveList
	end
	
	if placeInfo[currentManLoc].next2 then
		cal_next_placed(nextPlaceRet, currentManLoc, placeInfo, 2)
		nextPlace2 = table.remove(nextPlaceRet)
		if nextPlace2 ~= nextPlace1 then
			table.insert(availableMoveList, nextPlace2)
			print(string.format("3) %s", nextPlace2))
		end
	end
	
	return availableMoveList
end

local function decide_move(isFirstStep, stepLimit, currentManLoc, placeInfo)
	print(string.format("Your current location is %s, Left step : %d", currentManLoc, stepLimit))
	print()
	if currentManLoc == "KC" then return end

	if stepLimit <= 0 then return end

	local availableMoveList = cal_available_move(currentManLoc, placeInfo)
	io.write("Please enter where you want to go : ")
	nextManLoc = io.read("*number")

	if nextManLoc == 1 then 
		if isFirstStep then
			print(string.format("You must move at least once. please re-enter"))
			decide_move(isFirstStep, stepLimit, currentManLoc, placeInfo)
		end
		return 
	end

	if availableMoveList[nextManLoc] == nil then
		print(string.format("The value is not vaild. please re-enter"))
		decide_move(isFirstStep, stepLimit, currentManLoc, placeInfo)
		return
	end

	decide_move(false, stepLimit - 1, availableMoveList[nextManLoc], placeInfo)
end

local act_a = function(player, placeInfo)
	player.currentManLoc = "START"
	placeInfo["A"].isPlaced = true
	placeInfo["HZF1"].isPlaced = true
	placeInfo["B"].isPlaced = true
	placeInfo["C"].isPlaced = true
	placeInfo["T"].isPlaced = true
	placeInfo["TP1"].isPlaced = true
	placeInfo["D"].isPlaced = true
	placeInfo["E"].isPlaced = true
	placeInfo["F"].isPlaced = true
	placeInfo["G"].isPlaced = true
	decide_move(true, 333 + player.upgrade.move, player.currentManLoc, placeInfo)
end

local cal_available_action = function(currentManLoc, placeInfo)
	
end

local function decide_act()
end

local act_b = function(currentManLoc, placeInfo)
	device_act()
	io.write("Please enter what you want to do : ")
	local action = io.read("*number")

	local availableActionList = cal_available_action(currentManLoc, placeInfo)

	if availableActionList[action] == nil then
	end
	
	decide_act(availableActionList)
end

local act_c = function()
end

local start_player_turn = function(player, placeInfo)
	print_personal_info()
	print_map()
	act_a(player, placeInfo)
	act_b(player)
	act_c(player)
end

local start_computer_turn = function()
end

local random_pop = function(tbl)
	return table.remove(tbl, math.random(1, #tbl))
end

local act_discard = function()
end
local act_hire = function()
end
local act_build = function()
end
local act_cert_objective = function()
end
local act_forward_engine = function()
end
local act_tp_2engine = function()
end
local act_double_ax = function()
end
local act_cattle_market = function()
end
local act_hazard = function()
end

local set_netural_building = function(neturalBuilding, place)
	table.insert(neturalBuilding["A"], act_discard)
	table.insert(neturalBuilding["A"], act_hire)
	table.insert(neturalBuilding["A"], act_hire)

	table.insert(neturalBuilding["B"], act_discard)
	table.insert(neturalBuilding["B"], act_build)

	table.insert(neturalBuilding["C"], act_cert_objective)
	table.insert(neturalBuilding["C"], act_forward_engine)

	table.insert(neturalBuilding["D"], act_tp_2engine)
	table.insert(neturalBuilding["D"], act_double_ax)

	table.insert(neturalBuilding["E"], act_discard)
	table.insert(neturalBuilding["E"], act_cattle_market)

	table.insert(neturalBuilding["F"], act_discard)
	table.insert(neturalBuilding["F"], act_hazard)

	table.insert(neturalBuilding["G"], act_forward_engine)
	table.insert(neturalBuilding["G"], act_double_ax)


end

local init_setting = function(OBJ)
--random station master tile
--random neutral building tile 
	set_netural_building(OBJ.neturalBuilding, OBJ.place)
--tile dummy setting
--pop1 * 7
--pop2 * ?
--pop1,2,3 set to kc
--cattle market setting
--random objective card
--building a? b?
--draw 4
--start objective card
--money
end

math.randomseed(os.time())
init_setting(OBJ)
start_player_turn(OBJ.players.player1, OBJ.place)
start_computer_turn()
