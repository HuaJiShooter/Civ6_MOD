local sTrait = "LEADER_BOCCHI"

function bItsHitori(value, sTrait)
	local leaderType = PlayerConfigurations[value]:GetLeaderTypeName()
	local pPlayer = Players[value]
	if pPlayer ~= nil then
		if leaderType == sTrait then
				return true
		end
	end
	return false
end


function BOCCHI_Inspiration(playerID, unitID, iCityPlotX, iCityPlotY, buildingID, greatWorkID)
	if bItsHitori(playerID, sTrait) then
		
		local pPlayer = Players[playerID]
		local PlayerCurrentEra = pPlayer:GetEra()
		
		if PlayerCurrentEra == 0 then
			pPlayer:AttachModifierByID("MODIFIER_CIVICBOOST_ANCIENT")
		end
		
		if PlayerCurrentEra == 1 then
			pPlayer:AttachModifierByID("MODIFIER_CIVICBOOST_CLASSICAL")
		end
		
		if PlayerCurrentEra == 2 then
			pPlayer:AttachModifierByID("MODIFIER_CIVICBOOST_MEDIEVAL")
		end
		
		if PlayerCurrentEra == 3 then
			pPlayer:AttachModifierByID("MODIFIER_CIVICBOOST_RENAISSANCE")
		end
		
		if PlayerCurrentEra == 4 then
			pPlayer:AttachModifierByID("MODIFIER_CIVICBOOST_INDUSTRIAL")
		end
		
		if PlayerCurrentEra == 5 then
			pPlayer:AttachModifierByID("MODIFIER_CIVICBOOST_MODERN")
		end
		
		if PlayerCurrentEra == 6 then
			pPlayer:AttachModifierByID("MODIFIER_CIVICBOOST_ATOMIC")
		end
		
		if PlayerCurrentEra == 7 then
			pPlayer:AttachModifierByID("MODIFIER_CIVICBOOST_INFORMATION")
		end
		
		if PlayerCurrentEra == 8 then
			pPlayer:AttachModifierByID("MODIFIER_CIVICBOOST_FUTURE")
		end
	end
end





Events.GreatWorkCreated.Add(BOCCHI_Inspiration)