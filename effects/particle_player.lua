particle.player = {}

particle.player.add = function(params)
    --## init particle
    local  p ={}
    p.x = params.x
    p.y = params.y
    p.type = "player"
    p.system = love.graphics.newParticleSystem(assets.neon_ball_15, 10)
    p.system:setParticleLifetime(1, 3)
    p.system:setLinearAcceleration(-10, 200, -10, 200)
    p.system:setSpeed(30)
    p.system:setSpin(40)
    p.system:setSpread(300)
    --## set particle life timer in table
    p.timer = 1
    p.system:emit(4)

    --## insert into table
    table.insert(particle.count,p)

end

particle.player.update = function(dt,pSystem)
    pSystem.system:update(dt)
    pSystem.timer = pSystem.timer - dt
    if pSystem.timer <= 0 then
        return true
    end
end

particle.player.draw = function(pSystem)
   
        object.colors(gameColor,0.04)
        love.graphics.draw(pSystem.system,pSystem.x,pSystem.y)
        object.colors("white")
   
end
