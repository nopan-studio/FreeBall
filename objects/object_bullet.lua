object.bullet = {}

object.bullet.spawn = function(params)
    --## inits 
    local bullet = {}
    bullet.x = params.x
    bullet.y = params.y
    bullet.w = 5
    bullet.h = 15
    bullet.timer = 5
    --## type 
    bullet.type = "bullet"
    bullet.userData = "object_bullet"

    --## physics
    bullet.physics = object.physics_rectangle({
                    x = bullet.x,
                    y = bullet.y,
                    w = bullet.w,
                    h = bullet.h,
                    type = bullet.type,
                    body = "dynamic",
                    userData = bullet.userData
                    })
            
    --bullet.physics.body:setGravityScale(0)
    bullet.physics.body:setMass(5)
    bullet.physics.body:applyLinearImpulse(0, -4000)
    table.insert(object.inWorld,bullet)
end

object.bullet.update = function(dt,bullet)
    if bullet.physics.body:getY() <= 0 then
        bullet.physics.body:destroy()
        return true
    else
        bullet.timer = bullet.timer - love.timer.getDelta()
        if bullet.timer <= 0 then
            bullet.physics.body:destroy()
            return true
        end
    end
end

