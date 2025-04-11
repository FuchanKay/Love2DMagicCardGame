local sound_effects_module = {}
sound_effects_module.playBell = function()
    local bell_audio = love.audio.newSource("res/audio/bell.wav", "static")
    love.audio.setVolume(Settings.master_audio_level / 100)
    bell_audio:play()
end

return sound_effects_module