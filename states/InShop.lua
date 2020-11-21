InShop = {}

InShop.load = function()
    --## reset cursor visibility
    love.mouse.setVisible(true)

    --## load simply lib
    simp.load()
 
    --## initiate moonshine effects
    effect = moonshine(cw,ch,moonshine.effects.crt)
        .chain(moonshine.effects.scanlines)
    effect.scanlines.opacity = 0.2
    effect.crt.feather = .05
    
    InShop.crt = .05
    InShop.switching = false
    InShop.to = nil
    InShop.to_string = nil

    --## create buttons
        button_back = simp.new_button({image = assets.neon_button,name = "button_back",x = cw/4, y = ch - 100,w = cw/2,h = 80,isVisible = true,
        pressed = function()
            InShop.to = InMenu
            InShop.to_string = "InMenu"
            InShop.switching = true
            sfx.add(sfx.select)
        end})
   
    --## shop buttons
    --## 1st row
        button_blue = simp.new_button({name = "button_blue",x = cw/2 - 40 , y = 160,w = 64,h = 64,isVisible = true,
        pressed = function()
            if savefile.locked_blue == false then
                gameColor = "blue"
                sfx.add(sfx.select)
            else 
                if savefile.Score >= 200 then
                    savefile.locked_blue = false
                    gameColor = "blue"
                    savefile.Score = savefile.Score - 200
                    sfx.add(sfx.select)
                else
                    sfx.add(sfx.error)
                end
            end
        end})

        button_red = simp.new_button({name = "button_red",x = cw/2 - (40 * 2) - 50 , y = 160,w = 64,h = 64,isVisible = true,
        pressed = function() 
            if savefile.locked_red == false then
                gameColor = "red"
                sfx.add(sfx.select)
            else 
                if savefile.Score >= 200 then
                    savefile.locked_red = false
                    gameColor = "red"
                    savefile.Score = savefile.Score - 200
                    sfx.add(sfx.select)
                else
                    sfx.add(sfx.error)
                end
            end
        end})

        button_yellow = simp.new_button({name = "button_yellow",x = cw/2 + (40 * 2) - 30, y = 160 ,w = 64,h = 64,isVisible = true,
        pressed = function()
            if savefile.locked_yellow == false then
                gameColor = "yellow"
                sfx.add(sfx.select)
            else 
                if savefile.Score >= 200 then
                    savefile.locked_yellow = false
                    gameColor = "yellow"
                    savefile.Score = savefile.Score - 200
                    sfx.add(sfx.select)
                else
                    sfx.add(sfx.error)
                end
            end
        end})

    --## 2nd row
        button_marine = simp.new_button({name = "button_marine",x = cw/2 - 40 , y = 160 + 100,w = 64,h = 64,isVisible = true,
        pressed = function() 
            if savefile.locked_marine == false then
                gameColor = "marine"
                sfx.add(sfx.select)
            else 
                if savefile.Score >= 200 then
                    savefile.locked_marine = false
                    gameColor = "marine"
                    savefile.Score = savefile.Score - 200
                    sfx.add(sfx.select)
                else
                    sfx.add(sfx.error)
                end
            end
        end})

        button_violet = simp.new_button({name = "button_violet",x = cw/2 - (40 * 2) - 50 , y = 160 + 100,w = 64,h = 64,isVisible = true,
        pressed = function() 
            if savefile.locked_violet == false then
                gameColor = "violet"
                sfx.add(sfx.select)
            else 
                if savefile.Score >= 200 then
                    savefile.locked_violet = false
                    gameColor = "violet"
                    savefile.Score = savefile.Score - 200
                    sfx.add(sfx.select)
                else
                    sfx.add(sfx.error)
                end
            end
        end})

        button_pink = simp.new_button({name = "button_pink",x = cw/2 + (40 * 2) - 30, y = 160+ 100 ,w = 64,h = 64,isVisible = true,
        pressed = function()
            if savefile.locked_pink == false then
                gameColor = "pink"
                sfx.add(sfx.select)
            else 
                if savefile.Score >= 200 then
                    savefile.locked_pink = false
                    gameColor = "pink"
                    savefile.Score = savefile.Score - 200
                    sfx.add(sfx.select)
                else
                    sfx.add(sfx.error)
                end
            end
        end})

    --## 3rd row
        button_green = simp.new_button({name = "button_green",x = cw/2 - 40 , y = 160 + 200,w = 64,h = 64,isVisible = true,
        pressed = function() 
            if savefile.locked_green == false then
                gameColor = "green"
                sfx.add(sfx.select)
            else 
                if savefile.Score >= 200 then
                    savefile.locked_green = false
                    gameColor = "green"
                    savefile.Score = savefile.Score - 200
                    sfx.add(sfx.select)
                else
                    sfx.add(sfx.error)
                end
            end
        end})

        button_aqua = simp.new_button({name = "button_aqua",x = cw/2 - (40 * 2) - 50 , y = 160 + 200,w = 64,h = 64,isVisible = true,
        pressed = function() 
            if savefile.locked_aqua == false then
                gameColor = "aqua"
                sfx.add(sfx.select)
            else 
                if savefile.Score >= 200 then
                    savefile.locked_aqua = false
                    gameColor = "aqua"
                    savefile.Score = savefile.Score - 200
                    sfx.add(sfx.select)
                else
                    sfx.add(sfx.error)
                end
            end        
        end})

        button_white = simp.new_button({name = "button_white",x = cw/2 + (40 * 2) - 30, y = 160+ 200 ,w = 64,h = 64,isVisible = true,
        pressed = function() 
            if savefile.locked_white == false then
                gameColor = "white"
                sfx.add(sfx.select)
            else 
                if savefile.Score >= 200 then
                    savefile.locked_white = false
                    gameColor = "white"
                    savefile.Score = savefile.Score - 200
                    sfx.add(sfx.select)
                else
                    sfx.add(sfx.error)
                end
            end
        end})
