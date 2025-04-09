GameScene = {}

local card_img = nil
GameScene.load = function()
    card_img = love.graphics.newImage("res/images/rune_card_hd.png")
end

GameScene.update = function(dt)

end

local WHITE = {1.0, 1.0, 1.0, 1.0}
GameScene.draw = function()
    -- draws graphics at 100% brightness
    love.graphics.setColor(WHITE)
    love.graphics.draw(card_img, 0, 100)
end

GameScene.keyboardpressed = function(k)
    if k == "m" then
        print("aldkjfhalskjdfh")
        ChangeScene("main_menu")
    end
    if k == "p" then
        print(GameScene.loaded)
    end
end

GameScene.keyboardreleased = function(k)

end

GameScene.mousepressed = function(x, y, button)

end

GameScene.mousereleased = function(x, y, button)

end

return GameScene