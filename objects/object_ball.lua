--## init ball 
object.ball = {}

object.ball.spawn = function(params)
    local ball = {}
    --## ball position
    ball.x = params.x
    ball.y = params.y
    ball.type = "ball"
    --## ball radius 
    ball.radius = params.radius
    ball.timer = 2
    --## ball phyiscs
    ball.physics = object.physics_circle({
                                        x = ball.x, 
                                        y = ball.y,
                                        radius = ball.radius,
                                        body = params.body})
    --## custom shits
    ball.physics.fixture:setRestitution(.8)
    ball.physics.body:setBullet(true)
    ball.physics.body:applyLinearImpulse(math.random(-500,500), -500)
    --## insert into tabl
    table.insert(object.inWorld,ball)
end
            
object.ball.update = function(dt,ball)    
    if ball.physics.fixture:getUserData() == "object_destroyed" then
        local radius = ball.radius / 2
        if radius >= 15 then
            object.ball.spawn({x = ball.physics.body:getX()+radius,y = ball.physics.body:getY(), radius = radius,body = "dynamic",type = "ball"})
            object.ball.spawn({x = ball.physics.body:getX()-radius,y = ball.physics.body:getY(), radius = radius,body = "dynamic",type = "ball"})
            ball.physics.body:destroy()
            print("DESTROYED BALL :"..ball.radius.."\t SPAWNED 2 BALLS WITH RADIUS OF "..radius)
            return true
        else
            ball.timer = ball.timer - love.timer.getDelta()
            if ball.timer <= 0 then
                ball.physics.body:destroy()
                return true
            end
        end
    end
end