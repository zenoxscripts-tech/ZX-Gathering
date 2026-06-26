local isTextUiVisible = false
local inZoni = false
local cooldown = {}

CreateThread(function()
    while true do 
        inZoni = false
        local sleep = Config.Settings.sleep 
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for i = 1, #Config.Locations do 
            local loc = Config.Locations[i]
            local jobType = Config.Jobs[loc.type]
            local distance = #(playerCoords - loc.coord)

            if distance <= jobType.MarkerDistance then
                sleep = 0 
            end

            HandleLocInteraction(i, loc, jobType, distance)
        end

        hideTextUI()
        Wait(sleep)

    end
end)

function DrawMyMarker(x, y, z)
    DrawMarker(
        0,
        x, y, z,
        0.0, 0.0, 0.0,
        0.0, 0.0, 0.0,
        0.4, 0.4, 0.4,
        37, 99, 235, 150,
        false, true, 2, false, nil, nil, false
    )
end

function ShowTextUI(text)
    if not isTextUiVisible then
        isTextUiVisible = true
        lib.showTextUI(text)
    end
end        

function hideTextUI()
    if not inZoni and isTextUiVisible then
        lib.hideTextUI()
        isTextUiVisible = false
    end
end

function libNotify(title, description, type)
    lib.notify({
        title = title,
        description = description,
        type = type
    })  
end

function HandleLocInteraction(locationIndex, loc, job, distance)
    if distance < job.MarkerDistance then
        inZoni = true

        local t = loc.coord

        DrawMyMarker(t.x, t.y, t.z)

        if distance < job.InteractDistance then
            ShowTextUI(job.textUI)

            StartAction(locationIndex, job)                            
        end
    end
end

function IsCooldownFinished(locationIndex, now, localtioCooldown)

    if cooldown[locationIndex] and (now - cooldown[locationIndex]) < localtioCooldown then
        local cooldownRemaining = math.floor((localtioCooldown - (now - cooldown[locationIndex])) / 1000)
        libNotify("Error", job.notifyText_6 .. cooldownRemaining .. " sec.", "error")
        return false
    end   

    return true
end

function IsSkillCheckFinished()
    local miniGame = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'a', 's', 'd'})
    
    if not miniGame then
        return false
    end

    return true 
end


function IsProgressBarFinished(duration, label, dict, clip)
    local progres = lib.progressBar({
        duration = duration,
        label = label,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = dict,
            clip = clip
        },
        prop = nil
    })      

    if not progres then
        return false
    end 

    return true
end


function StartAction(locationIndex, job)
    if IsControlJustReleased(0, 38) then 
        local now = GetGameTimer()

        if not IsCooldownFinished(locationIndex, now, job.cooldown) then
            return
        end

        if not HasRequiredWeapon(job.tool) then
            libNotify("Error", job.notifyText_1, "error")
            return
        end

        if not HasCurrentdWeapon(job.tool) then
            libNotify("Error", job.notifyText_2, "error")
            return 
        end

        if not IsSkillCheckFinished() then
            libNotify("Error", job.notifyText_3, "error")
            return
        end
                                        
        if not IsProgressBarFinished(job.progresTime, job.progresLabel, "melee@hatchet@streamed_core", "plyr_front_takedown") then
            libNotify("Error", job.notifyText_4, "error")
            return
        end
                            
        TriggerServerEvent("ZX-Gathering:progressFinished", locationIndex, job)

        cooldown[locationIndex] = now      
    end 
end

function HasRequiredWeapon(item)
    if Config.Settings.inventory == "tgiann-inventory" then
        local itemCount = exports["tgiann-inventory"]:GetItemCount(item)

        if itemCount < 1 then
            return false
        end         
    end

    if Config.Settings.inventory == "ox_inventory" then
        local itemCountOx = exports.ox_inventory:Search('count', item)

        if itemCountOx < 1 then
            return false
        end  
    end

    return true
end 

function HasCurrentdWeapon(item)
    if Config.Settings.inventory == "tgiann-inventory" then
        local currentTool = exports["tgiann-inventory"]:GetCurrentWeapon()

        if not currentTool or currentTool.name ~= item then
            return false
        end       
    end

    if Config.Settings.inventory == "ox_inventory" then
        local currentToolOx = exports.ox_inventory:getCurrentWeapon()

        if not currentToolOx or currentToolOx.name ~= item then
            return false
        end       
    end

    return true
end

RegisterNetEvent("ZX-Gathering:successNotify")
AddEventHandler("ZX-Gathering:successNotify", function(job)
    libNotify("success", job.notifyText_5, "success")
end)

for i = 1, #Config.Locations do
    local location = Config.Locations[i]
    local jobType = Config.Jobs[location.type]

    local blip = AddBlipForCoord(location.coord)

    SetBlipSprite(blip, jobType.blipSprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, jobType.blipScale)
    SetBlipColour(blip, jobType.blipColour)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(jobType.blipText)
    EndTextCommandSetBlipName(blip)
end
