--## inits 
local _____ = (...).."."

--## init Objects table
object = {}
object.inWorld = {}
--## object.score. 
object.score = 0

object.load = function()
    object.inWorld = {}
    object.score = 0
end

--## load files on objects folder
require (_____.."object_player")
require (_____.."object_bullet")
require (_____.."object_ball")
require (_____.."object_box")
require (_____.."object_ground")

--## object inits
object.colors = function(color,opacity)
    if opacity == nil then
        opacity = 1
    end

    if color == "red" then
        chosenColor = love.graphics.setColor(1,0,0,opacity)
    elseif color == "marine" then
        chosenColor = love.graphics.setColor(127/255,255/255,212/255,opacity)
    elseif color == "yellow" then
        chosenColor = love.graphics.setColor(255/255,255/255,0/255,opacity)
    elseif color == "aqua" then
        chosenColor = love.graphics.setColor(0/255,255/255,255/255,opacity)
    elseif color == "blue" then
        chosenColor = love.graphics.setColor(0,0,1,opacity)
    elseif color == "pink" then
        chosenColor = love.graphics.setColor(255/255,20/255,147/255,opacity)
    elseif color == "green" then 
        chosenColor = love.graphics.setColor(0,1,0,opacity)
    elseif color == "violet" then
        chosenColor = love.graphics.setColor(238/255,130/255,238/255,opacity)
    elseif color == "white" then
        chosenColor = love.graphics.setColor(1,1,1,opacity)
    end
    return chosenColor
end

--## create object physics
object.physics_circle = function(params)
    local obj = {}
        --## BODY
        obj.body = love.physics.newBody(world, params.x, params.y, params.body)
        obj.body:setFixedRotation(false) -- to make object rotates when moving  
        --## SHAPE
        obj.shape = love.physics.newCircleShape( params.radius )
        --## FIXTURE
        obj.fixture = love.physics.newFixture(obj.body,obj.shape)
        if params.type == "player" then
            obj.fixture:setUserData("object_player")
        else
            obj.fixture:setUserData("object_ball")
        end
    --## returns object physics
    return obj
end

object.physics_rectangle = function(params)
    local obj = {}
        --## BODY
        obj.body = love.physics.newBody(world, params.x, params.y, params.body)
        obj.body:setFixedRotation(false) -- to make object rotates when moving  
        --## SHAPE
        obj.shape = love.physics.newRectangleShape(params.w,params.h)
        --## FIXTURE
        obj.fixture = love.physics.newFixture(obj.body,obj.shape)
        obj.fixture:setUserData(params.userData)
    --## returns object physics
    return obj
end

--## object update
object.update = function(dt)
    for ___, obj in ipairs(object.inWorld) do
        if obj.type == "ball" then
            if object.ball.update(dt,obj) then
                table.remove(object.inWorld,___)
            end
        elseif obj.type == "box" then
            if object.box.update(dt,obj) then
                table.remove(object.inWorld,___)
            end
        elseif obj.type == "player" then
            if object.player.update(dt,obj) then
                table.remove(object.inWorld,___)
            end
        elseif obj.type == "bullet" then
            if object.bullet.update(dt,obj) then
                table.remove(object.inWorld,___)
            end
        end
    end
end

--## draw objects
object.draw = function()
    for ___, _object in ipairs(object.inWorld) do
        if _object.physics.body:getX() >= 0 and _object.physics.body:getY() >= 0 then
            if _object.type == "ball" then
                object.colors(gameColor)
                    if _object.radius == 60 then
                            love.graphics.draw(assets.neon_ball_60,_object.physics.body:getX(),_object.physics.body:getY(),_object.physics.body:getAngle(),1.1,1.1,_object.radius,_object.radius)
                    elseif _object.radius == 30 then           
                        love.graphics.draw(assets.neon_ball_30,_object.physics.body:getX(),_object.physics.body:getY(),_object.physics.body:getAngle(),1.1,1.1,_object.radius,_object.radius)   
                    elseif _object.radius == 15 then
                        love.graphics.draw(assets.neon_ball_15,_object.physics.body:getX(),_object.physics.body:getY(),_object.physics.body:getAngle(),1.1,1.1,_object.radius,_object.radius)
                    end
                object.colors("white")

            elseif _object.type == "player" then
                object.colors(gameColor)
                    love.graphics.draw(assets.neon_ball_15,_object.physics.body:getX(),_object.physics.body:getY(),_object.physics.body:getAngle(),1.1,1.1,_object.radius,_object.radius)
                object.colors("white")

            elseif _object.type == "ground" then
                object.colors(gameColor,0.3)
                    love.graphics.polygon("line",_object.physics.body:getWorldPoints(
                    _object.physics.shape:getPoints()))
                object.colors("white")
            
            elseif _object.type == "bullet" then
                object.colors(gameColor)
                    love.graphics.polygon("line",_object.physics.body:getWorldPoints(
                    _object.physics.shape:getPoints()))
                object.colors("white")
            
            
            elseif _object.type == "box"then
                object.colors(gameColor)
                    love.graphics.draw(assets.neon_square_32,_object.physics.body:getX(),_object.physics.body:getY(),_object.physics.body:getAngle(),1,1,_object.w - 13,_object.h-13)
                object.colors("white")
                
            end
        end
    end 
end

