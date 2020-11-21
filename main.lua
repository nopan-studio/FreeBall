--## LIBRARIES // GLOBALS
simp = require "libs.Simply" 
push = require "libs.push"
gamera = require "libs.gamera" 
moonshine = require "libs.moonshine"

--## local files
require "assets"
require "sfx"
require "save_load"
require "effects"
require "objects"
require "states"
require "collision_callbacks"

--## MAIN READ
love.load = function()
    math.randomseed(os.time()*9)
    
    --## LOAD SAVE
    check_save()
    gameColor = savefile.GameColor

    --@@ SETUP CANVAS + PUSH
    cw,ch = 416,608
    canvas = love.graphics.newCanvas(cw, ch)
    focused = true
    --sw, sh = 480, 270
    sw, sh = 416,608
    windowWidth, windowHeight = love.graphics.getDimensions()
    windowWidth, windowHeight = 416,608 --windowWidth*.8, windowHeight*.8

    push:setupScreen(sw, sh, windowWidth, windowHeight, {fullscreen = false, stretched = true,canvas = canvas, pixelperfect = true,resizable = true})
    --push:setupScreen(sw, sh, windowWidth, windowHeight, {fullscreen = false, stretched = true,canvas = canvas, pixelperfect = true})

    --## OnLoad Gamestate
    simp.state_load()
end

function love.resize(w, h)
    push:resize(w,h)
end

love.update = function(dt)
    if focused then
        simp.state_update(dt)
        sfx.update(dt)
    end
end

love.focus = function(f)
    if not f then
        love.audio.setVolume(0)
        focused = false
    else
        love.audio.setVolume(1)
        focused = true
    end
end

love.draw = function()
    push:start()
        simp.state_draw()
    push:finish()
end

function love.mousepressed(x,y,button,istouch)
    x,y = push:toGame(x,y)
    --## inGame Presses
    if button == 1 and simp.state_current_string == "InGame" then
        simp.state_current.mousepressed(x,y,button)

    --## inDead Presses
    elseif button == 1 and simp.state_current_string == "InDead" then
        simp.mousepressed(x,y,button)

    elseif button == 1 and simp.state_current_string == "InMenu" then
        simp.mousepressed(x,y,button)

    elseif button == 1 and simp.state_current_string == "InShop" then
        simp.mousepressed(x,y,button)

    elseif button == 1 and simp.state_current_string == "InHow" then
        simp.mousepressed(x,y,button)
    end
end

function love.mousereleased(x, y, button,istouch)
    x,y = push:toGame(x,y)
    if button == 1 and simp.state_current_string == "InGame" then
        for ____, obj in ipairs(object.inWorld) do
            pcall(function()
                if obj.type == "player" then
                    obj.physics.body:destroy()
                    table.remove(object.inWorld,____)
                    simp.state_switch(InDead,"InDead")
                end
            end)
        end
    end
 end