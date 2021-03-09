ESS.CONFIG = ESS.CONFIG or {}

ESS.CONFIG.Theme = {
    amBackground = Color( 30, 30, 30, 250 ),
    amPrimary = Color( 43, 43, 43, 255),
    amSecondary = Color( 46, 46, 46, 255),
    amSecondaryLine = Color( 60, 60, 60, 255),
    amNavbarBtnActive = Color( 45, 100, 235, 255),
    amTextHead = Color( 129, 129, 129, 255 ), -- header
    amTextNavbarBtn = Color( 138, 138, 138, 255 ),
    amTextNavbarBtnActive = Color( 45, 100, 235, 255 ),
}

ESS.CONFIG.SpawnableEnts = {
    ["sent_ball"] = {
        delay = 200, -- amounts of seconds in delay
        currentDelay = 0, -- leave this at 0
        active = true, -- set true to only one, this will be the active by default
    }, 

    ["item_rpg_round"] = {
        delay = 200, -- amounts of seconds in delay
        currentDelay = 0, -- leave this at 0
        active = false,
    }, 
}
