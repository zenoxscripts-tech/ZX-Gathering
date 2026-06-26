print("ZX-Gathering by ZX Scripts Discord: https://discord.gg/akkgn8crZy")
local cooldown = {}

RegisterNetEvent("ZX-Gathering:progressFinished")
AddEventHandler("ZX-Gathering:progressFinished", function(i, job)
    local loc = Config.Locations[i]

    if not loc then
        return
    end

    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    local distance = #(playerCoords - Config.Locations[i].coord)
    
    if distance > job.MarkerDistance then
        return
    end

    local now = GetGameTimer()
    local src = source

    if not cooldown[src] then
        cooldown[src] = {}
    end

    if cooldown[src][i] and (now - cooldown[src][i]) < job.cooldown then
        return
    end

    if Config.Settings.inventory == "tgiann-inventory" then
        local itemCount = exports["tgiann-inventory"]:GetItemCount(item)

        if itemCount < 1 then
            return 
        end 
    end
    
    if Config.Settings.inventory == "ox_inventory" then
        local itemCountOx = exports.ox_inventory:Search('count', item)

        if itemCountOx < 1 then
            return 
        end  
    end

    if Config.Settings.inventory == "tgiann-inventory" then
        local currentTool = exports["tgiann-inventory"]:GetCurrentWeapon()

        if not currentTool or currentTool.name ~= item then
            return 
        end  
    end 
    
    if Config.Settings.inventory == "ox_inventory" then
        local currentToolOx = exports.ox_inventory:getCurrentWeapon()

        if not currentToolOx or currentToolOx.name ~= item then
            return 
        end       
    end

    local count = math.random(job.itemCountMin, job.itemCountMax)

    if Config.Settings.inventory == "tgiann-inventory" then 
        exports["tgiann-inventory"]:AddItem(src, job.item, count)
    end

    if Config.Settings.inventory == "ox_inventory" then 
        exports.ox_inventory:AddItem(src, job.item, count)
    end    

    cooldown[src][i] = now

    TriggerClientEvent("ZX-Gathering:successNotify", src, job)

end)