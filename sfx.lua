sfx = {}
sfx.list = {}
--## sounds goes here.
sfx.select = love.sound.newSoundData("sfx/select.wav")
sfx.error = love.sound.newSoundData("sfx/select.wav")
sfx.bounce = love.sound.newSoundData("sfx/bounce.wav")
sfx.destroy = love.sound.newSoundData("sfx/destroy.wav")
sfx.collect = love.sound.newSoundData("sfx/collect.wav")
sfx.brink = love.audio.newSource("sfx/bgm_brink.ogg","stream")
sfx.brink:setVolume(0.4)
sfx.celebration = love.audio.newSource("sfx/bgm_celebration.ogg","stream")
sfx.celebration:setVolume(0.4)
sfx.celebration:setPitch(0.8)
       -- sfx_menu_bg = love.audio.newSource(menuBG,"dynamic")
sfx.update = function(dt)
    
    if simp.state_current_string == "InMenu" or simp.state_current_string == "InDead" or simp.state_current_string == "InHow" or simp.state_current_string == "InShop" then

        if sfx.brink:isPlaying() == true then
            sfx.brink:stop()
        end

        if sfx.celebration:isPlaying() == false then
            sfx.celebration:play()
        end
    elseif simp.state_current_string == "InGame" then
        if sfx.celebration:isPlaying() == true then
            sfx.celebration:stop()
        end

        if sfx.brink:isPlaying() == false then
            sfx.brink:play()
        end
    end

    for i, s in ipairs(sfx.list) do
        if s:isPlaying() == false  then
        table.remove(sfx.list,i)
        end
    end
end

sfx.add = function(path) 
    local a = love.audio.newSource(path,"dynamic")
    table.insert(sfx.list,a)
        if path == sfx.error or path == sfx.bounce or path == sfx.destroy or path == sfx.collect then
            if path == sfx.error then
                a:setPitch(0.48)
            else
                a:setPitch(1.2)
            end
            if path ~= sfx.collect then
                a:setVolume(.5)
            end
        end
    a:play()
end