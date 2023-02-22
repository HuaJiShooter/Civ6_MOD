function CultureConquestedAddGold()
	
	local AlivePlayerList = PlayerManager.GetAlive()
	
	for rowvalue in pairs(AlivePlayerList) do
	
		local value = rowvalue - 1
		local pPlayerConfig = PlayerConfigurations[value]
		local sCivic =  pPlayerConfig:GetCivilizationTypeName()
		local bCivic = sCivic == 'CIVILIZATION_BOCCHI_THE_ROCK'
		
		if bCivic then
			
			local NumVisitingUs = pPlayer:GetCulture():GetTouristsTo()
			pPlayer = Players[value]
		
			for rowOtherCivIndex in pairs(AlivePlayerList) do
				local OtherCivIndex = rowOtherCivIndex - 1
				local OtherCiv = Players[OtherCivIndex]
				local NumStaycationers = OtherCiv:GetCulture():GetStaycationers()
				
				if NumStaycationers < NumVisitingUs then
					local OtherCivYield = OtherCiv:GetTreasury():GetGoldYield()
					local ChangeAmount = OtherCivYield*0.1
					ExposedMembers.BOCCHIConquest.ChangeGoldBalanceFromConquest(value, ChangeAmount)
				end
			end
		end
	end
end
					
					
Events.TurnEnd.Add(CultureConquestedAddGold)