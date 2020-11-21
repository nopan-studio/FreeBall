
--## check collisions when contact begins 
function beginContact(a, b, coll)
    print("A:"..a:getUserData().."\t B:"..b:getUserData())
    --## check collisions between player and object balls
    if a:getUserData() == "object_player" and b:getUserData() == "object_ball" then
        a:setUserData("object_destroyed")
    end

    if b:getUserData() == "object_player" and a:getUserData() == "object_ball" then
        b:setUserData("object_destroyed")
    end

    if a:getUserData() == "object_player" and b:getUserData() == "object_destroyed" then
        a:setUserData("object_destroyed")
    end

    if b:getUserData() == "object_player" and a:getUserData() == "object_destroyed" then
        b:setUserData("object_destroyed")
    end

    --## check collisions between bullets and balls
    if a:getUserData() == "object_bullet" and b:getUserData() == "object_ball" then
        b:setUserData("object_destroyed")
    end

    if a:getUserData() == "object_ball" and b:getUserData() == "object_bullet" then
        a:setUserData("object_destroyed")
    end


    --## check collisions between player and boxes
    if a:getUserData() == "object_player" and b:getUserData() == "object_box" then
        b:setUserData("object_destroyed_box")
        sfx.add(sfx.collect)
    end

    if b:getUserData() == "object_player" and a:getUserData() == "object_box" then
        a:setUserData("object_destroyed_box")
        sfx.add(sfx.collect)
    end

    if a:getUserData() == "object_ground" and b:getUserData() == "object_box" then
        sfx.add(sfx.bounce)
    end

    if b:getUserData() == "object_ground" and a:getUserData() == "object_box" then
        sfx.add(sfx.bounce)
    end

    if a:getUserData() == "object_walls" and b:getUserData() == "object_box" then
        sfx.add(sfx.bounce)
    end

    if b:getUserData() == "object_walls" and a:getUserData() == "object_box" then
        sfx.add(sfx.bounce)
    end

    --## BALL BOUNC SOUNDS
    if b:getUserData() == "object_ground" and a:getUserData() == "object_destroy" then
        sfx.add(sfx.bounce)
    elseif a:getUserData() == "object_ground" and b:getUserData() == "object_destroy" then
        sfx.add(sfx.bounce)
    end

    if a:getUserData() == "object_wall" and b:getUserData() == "object_ball" then
        sfx.add(sfx.bounce)
    elseif b:getUserData() == "object_wall" and a:getUserData() == "object_ball" then
        sfx.add(sfx.bounce)
    elseif b:getUserData() == "object_wall" and a:getUserData() == "object_destroy" then
        sfx.add(sfx.bounce)
    elseif a:getUserData() == "object_wall" and b:getUserData() == "object_destroy" then
        sfx.add(sfx.bounce)
    end

end

--## check collisions when contact ended
function endContact(a, b, coll)
    --## check collisions between player and object balls
    if a:getUserData() == "object_player" and b:getUserData() == "object_ball" then
        a:setUserData("object_destroyed")
    elseif b:getUserData() == "object_player" and a:getUserData() == "object_ball" then
        b:setUserData("object_destroyed")
    --## check collisions between player and boxes
    elseif a:getUserData() == "object_player" and b:getUserData() == "object_box" then
        b:setUserData("object_destroyed")
    elseif b:getUserData() == "object_box" and a:getUserData() == "object_player" then
        b:setUserData("object_destroyed")
    end
    --## check object_ball if it hits the grounds then leaves
    if a:getUserData() == "object_ground" and b:getUserData() == "object_ball" then
        b:setUserData("object_destroyed")
        local t = b:getShape()
        if t:getRadius() == 15 then
            sfx.add(sfx.bounce)
        else
            sfx.add(sfx.destroy)
        end

    elseif b:getUserData() == "object_ground" and a:getUserData() == "object_ball" then
        a:setUserData("object_destroyed")
        local t = a:getShape()
        if t:getRadius() == 15 then 
            sfx.add(sfx.bounce)
        else
            sfx.add(sfx.destroy)
        end
    end
end

--#####################################################################################################
--## idk what this shit do
function preSolve(a, b, coll)
 
end
--## this one also,
function postSolve(a, b, coll, normalimpulse, tangentimpulse)
 
end