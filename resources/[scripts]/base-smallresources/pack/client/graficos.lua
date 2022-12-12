RegisterCommand('graficos',function(source,args)
    if not active then
    active = true
--    SetTimecycleModifier('yell_tunnel_nodirect')
    SetTimecycleModifier('MP_Powerplay_blend')
    SetExtraTimecycleModifier('reflection_correct_ambient')
    print('^4Gráficos: Activados^0')
    else
    active = false
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
--    ResetExtraTimecycleModifierStrength()
    print('^4Gráficos: Desativados^0')
    end
end)