end

InShop.update = function(dt)
    local dt = love.timer.getDelta()

    if InShop.switching == true then
        InShop.crt = InShop.crt + 0.1
        effect.crt.feather = InShop.crt
        if InShop.crt >= 2 then
            simp.state_switch(InShop.to,InShop.to_string)
        end
    end

    simp.update(dt)
    check_changes(t)
end

InShop.draw = function()
    effect(function()
        --## BG
            object.colors(gameColor,0.012)
            love.graphics.rectangle("fill",0,0,cw,ch)
            object.colors(gameColor,0.1)
            love.graphics.draw(assets.neon_bg,0,0)
        --drawer
            object.colors(gameColor,0.05)
            love.graphics.rectangle("fill",cw/5 - 22,50,300,450)
            object.colors(gameColor,0.5)
            love.graphics.rectangle("line",cw/5 - 22,50,300,450)
            object.colors(gameColor,0.5)
        --## HUD
            object.colors(gameColor)
            love.graphics.setFont(assets.font_small)
            love.graphics.print(" x"..savefile.Score,cw/2 - 20 ,80)
            love.graphics.draw(assets.neon_square_32,cw/2 - 50,80,0,.9,.9)
            object.colors(gameColor,0.5)
            love.graphics.setFont(assets.font)
        --## BUTTON
        object.colors(gameColor,1)
            love.graphics.print("BACK",cw/3 + 11,button_back.y)
            simp.draw()

        --## draw shop shits.
            object.colors(gameColor,0.5)
            love.graphics.setFont(assets.font_small)
        --## BLUE CENTER
            love.graphics.draw(assets.neon_square_32,button_blue.x,button_blue.y,0,2,2)
            object.colors("blue")
            love.graphics.draw(assets.neon_ball_15,button_blue.x + 40,button_blue.y + 40,0,1,1,15,15)

            object.colors("yellow",0.5)
            if savefile.locked_blue == true then
                love.graphics.print("200",button_blue.x+20,button_blue.y+70)
            else
                object.colors(gameColor)
                love.graphics.print("OWNED",button_blue.x+5,button_blue.y+70)
            end

            object.colors(gameColor,0.5)

        --## RED LEFT
            love.graphics.draw(assets.neon_square_32,button_red.x,button_red.y,0,2,2)
            object.colors("red")
            love.graphics.draw(assets.neon_ball_15,button_red.x + 40 ,button_red.y + 40,0,1,1,15,15)

            object.colors("yellow",0.5)

            if savefile.locked_red == true then
                love.graphics.print("200",button_red.x+20,button_red.y+70)
            else
                object.colors(gameColor)
                love.graphics.print("OWNED",button_red.x+5,button_red.y+70)
            end
            object.colors(gameColor,0.5)

        --## YELLOW RIGHT
            love.graphics.draw(assets.neon_square_32,button_yellow.x,button_yellow.y,0,2,2)
            object.colors("yellow")
            love.graphics.draw(assets.neon_ball_15,button_yellow.x +  40,button_yellow.y+40,0,1,1,15,15)

            object.colors("yellow",0.5)

            if savefile.locked_yellow == true then
                love.graphics.print("200",button_yellow.x+20,button_yellow.y+70)
            else
                object.colors(gameColor)
                love.graphics.print("OWNED",button_yellow.x+5,button_yellow.y+70)
            end

            object.colors(gameColor,0.5)

        --## marine CENTER
            love.graphics.draw(assets.neon_square_32,button_marine.x,button_marine.y,0,2,2)
            object.colors("marine")
            love.graphics.draw(assets.neon_ball_15,button_marine.x + 40,button_marine.y + 40,0,1,1,15,15)

            object.colors("yellow",0.5)

            if savefile.locked_marine== true then
                love.graphics.print("200",button_marine.x+20,button_marine.y+70)
            else
                object.colors(gameColor)
                love.graphics.print("OWNED",button_marine.x+5,button_marine.y+70)
            end
            
            object.colors(gameColor,0.5)
 
        --## violet LEFT
            love.graphics.draw(assets.neon_square_32,button_violet.x,button_violet.y,0,2,2)
            object.colors("violet")
            love.graphics.draw(assets.neon_ball_15,button_violet.x + 40 ,button_violet.y + 40,0,1,1,15,15)

            object.colors("yellow",0.5)

            if savefile.locked_violet== true then
                love.graphics.print("200",button_violet.x+20,button_violet.y+70)
            else
                object.colors(gameColor)
                love.graphics.print("OWNED",button_violet.x+5,button_violet.y+70)
            end

            object.colors(gameColor,0.5)
 
         --## pink RIGHT
            love.graphics.draw(assets.neon_square_32,button_pink.x,button_pink.y,0,2,2)
            object.colors("pink")
            love.graphics.draw(assets.neon_ball_15,button_pink.x +  40,button_pink.y+40,0,1,1,15,15)

            object.colors("yellow",0.5)

            if savefile.locked_pink== true then
                love.graphics.print("200",button_pink.x+20,button_pink.y+70)
            else
                object.colors(gameColor)
                love.graphics.print("OWNED",button_pink.x+5,button_pink.y+70)
            end

            object.colors(gameColor,0.5)

        --## green CENTER
            love.graphics.draw(assets.neon_square_32,button_green.x,button_green.y,0,2,2)
            object.colors("green")
            love.graphics.draw(assets.neon_ball_15,button_green.x + 40,button_green.y + 40,0,1,1,15,15)

            object.colors("yellow",0.5)

            if savefile.locked_green== true then
                love.graphics.print("200",button_green.x+20,button_green.y+70)
            else
                object.colors(gameColor)
                love.graphics.print("OWNED",button_green.x+5,button_green.y+70)
            end

            object.colors(gameColor,0.5)
  
        --## aqua LEFT
            love.graphics.draw(assets.neon_square_32,button_aqua.x,button_aqua.y,0,2,2)
            object.colors("aqua")
            love.graphics.draw(assets.neon_ball_15,button_aqua.x + 40 ,button_aqua.y + 40,0,1,1,15,15)

            object.colors("yellow",0.5)

            if savefile.locked_aqua== true then
                love.graphics.print("200",button_aqua.x+20,button_aqua.y+70)
            else
                object.colors(gameColor)
                love.graphics.print("OWNED",button_aqua.x+5,button_aqua.y+70)
            end

            object.colors(gameColor,0.5)
  
        --## white RIGHT
            love.graphics.draw(assets.neon_square_32,button_white.x,button_white.y,0,2,2)
            object.colors("white")
            love.graphics.draw(assets.neon_ball_15,button_white.x +  40,button_white.y+40,0,1,1,15,15)

            object.colors("yellow",0.5)

            if savefile.locked_white== true then
                love.graphics.print("200",button_white.x+20,button_white.y+70)
            else
                object.colors(gameColor)
                love.graphics.print("OWNED",button_white.x+5,button_white.y+70)
            end

            object.colors(gameColor,0.5)
        --## reset
            love.graphics.setFont(assets.font)
            object.colors("white")
    end)
end