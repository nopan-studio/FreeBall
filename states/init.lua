--## inits 
local _____ = (...).."."

--## load files frome states folder
require (_____.."InDead")
require (_____.."InGame")
require (_____.."InMenu")
require (_____.."InShop")
require (_____.."InSplash")
require (_____.."InHow")

--## initialized default state.. 
simp.state_current = InSplash
simp.state_current_string = "InSplash"
simp.state_previous = nil

--## inits for game options
gameColor = "white"