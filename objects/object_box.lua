object.box = {}

object.box.spawn = function(params)
    local box = {}
        --## inits
        box.x = params.x
        box.y = params.y
        box.w = params.w
        box.h = params.h
        
        --## type
        box.type = "box"
        box.userData = "object_box"
        box.timer = 10
        --## physics
        box.physics = object.physics_rectangle({
                    x = box.x,
                    y = box.y,
                    w = box.w,
                    h = box.h,
                    body = "dynamic",
                    userData = box.userData
                    })
        box.physics.fixture:setRestitution(.7)
        box.physics.body:setBullet(true)
        box.physics.body:applyLinearImpulse(math.random(-1000,1000), -500)

        table.insert(object.inWorld,box)
end

object.box.update = function(dt,box)
    if box.physics.fixture:getUserData() == "object_destroyed_box" then
        box.physics.body:destroy()
        print("BOXES CLAIMED: +1")
        object.score = object.score + 10
        ___atkTimerModifier = ___atkTimerModifier - 0.010
        print("total boxes :"..object.score)
        return true
    else
        box.timer = box.timer - love.timer.getDelta()
        if box.timer <= 0 then
            box.physics.body:destroy()
            return true
        end
    end
end