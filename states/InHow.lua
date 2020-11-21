InHow = {}

InHow.load = function()
    --## load simply lib
    simp.load()
     --## initiate moonshine effects
     effect = moonshine(cw,ch,moonshine.effects.crt)
         .chain(moonshine.effects.scanlines)
     effect.scanlines.opacity = 0.2

     InHow.crt = .05
     effect.crt.feather = InHow.crt
     InHow.switching = false
     InHow.x = 70
     InHow.y = -400

    button_back = simp.new_button({image = assets.neon_button,name = "button_back",x = cw/4 , y = ch - 100,w = cw/2,h = 80,isVisible = true,
    pressed = function()
        InHow.to = InMenu
        InHow.to_string = "InMenu"
        InHow.switching = true
        sfx.add(sfx.select)
    end})
end

InHow.update = function(dt)
    local dt = love.timer.getDelta()

    if InHow.switching == true then
        InHow.crt = InHow.crt + 0.1
        effect.crt.feather = InHow.crt
        if InHow.crt >= 2 then
            simp.state_switch(InHow.to,InHow.to_string)
        end
    end
    simp.update(dt)
end

InHow.draw = function()
    effect(function()
        object.colors(gameColor,0.012)
        love.graphics.rectangle("fill",0,0,cw,ch)
        object.colors(gameColor,0.09)
        love.graphics.draw(assets.neon_bg,0,0)
        object.colors(gameColor,1)
        
        simp.draw()
        love.graphics.print("BACK",cw/3 + 12,ch - 100)

        --## THE SHITS
        love.graphics.print("HOW TO PLAY?",50,100)
        love.graphics.setFont(assets.font_small)
        love.graphics.print("SQUARES = GOOD/MONEY \n CIRCLES = BAD/ENEMY",75,200)
        love.graphics.print("(c)fatespalms",cw/3 ,ch - 150)
        love.graphics.setFont(assets.font)
    end)
end