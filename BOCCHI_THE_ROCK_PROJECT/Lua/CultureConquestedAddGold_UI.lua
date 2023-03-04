---‘› ±Œ¥≤‚ ‘


function CauculateConquestedAddGold(value)
	
	local AlivePlayerList = PlayerManager.GetAlive()
	local ChangeAmount = 0

			
	local pPlayer = Players[value]
	local NumVisitingUs = pPlayer:GetCulture():GetTouristsTo()
	local PlayerNumbersNow = 0.0

	for rowOtherCivIndex in pairs(AlivePlayerList) do
		local OtherCivIndex = rowOtherCivIndex - 1
		if Players[OtherCivIndex]:IsMajor() and value ~= OtherCivIndex then
			PlayerNumbersNow = PlayerNumbersNow + 1.0
		end
	end
			
	for rowOtherCivIndex in pairs(AlivePlayerList) do
		local OtherCivIndex = rowOtherCivIndex - 1
		local OtherCiv = Players[OtherCivIndex]
		if OtherCiv:IsMajor() then
			local NumStaycationers = OtherCiv:GetCulture():GetStaycationers()
				
			if NumStaycationers < NumVisitingUs then
				local OtherCivYield = OtherCiv:GetTreasury():GetGoldYield()
				ChangeAmount = ChangeAmount + OtherCivYield*(1.0/PlayerNumbersNow)
			end
		end
	end
	return math.floor(ChangeAmount)
end


function CultureConquestedAddGoldTurnEnd()
	local AlivePlayerList = PlayerManager.GetAlive()
	
	for rowvalue in pairs(AlivePlayerList) do
	
		local value = rowvalue - 1
		local pPlayerConfig = PlayerConfigurations[value]
		local sLeader =  pPlayerConfig:GetLeaderTypeName()
		local bLeader = sLeader == 'Leader_RYO'
		
		if bLeader then

			local ChangeAmount = CauculateConquestedAddGold(value)
			ExposedMembers.RYOConquest.ChangeGoldBalanceFromConquest(value, ChangeAmount)

		end
	end
end


function CultureConquestedAddGoldTurnBegin()
	local AlivePlayerList = PlayerManager.GetAlive()


	for rowvalue in pairs(AlivePlayerList) do
	
		local value = rowvalue-1
		local pPlayerConfig = PlayerConfigurations[value]
		local sLeader =  pPlayerConfig:GetLeaderTypeName()
		local bLeader = sLeader == 'Leader_RYO'
		
		if bLeader then
			
			local ChangeAmount = CauculateConquestedAddGold(value)
			ExposedMembers.RYOConquest.PlayerSettingBOCCHI(value, ChangeAmount)
			
		end
	end
end


					
					
Events.TurnEnd.Add(CultureConquestedAddGoldTurnEnd)
Events.LoadGameViewStateDone.Add(CultureConquestedAddGoldTurnBegin)