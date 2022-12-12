---Config with all global variables
cfg = {
    commandName = 'emotes', -- Open the animations panel
    commandSuggestion = 'Abra el panel de Emotes', -- Open the animations panel suggestion
    commandNameEmote = 'e', -- Play an animation by command
    commandNameSuggestion = 'Hacer animacion desde comando', -- Play an animation by command suggestion
    keyActive = true, -- Use key for opening the panel
    keyLetter = 'F3', -- Which key for opening the panel if cfg.keyActive is true
    keySuggestion = 'Abra el panel de emote por tecla', -- Suggestion on keybind mapping
    walkingTransition = 0.5,

    acceptKey = 38, -- Accept key for shared anim
    denyKey = 182, -- Deny key for shared anim
    waitBeforeWalk = 5000, -- Wait before setting back walking style (If someone has a better method pls make a pull request because multichars are a pain in the ass)

    -- Do not touch
    useTnotify = GetResourceState('t-notify') == 'started',
    panelStatus = false,

    animActive = false,
    animDuration = 1500, -- You can change this but I recommend not to.
    animLoop = false,
    animMovement = false,
    animDisableMovement = false,
    animDisableLoop = false,

    sceneActive = false,

    propActive = false,
    propsEntities = {},

    ptfxOwner = false,
    ptfxActive = false,
    ptfxEntities = {},
    ptfxEntitiesTwo = {},

    malePeds = {
        "mp_m_freemode_01"
    },

    sharedActive = false,

    cancelKey = 73, -- Default key for cancelling an animation. Users can change this manually too.
    defaultCommand = 'fav', -- Emote command execution
    defaultEmote = 'dance', -- Default emote by default
    defaultEmoteUseKey = true, -- Don't recommend setting this to false unless you change UI
    defaultEmoteKey = 20 -- Default emote command key
}