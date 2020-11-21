local _____ = (...).."."
--## init
particle = {}
particle.count = {}

--## require files in effects folder
require (_____.."particle_player")

--## load shits

particle.load = function()
    particle.count = {}
end

particle.update = function(dt)
    for __, p in ipairs(particle.count) do
        if p.type == "player" then
            if particle.player.update(dt,p) then
                table.remove(particle.count,__)
            end
        end
    end 
end

particle.draw = function()
    for __, p in ipairs(particle.count) do
        if p.type == "player" then
            particle.player.draw(p)
        end
    end 
end
