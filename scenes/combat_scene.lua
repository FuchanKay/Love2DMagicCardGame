-- TODO: add loading scene and be able to construct this
CombatScene = Object:extend()

function CombatScene:init()
    local scene = {}
    scene.load = function()

    end

    scene.update = function(dt)
        if G.controller then G.controller.update(dt) end
    end
    
    scene.draw = function()
        love.graphics.setBackgroundColor(0.4, 0.4, 0.5)
        if G.controller then G.controller.draw() end
    end
    
    scene.keyboardpressed = function(k)
        if k == "m" then ChangeScene("main_menu") end
    end
    
    scene.keyboardreleased = function(k)
        if k == "f" then G.controller.drawCard() end
        if k == "g" then G.controller.discardEntireHand() end
        -- if k == "h" then enemy_screen.addEnemy(Enemy.newEnemy("skelly", BLACK_SKELETON_ENEMY_IMG, SKELETON_SCALE, 100, {})) end
        if k == "q" then G.draw_pile.addCard(Card(HolyCardEffects.Z, CARD_SIZE_SCALE)) end
    end
    
    scene.mousepressed = function(x, y, button)
    
    end
    
    scene.mousereleased = function(x, y, button)
    
    end

    return scene
end