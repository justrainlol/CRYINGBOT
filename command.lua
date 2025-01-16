-- Import the whitelist detection from the other file
local whitelistDetectionUrl = "https://raw.githubusercontent.com/justrainlol/CRYINGBOT/refs/heads/main/whitelist_detection.lua"
local whitelist = loadstring(game:HttpGet(whitelistDetectionUrl))()

-- Table to store commands
local commands = {
    ["kill"] = function(playerName)
        -- Print a message when the kill command is received
        print("Command received: .kill " .. playerName)
        -- Placeholder for kill code, replace with your logic later
        -- For example, you could teleport the player somewhere, or reduce health to 0 (if they are in the game)
        -- You can add your kill logic here once you're ready
    end
}

-- Function to listen for chat messages and check for whitelisted players
local function listenForCommands()
    game.Players.PlayerAdded:Connect(function(player)
        -- Listen for chat messages from this player
        player.Chatted:Connect(function(message)
            -- Check if the player is whitelisted before proceeding
            if whitelist[player.Name] then
                -- Check if the message is a command
                local command, targetPlayer = string.match(message, "^%.([%w_]+) (.+)$")
                
                -- If the message is a valid command, execute it
                if command and targetPlayer then
                    -- Check if the command exists in the commands table
                    if commands[command] then
                        -- Execute the command with the target player as an argument
                        commands[command](targetPlayer)
                    else
                        print("Command not found.")
                    end
                else
                    print("Invalid command format or missing player name.")
                end
            else
                print(player.Name .. " is not whitelisted and cannot use commands.")
            end
        end)
    end)
end

-- Call the function to start listening for commands
listenForCommands()
