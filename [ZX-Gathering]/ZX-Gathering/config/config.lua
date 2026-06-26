Config = {}

Config.Locations = {
    {
        type = "lumberjack",
        coord = vector3(-553.3873, 5445.1182, 63.3520),
    },
    {
        type = "lumberjack",
        coord = vector3(-578.2234, 5427.9609, 58.9978),
    },
    {
        type = "lumberjack",
        coord = vector3(-585.6754, 5447.4717, 60.3394),
    },
    {
        type = "lumberjack",
        coord = vector3(-615.2553, 5433.7261, 53.5124),
    },
    {
        type = "lumberjack",
        coord = vector3(-598.2299, 5473.2075, 56.3119),
    },
    {
        type = "lumberjack",
        coord = vector3(-584.9240, 5490.4038, 55.5905),
    },
    {
        type = "lumberjack",
        coord = vector3(-567.6451, 5502.3374, 57.4721),
    },
    {
        type = "lumberjack",
        coord = vector3(-539.2492, 5483.6367, 65.3480),
    },
    {
        type = "lumberjack",
        coord = vector3(-642.4577, 5460.6470, 53.5020),
    },  
    {
        type = "lumberjack",
        coord = vector3(-563.4023, 5456.8306, 63.0484),
    },
    {
        type = "lumberjack",
        coord = vector3(-619.3171, 5498.3193, 51.2698),
    },     
    {
        type = "lumberjack",
        coord = vector3(-625.1649, 5474.2373, 53.3072),
    },  
    {
        type = "miner",
        coord = vector3(2977.1731, 2742.3965, 44.4141),
    },
    {
        type = "miner",
        coord = vector3(2997.7119, 2751.1414, 44.2113),
    },  
    {
        type = "miner",
        coord = vector3(2946.9314, 2725.6860, 47.7731),
    },  
    {
        type = "miner",
        coord = vector3(2935.2900, 2741.5588, 44.3222),
    },  

}

Config.Jobs = {
    lumberjack = {
        MarkerDistance = 5.0,
        InteractDistance = 1.0,
        item = "wood",
        itemCountMin = 4,
        itemCountMax = 6,
        tool = "weapon_battleaxe", 
        cooldown = 750000,
        textUI = "[E] Iseci drvo",
        progresTime = 5000,
        progresLabel = "Seces drvo...",
        -- Notify Text
        notifyText_1 = "Treba ti Axe da bi posekao stablo.",
        notifyText_2 = "Moras drzati Axe u ruci.",
        notifyText_3 = "Oh oh, pogresio si!",
        notifyText_4 = "Oh oh, prekinuo si akciju!",
        notifyText_5 = "Posekao si drvo.",
        notifyText_6 = "Sacekaj jos: ",

    --[[
        notifyText_1 = "You need an Axe to cut down this tree.",
        notifyText_2 = "You must be holding an Axe.",
        notifyText_3 = "Uh oh, you made a mistake!",
        notifyText_4 = "Uh oh, you canceled the action!",
        notifyText_5 = "The tree has been cut down.",
        notifyText_6 = "Time remaining: ",

    ]]
        -- Blip 
        blipText = "Lumberjack Tree",
        blipSprite = 153,
        blipScale = 0.6,
        blipColour = 3

    },
    miner = {
        MarkerDistance = 5.0,
        InteractDistance = 1.0,
        item = "rock",
        itemCountMin = 4,
        itemCountMax = 6,
        tool = "weapon_pickaxe", 
        cooldown = 750000,
        textUI = "[E] Iskopaj kamen",
        progresTime = 5000,
        progresLabel = "Kopas kamen...",
        -- Notify Text
        notifyText_1 = "Treba ti Pickaxe da bi rudario.",
        notifyText_2 = "Moras drzati Pickaxe u ruci.",
        notifyText_3 = "Oh oh, pogresio si!",
        notifyText_4 = "Oh oh, prekinuo si akciju!",
        notifyText_5 = "Iskopao si kamen.",
        notifyText_6 = "Sacekaj jos: ",
    --[[
        notifyText_1 = "You need a Pickaxe to mine.",
        notifyText_2 = "You must be holding a Pickaxe.",
        notifyText_3 = "Uh oh, you made a mistake!",
        notifyText_4 = "Uh oh, you canceled the action!",
        notifyText_5 = "You mined a rock.",
        notifyText_6 = "Time remaining: ",

    ]]
        -- Blip 
        blipText = "Miner Rock",
        blipSprite = 85,
        blipScale = 0.6,
        blipColour = 3
    }
}

Config.Settings = {
    inventory = "tgiann-inventory", -- ox_inventory
    sleep = 500
}
    