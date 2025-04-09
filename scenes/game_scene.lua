GameScene = {}


local CardImg = nil
GameScene.load = function()
    CardImg = love.graphics.newImage("res/images/rune_card.png")
end

GameScene.update = function(dt)

end

GameScene.draw = function()
    love.graphics.draw(CardImg, 0, 0)
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