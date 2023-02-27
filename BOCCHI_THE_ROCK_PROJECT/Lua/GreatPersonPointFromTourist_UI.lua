-- GreatPersonPointFromTourist
-- Author: 14830
-- DateCreated: 2/27/2023 2:01:32 PM
--------------------------------------------------------------
function InternationalTouristChanged()

	local AlivePlayerList = PlayerManager.GetAlive()

	for rowvalue in pairs(AlivePlayerList) do
	
		local value = rowvalue-1
		local pPlayerConfig = PlayerConfigurations[value]
		local sCivic =  pPlayerConfig:GetCivilizationTypeName()
		local pPlayer = Players[value]
		local bCivic = sCivic == 'CIVILIZATION_BOCCHI_THE_ROCK'
		
		if bCivic then
			
			-- 如果是孤独摇滚文明
			local NumVisitingUs = pPlayer:GetCulture():GetTouristsTo()
			ExposedMembers.BOCCHITourism.GreatPersonPointFromTourist(value, NumVisitingUs)
			
		end
	end
end


Events.TurnBegin.Add(InternationalTouristChanged)