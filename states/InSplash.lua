InSplash = {}

InSplash.load = function()
     --## reset cursor visibility
     love.mouse.setVisible(false)
  
     --## initiate moonshine effects
     effect = moonshine(cw,ch,moonshine.effects.crt)
         .chain(moonshine.effects.scanlines)
     effect.scanlines.opacity = 0.2
     InSplash.crt = .05
     effect.crt.feather = InSplash.crt
     InSplash.x = 62
     InSplash.y = -400
     
end

InSplash.update= function(dt)
    if InSplash.y <= 140 then
        InSplash.y = InSplash.y + 5
    else

        if InSplash.crt == 0.05 then
            sfx.add(sfx.collect)
        end

        InSplash.crt = InSplash.crt + 0.02
        
    end
    effect.crt.feather = InSplash.crt

    if InSplash.crt >= 2 then

        simp.state_switch(InMenu,"InMenu")
    end
end

InSplash.draw = function()
    effect(function()
        love.graphics.setColor(50/255,41/255,71/255)
        love.graphics.rectangle("fill",0,0,cw,ch)
      
        object.colors("white")
            love.graphics.draw(assets.splash,InSplash.x,140,0,1.5,1.5)
        object.colors("white")
    end)
end