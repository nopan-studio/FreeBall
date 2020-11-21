InMenu = {}

InMenu.load = function()
    --## reset cursor visibility
    love.mouse.setVisible(true)

    --## load simply lib
    simp.load()

    --## initiate moonshine effects
    effect = moonshine(cw,ch,moonshine.effects.crt)
                .chain(moonshine.effects.scanlines)
    effect.scanlines.opacity = 0.2 
    effect.crt.feather = .05

    InMenu.crt = .05
    InMenu.switching = false
    InMenu.to = nil
    InMenu.to_string = nil

    

    --## create buttons
    button_start = simp.new_button({image = assets.neon_button,name = "button_start",x = cw/4, y = ch / 1.8,w = cw/2,h = 80,isVisible = true,
    pressed = function()
        InMenu.to = InGame
        InMenu.to_string = "InGame"
        InMenu.switching = true
        sfx.add(sfx.select) 
    end})

    button_shop = simp.new_button({image = assets.neon_button,name = "button_shop",x = cw/4, y = button_start.y + 100,w = cw/2,h = 80,isVisible = true,
    pressed = function() 
        InMenu.to = InShop
        InMenu.to_string = "InShop"
        InMenu.switching = true
        sfx.add(sfx.select) 
    end})

    button_how = simp.new_button({image = assets.neon_square_32,name = "button_how",x = cw - 100, y = button_start.y + 135,w = cw/2,h = 80,isVisible = true,
    pressed = function() 
        InMenu.to = InHow
        InMenu.to_string = "InHow"
        InMenu.switching = true
        sfx.add(sfx.select)  
    end})

end

InMenu.update= function(dt)
    local dt = love.timer.getDelta()

    if InMenu.switching == true then
        InMenu.crt = InMenu.crt + 0.1
        effect.crt.feather = InMenu.crt
        if InMenu.crt >= 2 then
            simp.state_switch(InMenu.to,InMenu.to_string)
        end
    end

    simp.update(dt)
    particle.update(dt)
end

InMenu.draw = function()
     effect(function()
        object.colors(gameColor,0.012)
        love.graphics.rectangle("fill",0,0,cw,ch)
        object.colors(gameColor,0.09)
        love.graphics.draw(assets.neon_bg,0,0)
        object.colors(gameColor,1)
        love.graphics.draw(assets.neon_logo,cw/100,80)
        simp.draw()
        love.graphics.print("START",cw/3 ,button_start.y)
        love.graphics.print("SHOP",cw/3 + 12,button_shop.y)
        particle.draw()
        --## TOP HUD
            object.colors(gameColor,0.05)
            love.graphics.rectangle("fill",0,0,cw,70)
            object.colors(gameColor,1)
            love.graphics.rectangle("line",0,0,cw,70)
            love.graphics.setFont(assets.font_small)
            love.graphics.print(" x"..savefile.Score,70,20)
            love.graphics.print("Highscore:"..savefile.HighScore,cw - 180,20)
            love.graphics.draw(assets.neon_square_32,45,20,0,.9,.9)
        --## lower shit
        love.graphics.print("?",button_how.x + 13,button_how.y+2)
        love.graphics.setFont(assets.font)
        
        object.colors("white")
    end)
end