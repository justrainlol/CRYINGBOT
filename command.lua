-- Make sure to require the whitelist detection script (this will be in the other script)
local whitelistDetection = require(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/justrainlol/CRYINGBOT/refs/heads/main/whitelist_detection.lua"))

-- Listen for chat messages
game.Players.PlayerAdded:Connect(function(player)
    -- Wait for the player to send a message
    player.Chatted:Connect(function(message)
        -- Check if the message starts with .runtest
        if message:lower() == ".runtest" then
            -- Check if the player is in the whitelist
            if whitelistDetection.isWhitelisted(player.Name) then
                -- If they are whitelisted, print RECEIVED
                print("(RECEIVED)")
            end
        end
    end)
end)
