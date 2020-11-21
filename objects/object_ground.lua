object.ground = {}

object.ground.spawn = function(params)
    local ground = {}
    --## init
    ground.x = params.x
    ground.y = params.y
    ground.w = params.w
    ground.h = params.h
    --## type
    ground.type = params.type
    
    --## physics
    if params.type == "ground" then
        ground.userData = "object_ground"
    else 
        ground.userData = "object_wall"
    end
    --## ball phyiscs
    ground.physics = object.physics_rectangle({
                                    x = ground.x, 
                                    y = ground.y,
                                    w = ground.w,
                                    h = ground.h,
                                    body = "static",
                                    userData = ground.userData
                                })
    table.insert(object.inWorld,ground)
end