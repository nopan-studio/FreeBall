--## INIT
InGame = {}

--## InGame onLoad
InGame.load = function()
    --##
    simp.load()

    --## load objects
    object.load()

    --## initiate moonshine effects
    effect = moonshine(cw,ch,moonshine.effects.crt)
        .chain(moonshine.effects.scanlines)
    effect.scanlines.opacity = 0.2
    effect.crt.feather = .05

    InGame.start = false
    --## initiate world
    world = love.physics.newWorld(0, 400)
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)

    --## spawn object
    object.ball.spawn({x = cw/2,y = -200, radius = 40,body = "static"}) 
    object.ground.spawn({x = 0,y = ch, w=1000,h=32, type = "ground"})
    object.ground.spawn({x = 0,y = 0, w=15,h=1500, type = "wall"})
    object.ground.spawn({x = cw,y = 0, w=15,h=1500, type = "wall"})
    object.ground.spawn({x = 0,y = -500, w=1000,h=15, type = "wall"})
    
    --## test timer delete later
    ___timer = 1 
    ___atkTimer = 1.5
    ___atkTimerModifier = ___atkTimer

    --## mousejoint 
    mouseJoint = nil
    
    --## TEST SHIT DELETE
    particle.load()
end

--## InGame onStep 
InGame.update = function()
    --## spawn timer
    local dt = love.timer.getDelta()
    if InGame.start == true then
        ___timer = ___timer - dt
        if ___timer <= 0 then
            object.ball.spawn({x = math.random(50,300),y = math.random(-450,0), radius = 60,body = "dynamic"})
            if math.floor(math.random(0,2)) == 1 then
                object.box.spawn({x = cw/2,y=-300,w=32,h=32})
            else
                object.box.spawn({x = cw/2,y=-300,w=32,h=32})
            end
            print("SPAWNED:BALL \t SPAWNED:BOX \t TOTAL ACTIVE OBJECTS:"..#object.inWorld)
            ___timer = 5
        end

        --## player control
        --[[
        ___atkTimer= ___atkTimer - dt
        if ___atkTimer <= 0 then
            pcall(function()
            object.bullet.spawn({x = player.physics.body:getX(),y =player.physics.body:getY() - 40})
            end)
            ___atkTimer = ___atkTimerModifier
        end
        ]]
    end
    --## controlling player
    pcall(function()
        mouseJoint:setTarget(push:toGame(love.mouse.getPosition()))
    end)

    --## update shits
    world:update(dt)
    particle.update(dt)
    object:update(dt)
end

--## Ingame Draw 
InGame.draw = function()

    effect(function()
        object.colors(gameColor,1)
        if InGame.start == false then
            object.colors(gameColor,math.random(0.7,1))
            love.graphics.print("TAP AND HOLD\n  TO START",40,250)
        end
        
        object.colors(gameColor,0.5)
            --love.graphics.print("FPS : "..tostring(love.timer.getFPS()),50,10)
            if InGame.start == true then
                if object.score < 10 then
                    love.graphics.print(object.score,cw/2-20,50)
                elseif object.score < 100 then
                    love.graphics.print(object.score,cw/2-30,50)
                else
                    love.graphics.print(object.score,cw/2-40,50)
                end
            end
        object.colors(gameColor,0.010)
            love.graphics.rectangle("fill",0,0,cw,ch)
        object.colors(gameColor,0.09)
            love.graphics.draw(assets.neon_bg,0,0)
        object.colors(gameColor,0.05)
        object.colors("white")
        particle.draw()
        object.draw()
    end)
    
end

InGame.mousepressed = function(x,y,button)
    pcall(function()
        x,y = push:toGame(love.mouse.getPosition())
        love.mouse.setVisible(false)
        InGame.start = true
        player = object.player.spawn({x = x,y = y, radius = 16,body = "dynamic"})
        mouseJoint = love.physics.newMouseJoint(player.physics.body,x,y )
    end)
end

