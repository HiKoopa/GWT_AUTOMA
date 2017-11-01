local OBJ = require "object"

local print_personal_info = function()
end

local print_map = function()
end
--TODO
local function cal_next_placed(currentManLoc, placeInfo)
	local next1 = placeInfo[currentManLoc].next1
	if placeInfo[next1].isPlaced == false then
		cal_next_placed(next1, placeInfo)
		return
	else
		return next1
	end
end

local cal_available_move = function(currentManLoc, placeInfo)
	local availableMoveList	= { }

	table.insert(availableMoveList, "STOP")
	print(string.format("1) STOP"))

	table.insert(availableMoveList, cal_next_placed(currentManLoc, placeInfo))
	print(string.format("2) %s", cal_next_placed(currentManLoc, placeInfo)))

	if placeInfo[currentManLoc].next2 then
		table.insert(availableMoveList, cal_next_placed(currentManLoc, placeInfo))
		print(string.format("3) %s", cal_next_placed(currentManLoc, placeInfo)))
	end
	
	return availableMoveList
end

local function decide_move(stepLimit, currentManLoc, placeInfo)
	print(string.format("Your current location is %s, Left step : %d", currentManLoc, stepLimit))
	print()
	if currentManLoc == "KC" then return end

	if stepLimit <= 0 then return end

	local availableMoveList = cal_available_move(currentManLoc, placeInfo)
	io.write("Please enter where you want to go : ")
	nextManLoc = io.read("*number")

	if nextManLoc == 1 then return end

	if availableMoveList[nextManLoc] == nil then
		print(string.format("The value is not vaild. please re-enter"))
		decide_move(stepLimit, currentManLoc, placeInfo)
		return
	end

	decide_move(stepLimit - 1, availableMoveList[nextManLoc], placeInfo)

	io.write("\n")
end

local act_a = function(player, placeInfo)
	player.currentManLoc = "START"
	placeInfo["A"].isPlaced = true
	placeInfo["B"].isPlaced = true
	placeInfo["C"].isPlaced = true
	placeInfo["D"].isPlaced = true
	placeInfo["E"].isPlaced = true
	placeInfo["F"].isPlaced = true
	placeInfo["G"].isPlaced = true
	decide_move(3 + player.upgrade.move, player.currentManLoc, placeInfo)
end

local act_b = function()
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

local init_setting = function(OBJ)
end

init_setting()
start_player_turn(OBJ.players.player1, OBJ.place)
start_computer_turn()
