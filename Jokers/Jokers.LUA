local addonName = "Jokers"
local addonVersion = "2.3"
local addonEnabled = false
local autoReplyEnabled = true
local autoInviteEnabled = false
local debugMode = false
local whisperedPlayers = {}
local inviteRequestedPlayers = {}

-- Ensure the saved variables table exists and initialize necessary tables
if not JokersDB then
    JokersDB = {}
end

-- Default settings with persistence
JokersDB.advertisementMessage = JokersDB.advertisementMessage or "I am using the Joker's Addon but forgot to set a default message so instead I will be advertising this addon and how awesome it is! Whisper me for more information."
JokersDB.autoReplyMessage = JokersDB.autoReplyMessage or "Joker's Addon simply advertises my guild, autoreplies to people whispering me, and even a setting in which can automatically invite people to my guild! /w Joshua on Icecrown for more information!"
JokersDB.advertisementInterval = JokersDB.advertisementInterval or 60
JokersDB.advertisementChannel = JokersDB.advertisementChannel or "Global"
JokersDB.inviteToGuild = JokersDB.inviteToGuild ~= nil and JokersDB.inviteToGuild or true

-- Debug function to print messages if debug mode is enabled
local function debugPrint(...)
    if debugMode then
        print("|cffa020f0[Jokers Debug]:|r", ...)
    end
end

-- Define trigger phrases for inviting
local inviteTriggers = {
    "invite",
    "invite me",
    "can i join",
    "inv"
}

local function isInviteRequest(msg)
    local lowerMsg = msg:lower()
    for _, trigger in ipairs(inviteTriggers) do
        if lowerMsg == trigger or lowerMsg:find(trigger) then
            return true
        end
    end
    return false
end

local function handleInvite(senderName)
    if JokersDB.inviteToGuild then
        GuildInvite(senderName)
    else
        InviteUnit(senderName)
    end
    debugPrint("Invite sent to:", senderName)
end

local ToggleAddon
local StartAdvertising
local StopAdvertising

local jokerLDB = LibStub("LibDataBroker-1.1"):NewDataObject(addonName, {
    type = "data source",
    text = addonName,
    icon = "Interface\\AddOns\\Jokers\\iconRed.tga",
    OnClick = function(self)
        ToggleAddon()
    end,
})

function StartAdvertising()
    if not JokersAdFrame then
        JokersAdFrame = CreateFrame("Frame")
    end
    JokersAdFrame:Show()
    JokersAdFrame.timeLeft = JokersDB.advertisementInterval
    JokersAdFrame:SetScript("OnUpdate", function(self, elapsed)
        self.timeLeft = self.timeLeft - elapsed
        if self.timeLeft <= 0 then
            local channelID = GetChannelName(JokersDB.advertisementChannel)
            if channelID then
                SendChatMessage(JokersDB.advertisementMessage, "CHANNEL", nil, channelID)
                debugPrint("Advertisement sent to channel:", JokersDB.advertisementChannel)
            end
            self.timeLeft = JokersDB.advertisementInterval
        end
    end)
end

function StopAdvertising()
    if JokersAdFrame then
        JokersAdFrame:Hide()
    end
end

ToggleAddon = function()
    addonEnabled = not addonEnabled
    jokerLDB.icon = addonEnabled and "Interface\\AddOns\\Jokers\\iconGreen.tga" or "Interface\\AddOns\\Jokers\\iconRed.tga"
    LibStub("LibDBIcon-1.0"):Refresh(addonName, JokersDB)
    local colorEnabled = "|cff00ff00"  -- Green for enabled
    local colorDisabled = "|cffff0000"  -- Red for disabled
    local message = addonEnabled and (addonName .. " is now " .. colorEnabled .. "enabled|r.") or (addonName .. " is now " .. colorDisabled .. "disabled|r.")
    
    print(message)
    debugPrint("Addon toggled:", addonEnabled)
    if addonEnabled then
        StartAdvertising()
    else
        StopAdvertising()
    end
end

