GameScene = {}

local cardImg = nil
GameScene.load = function()
    cardImg = love.graphics.newImage("res/images/rune_type_hd.png")
end

GameScene.update = function(dt)

end

local WHITE = {1.0, 1.0, 1.0, 1.0}
GameScene.draw = function()
    -- draws graphics at 100% brightness
    love.graphics.setColor(WHITE)
    love.graphics.draw(cardImg, 200, 200)
end

GameScene.keyboardpressed = function(k)

end

GameScene.keyboardreleased = function(k)

end

GameScene.mousepressed = function(x, y, button)

end

GameScene.mousereleased = function(x, y, button)

end

return GameScene