ESX = nil

CreateThread(function()
    while not ESX do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(500)
    end
end)

function showNotification(source, message)
    TriggerClientEvent('esx:showNotification', source, message)
    TriggerClientEvent('chat:addMessage', source, { args = { message }})
end

-- This function will return the amount of money in the player's wallet account
function getWalletMoney(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        return xPlayer.getMoney()
    end  
end

-- This function will remove money from the player's Wallet account
function removeWalletMoney(source, value)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.removeMoney(value)
    end 
end

if config.use_weight_system then
    -- This function will return TRUE if the player has enough space in his inventory
    function canCarryItem(source, weight)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            local my_weight = getWeight(source)
            local my_maxWeight = xPlayer.maxWeight
            local new_weight = my_weight + weight
            if new_weight <= my_maxWeight then
                return true
            end
        end    

        return false
    end
    
else
    -- This function will return TRUE if the player has enough space in his inventory
    function canCarryItem(source, item, _amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        local targetItem = xPlayer.getInventoryItem(item)
        local amount = tonumber(_amount)

        if amount > 0 then
            if targetItem then
                if targetItem.limit ~= -1 and (targetItem.count + amount) > targetItem.limit then
                    return false
                else
                    return true
                end
            else
                return true
            end
        end
        
        return false
    end
end

-- This function will return the player's weigth
function getWeight(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getWeight()
end

-- This function will add an item to the player's inventory
function addInventoryItem(source, item, amount)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.addInventoryItem(item, amount)
    end 
end