local function ShowHelp()
    local helpText = {
        "|cff6A5ACD/joker|r - Toggle the addon on or off.",
        "|cff6A5ACD/joker help|r - Show this help message.",
        "|cff6A5ACD/joker reply|r - Toggle the automatic reply feature on or off.",
        "|cff6A5ACD/joker inv|r - Toggle the automatic invite feature on or off.",
        "|cff6A5ACD/joker setmsg \"Your message\"|r - Set the advertisement message.",
        "|cff6A5ACD/joker setreply \"Your message\"|r - Set the auto-reply message.",
        "|cff6A5ACD/joker setinterval X|r - Set the interval (in seconds) between advertisement messages.",
        "|cff6A5ACD/joker setchannel ChannelName|r - Set the channel for advertisements.",
        "|cff6A5ACD/joker debug|r - Toggle debug mode on or off.",
        "|cff6A5ACD/joker toggleinvite|r - Toggle between sending guild or group invites."
    }

    for _, line in ipairs(helpText) do
        print("|cffa020f0[Jokers Help]:|r " .. line)
    end
end

SLASH_JOKERS1 = "/joker"
SlashCmdList["JOKERS"] = function(msg)
    local command, rest = msg:match("^(%S*)%s*(.-)$")
    if command == "on" or command == "" then
        ToggleAddon()
    elseif command == "reply" then
        autoReplyEnabled = not autoReplyEnabled
        print("Auto-reply is now " .. (autoReplyEnabled and "enabled" or "disabled"))
    elseif command == "inv" then
        autoInviteEnabled = not autoInviteEnabled
        print("Auto-invite is now " .. (autoInviteEnabled and "enabled" or "disabled"))
    elseif command == "debug" then
        debugMode = not debugMode
        print("Debug mode is now " .. (debugMode and "enabled" or "disabled"))
    elseif command == "help" then
        ShowHelp()
    elseif command == "setmsg" then
        JokersDB.advertisementMessage = rest
        print("Advertisement message set to: " .. rest)
    elseif command == "setreply" then
        JokersDB.autoReplyMessage = rest
        print("Auto-reply message set to: " .. rest)
    elseif command == "setinterval" then
        local interval = tonumber(rest)
        if interval and interval > 0 then
            JokersDB.advertisementInterval = interval
            print("Advertisement interval set to " .. interval .. " seconds.")
        else
            print("Invalid interval. Please provide a positive number.")
        end
    elseif command == "setchannel" then
        JokersDB.advertisementChannel = rest
        print("Advertisement channel set to: " .. rest)
    elseif command == "toggleinvite" then
        JokersDB.inviteToGuild = not JokersDB.inviteToGuild
        local inviteType = JokersDB.inviteToGuild and "guild" or "group"
        print("Invites are now set to: " .. inviteType)
    else
        print("Unknown command. Type '/joker help' for a list of commands.")
    end
end


local JGHFrame = CreateFrame("Frame", "JokersFrame")
JGHFrame:RegisterEvent("CHAT_MSG_WHISPER")
JGHFrame:RegisterEvent("PLAYER_LOGIN")
JGHFrame:SetScript("OnEvent", function(self, event, msg, sender)
    if event == "PLAYER_LOGIN" then
        print("|cffa020f0[Jokers] v" .. addonVersion .. " has been successfully loaded.|r")
        LibStub("LibDBIcon-1.0"):Register(addonName, jokerLDB, JokersDB)
        jokerLDB.icon = addonEnabled and "Interface\\AddOns\\Jokers\\iconGreen.tga" or "Interface\\AddOns\\Jokers\\iconRed.tga"
        LibStub("LibDBIcon-1.0"):Refresh(addonName)
    elseif event == "CHAT_MSG_WHISPER" and addonEnabled then
        local senderName = strsplit("-", sender)
        if not JokersDB.blacklist[senderName] then
            if autoInviteEnabled and isInviteRequest(msg) and not inviteRequestedPlayers[senderName] then
                if not inviteRequestedPlayers[senderName] then
                    handleInvite(senderName)
                    inviteRequestedPlayers[senderName] = true
                else
                    debugPrint("Invite already requested by:", senderName)
                end
            elseif autoReplyEnabled and not whisperedPlayers[senderName] then
                SendChatMessage(JokersDB.autoReplyMessage, "WHISPER", nil, senderName)
                whisperedPlayers[senderName] = true
                debugPrint("Auto-reply sent to:", senderName)
            end
        end
    end
end)
