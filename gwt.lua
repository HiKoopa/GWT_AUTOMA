local OBJ = require "object"
local ACT = require "action"

local print_hand = function(obj, playerNum)
	for i, v in ipairs(obj.player.human[playerNum].hand) do
		print(v)
	end
end

local print_personal_info = function(obj, playerNum)
	print_hand(obj, 1)
	print("Money = ", obj.player.human[playerNum].money)
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

	if placeInfo[nextPlace].tile == nil then
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

	if currentManLoc == "C" and placeInfo["T"].tile == nil then
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

local get_max_move = function(upgrade2)
	return 3 + upgrade2.move1 + upgrade2.move2
end

local phase_a = function(obj, playerNum)
	local leftStep = get_max_move(obj.player.human[playerNum].upgrade2)
	local origStep = leftStep
	local currentManLoc = obj.player.human[playerNum].currentManLoc
	local isRetry = false
	local origCurrentManLoc = currentManLoc
	local isStop = false

	while isStop == false do
		print(string.format("Your current location is %s, Left step : %d", currentManLoc, leftStep))
		print()
		isRetry = false
		if currentManLoc == "KC" then break end
		if leftStep <= 0 then break end

		local availableMoveList = cal_available_move(currentManLoc, obj.place)
		io.write("A) Please enter where you want to go : ")
		local locInput = io.read("*number")

		if locInput == 1 then
			if origStep - leftStep == 0 then
				isStop = false
				print(string.format("You must move at least once. please re-enter"))
				isRetry = true
			else
				isStop = true
				break
			end
		end
		if availableMoveList[locInput] == nil then
			print(string.format("The value is not vaild. please re-enter"))
			isRetry = true
		end

		if isRetry == false then 
			leftStep = leftStep - 1
			currentManLoc = availableMoveList[locInput]
		end
	end
	obj:set_current_loc(playerNum, currentManLoc)
end

local cal_available_action = function(currentPlace)
	local availableActionList = {}

	for i, v in ipairs(currentPlace.tile) do
		table.insert(availableActionList, v)
	end
	--table.insert(availableActionList, SA)
	
	return availableActionList
end

local phase_b = function(obj, playerNum)
	local availableActionList = cal_available_action(obj.place[obj.player.human[playerNum].currentManLoc])

	while #availableActionList > 0 do
		for i, v in ipairs(availableActionList) do
			print(string.format("%d) %s", i, v.text))
		end
		io.write("B) Please enter what you want to do : ")
		local actInput = io.read("*number")

		if availableActionList[actInput] == nil then
			print(string.format("The value is not vaild. please re-enter"))
		else
			if availableActionList[actInput].act(obj, playerNum) == true then
				table.remove(availableActionList, actInput)
			end
		end
	end
end

local phase_c = function(obj, playerNum)
	draw_max(obj, 1)
end

local start_player_turn = function(obj)
	print_personal_info(obj, 1)
	print_map()
	phase_a(obj, 1)
	phase_b(obj, 1)
	--phase_c(obj, 1)
	print_personal_info(obj, 1)

	OBJ = obj
end

local start_computer_turn = function()
end

local set_neutral_building = function(obj)
	obj:set_neutral_building()
end
local set_player_order = function()
end

local get_max_handsize = function(playerInfo)
	return 4 + playerInfo.upgrade2.hand
end

local draw_max = function(obj, playerNum)
	local playerInfo = obj.player.human[playerNum]
	for i = 1, get_max_handsize(playerInfo) - #playerInfo.hand do
		obj:draw_1(playerNum)
	end
end

local init_setting = function(obj)
--set additional action
--random station master tile
--random neutral building tile 
	set_neutral_building(obj)
	draw_max(obj, 1)
--tile dummy setting
--pop1 * 7
--pop2 * ?
--pop1,2,3 set to kc
--cattle market setting
--random objective card
--building a? b? give
--draw 4
--start objective card
	set_player_order()
--money
end

math.randomseed(os.time())
init_setting(OBJ)
start_player_turn(OBJ)
start_computer_turn()
