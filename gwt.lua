require "def"

local print_personal_info = function()
end

local print_map = function()
end

local cal_move_next = function()
end

local cal_available_move = function(stepLimit, currentLoc, mapInfo)
	local availableMoveList = {}

	table.insert(availableMoveList, cal_move_next(stepLimit, currentLoc, mapInfo))
	table.insert(availableMoveList, cal_move_next(stepLimit - 1, currentLoc, mapInfo))
end

local go = function(step)
	print(step)
end

local act_a = function(player)
	print_personal_info()
	print_map()
	cal_available_move(stepLimit, currentLoc, mapInfo)
	io.write("Please enter where you want to go : ")
	go(io.read("*number"))
end
local act_b = function()
end
local act_c = function()
end

local start_player_turn = function(player)
	act_a(player)
	act_b(player)
	act_c(player)
end

local start_computer_turn = function()
end

start_player_turn()
start_computer_turn()
