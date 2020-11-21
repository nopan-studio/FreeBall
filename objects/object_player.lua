object.player = {}

object.player.spawn = function(params)
    local player = {}
    --## inits
    player.x = params.x
    player.y = params.y
    player.radius = params.radius

    --## type
    player.type = "player"

    --## physics
    player.physics = object.physics_circle({
                    x = player.x,
                    y = player.y,
                    radius = player.radius,
                    type = player.type,
                    body = params.body,
                    })
                    
    player.physics.body:setBullet(true)
    player.physics.body:setGravityScale(0)
    
    --## insert into table
    table.insert(object.inWorld,player)

    --## returns player table for later use.
    return player
end

object.player.update = function(dt,player)
    particle.player.add({x=player.physics.body:getX(),y=player.physics.body:getY()})

    if player.physics.fixture:getUserData() == "object_destroyed" then
        player.physics.body:destroy()
        print("PLAYER DESTROYED")
        simp.state_switch(InDead,"InDead")
        return true
    end
end