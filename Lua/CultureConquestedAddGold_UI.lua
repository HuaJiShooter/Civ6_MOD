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
			local PlayerNumber = 0.0
		
			for rowOtherCivIndex in pairs(AlivePlayerList) do
				local OtherCivIndex = rowOtherCivIndex - 1
				local OtherCiv = Players[OtherCivIndex]
				local NumStaycationers = OtherCiv:GetCulture():GetStaycationers()
				PlayerNumber = PlayerNumber + 1.0
				
				if NumStaycationers < NumVisitingUs then
					local OtherCivYield = OtherCiv:GetTreasury():GetGoldYield()
					local ChangeAmount = math.floor(OtherCivYield*(0.5/PlayerNumber))
					ExposedMembers.BOCCHIConquest.ChangeGoldBalanceFromConquest(value, ChangeAmount)
				end
			end
		end
	end
end


					
					
Events.TurnEnd.Add(CultureConquestedAddGold)