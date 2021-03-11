ESS.CONFIG = ESS.CONFIG or {}

ESS.CONFIG.Theme = {
    background = Color( 30, 30, 30, 250 ),
    primary = Color( 42, 42, 42),
    secondary = Color( 46, 46, 46, 255),
    secondaryLine = Color( 60, 60, 60, 255),
    entActive = Color( 45, 100, 235, 255),
    entTextHead = Color( 129, 129, 129, 255 ), -- header
    entText = Color( 138, 138, 138, 255 ),
    entTextActive = Color( 45, 100, 235, 255 ),
}

ESS.CONFIG.SpawnableEnts = {
    ["sent_ball"] = {
        jobs = {
            ["Gun Dealer"] = true,
            ["Citizen"] = true,
        },
        name = "Health Ball",
        delay = 10, -- amounts of seconds in delay
        currentDelay = 0, -- leave this at 0
    }, 

    ["gred_emp_3inchmortar"] = {
        name = "EMP 2A65",
        delay = 10, -- amounts of seconds in delay
        currentDelay = 0,
        jobs = {
            ["Gun Dealer"] = true,
        },
    },
    
    ["gb_bomb_sc1000"] = {
        name = "EMP 2A65",
        delay = 10, -- amounts of seconds in delay
        currentDelay = 0, -- leave this at 0
        jobs = {
            ["Gun Dealer"] = true,
            ["Citizen"] = true,
        },
    },
}
