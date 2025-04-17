local sound_effects_module = {}
local AUDIO_DIRECTORY = "res/audio/"
sound_effects_module.playBell = function()
    local bell_audio = love.audio.newSource(AUDIO_DIRECTORY.."bell.wav", "static")
    love.audio.setVolume(Settings.master_audio_level / 100)
    bell_audio:play()
end
sound_effects_module.playClick = function()
    local click_audio = love.audio.newSource(AUDIO_DIRECTORY.."button_click_1.wav", "static")
    love.audio.setVolume(Settings.master_audio_level / 100)
    click_audio:play()
end

return sound_effects_module