--[[
    ##how to add button##
    button_name = __Simply.button_add([
        name = "name",
        group = "group_name",
        isVisible = true/false,
        setVisibility = true/false, determines if auto visibility check is allowed.
        x = int,
        y = int,
        w = int,
        h = int,
        pressed = function ()
            end,
        image = nil,
        quad = nil,
    ])
]]

--## ADD BUTTON
__Simply.new_button = function(params)
    local button = {
        name = params.name or error("params.name can't be nil"),
        group = params.group or nil,
        isVisible = params.isVisible,
        setVisibility = params.setVisibility,
        x = params.x or error("params.x can't be nil"),
        y = params.y or error("params.y can't be nil"),
        w = params.w or error("params.w can't be nil"),
        h = params.h or error("params.h can't be nil"),
        pressed = params.pressed or nil,
        image = params.image or nil,
        quad = params.quad or nil,
    }
    table.insert(__Simply.buttons,button)
    return button
end

--## UPDATE BUTTON
__Simply.button_update = function(comp,dt)
    if comp.group ~= nil and comp.setVisibility == true then 
        for ii, group in ipairs(__Simply.groups) do
            if comp.group == group.name then
                comp.isVisible = group.isVisible
            end
        end
    end
end

--## DRAW BUTTON
__Simply.button_draw = function(comp)
    if  comp.isVisible then
        if comp.image ~= nil and comp.quad ~= nil then
            love.graphics.draw(comp.image,comp.quad,comp.x,comp.y)
        elseif comp.image ~= nil and comp.quad == nil then
            love.graphics.draw(comp.image,comp.x,comp.y)
        else
            --love.graphics.rectangle("line",comp.x,comp.y,comp.w,comp.h)
        end
    end
end

__Simply.button_pressed = function(comp,x,y)
    if comp.isVisible and __Simply.aabb({x=x,y=y,w=1,h=1},{x=comp.x,y=comp.y,w=comp.w,h=comp.h}) and comp.pressed ~= nil then
        comp.pressed()
    end 
end


