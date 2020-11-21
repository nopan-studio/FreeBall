InDead = {}

InDead.load = function()
    check_scores(object)
    --## reset cursor visibility
    love.mouse.setVisible(true)

    --## load simply lib
    simp.load()

    --## initiate moonshine effects
    effect = moonshine(cw,ch,moonshine.effects.crt)
        .chain(moonshine.effects.scanlines)
    effect.scanlines.opacity = 0.2
    effect.crt.feather = .05

    InDead.crt = .05
    InDead.switching = false
    InDead.to = nil
    InDead.to_string = nil

    --## create buttons
    button_retry = simp.new_button({image = assets.neon_button,name = "button_retry",x = cw/4, y = 300,w = cw/2,h = 80,isVisible = true,
    pressed = function() 
        InDead.to = InGame
        InDead.to_string = "InGame"
        InDead.switching = true
        sfx.add(sfx.select) 
    end})
    
    button_menu = simp.new_button({image = assets.neon_button,name = "button_retry",x = cw/4, y = button_retry.y + 100,w = cw/2,h = 80,isVisible = true,
    pressed = function() 
        InDead.to = InMenu
        InDead.to_string = "InMenu"
        InDead.switching = true
        sfx.add(sfx.select) 
    end})
end

InDead.update = function()
    local dt = love.timer.getDelta()

    if InDead.switching == true then
        InDead.crt = InDead.crt + 0.1
        effect.crt.feather = InDead.crt
        if InDead.crt >= 2 then
            simp.state_switch(InDead.to,InDead.to_string)
        end
    end

    simp.update(dt)
end

InDead.draw = function()
    effect(function()
        object.colors(gameColor,0.012)
        love.graphics.rectangle("fill",0,0,cw,ch)
        object.colors(gameColor,0.09)
        love.graphics.draw(assets.neon_bg,0,0)
        object.colors(gameColor,0.5)
        object.colors(gameColor,0.1)
        love.graphics.rectangle("fill",cw/4,70,205,200)
        object.colors(gameColor,1)
        love.graphics.rectangle("line",cw/4,70,205,200)
        love.graphics.setFont(assets.font_small)
        love.graphics.print("HIGHEST: "..savefile.HighScore,cw/4 +30,110)
        if object.score >= 10 then
            love.graphics.print("SCORE: "..object.score,cw/4 +30,150)
        else
            love.graphics.print("SCORE: "..object.score,cw/4 +30,150)
        end
        love.graphics.print("TOTAL: "..savefile.Score,cw/4 +30,190)
        love.graphics.setFont(assets.font)
        love.graphics.print("RETRY",cw/3 ,button_retry.y)
        love.graphics.print("MENU",cw/3 + 10,button_menu.y)
        simp.draw()
        object.colors("white")
    end)
end