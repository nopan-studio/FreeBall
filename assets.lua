assets = {}
--## IMAGE FILTER

--## FONT
assets.font = love.graphics.setNewFont("assets/Sportrop.ttf",40)
assets.font_small = love.graphics.setNewFont("assets/Sportrop.ttf",20)
love.graphics.setFont(assets.font)

--## IMAGES
assets.splash = love.graphics.newImage("assets/splash.png")
assets.splash:setFilter("nearest","nearest")
assets.neon_bg = love.graphics.newImage("assets/neon_bg.png")
assets.neon_square_32 = love.graphics.newImage("assets/32px_neon_square.png")
assets.neon_ball_60 = love.graphics.newImage("assets/60px_neon_ball.png")
assets.neon_ball_30 = love.graphics.newImage("assets/30px_neon_ball.png")
assets.neon_ball_15 = love.graphics.newImage("assets/15px_neon_ball.png")
assets.neon_button = love.graphics.newImage("assets/button.png")
assets.neon_logo = love.graphics.newImage("assets/free_ball_LOGO.png")
return assets