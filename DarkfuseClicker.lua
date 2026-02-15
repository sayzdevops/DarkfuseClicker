-- NPC ID du Darkfuse Instigator (https://www.wowhead.com/npc=235410)
local INSTIGATOR_NPC_ID = 235410
--- Extrait le NPC ID depuis un GUID WoW
-- Un GUID ressemble à : "Creature-0-1234-2345-6789-235410-00001A2B3C"
-- Le NPC ID est le 6ème segment
local function GetNpcIdFromGuid(guid)
    if not guid then return nil end
    local _, _, _, _, _, npcId = strsplit("-", guid)
    return tonumber(npcId)
end
-- Créer un listener, ici frame
local frame = CreateFrame("Frame")
frame:RegisterEvent("GOSSIP_SHOW")

frame:SetScript("OnEvent", function(self, event)
    -- Vérifier que le NPC ciblé est bien le Darkfuse Instigator
    local guid = UnitGUID("npc")
    if GetNpcIdFromGuid(guid) ~= INSTIGATOR_NPC_ID then return end

    -- Récupérer les options de dialogue disponibles
    local options = C_GossipInfo.GetOptions()
    if not options or #options == 0 then return end

    -- Auto-sélectionner la première option
    C_GossipInfo.SelectOption(options[1].gossipOptionID)
end)
-- Confirmation dans le chat au chargement
print("|cff00ccffDarkfuseClicker|r loaded — auto-gossip on Darkfuse Instigator active")

