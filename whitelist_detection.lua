-- Table containing whitelisted Roblox usernames
local whitelist = {
    "JustTrxshlol",  -- Add more usernames as needed
    
}

-- Function to check if a player is in the whitelist
local function isWhitelisted(playerName)
    for _, username in ipairs(whitelist) do
        if playerName == username then
            return true
        end
    end
    return false
end

-- Function to detect if a player is in the game and print their whitelist status
local function checkPlayersInGame()
    for _, player in ipairs(game.Players:GetPlayers()) do
        local isPlayerWhitelisted = isWhitelisted(player.Name)
        if isPlayerWhitelisted then
            print(player.Name .. " is whitelisted.")
        else
            print(player.Name .. " is not whitelisted.")
        end
    end
end

-- Run the check for players in the game
checkPlayersInGame()

-- Listen for new players joining and check their whitelist status
game.Players.PlayerAdded:Connect(function(player)
    if isWhitelisted(player.Name) then
        print(player.Name .. " has joined the game and is whitelisted.")
    else
        print(player.Name .. " has joined the game but is not whitelisted.")
    end
end)
