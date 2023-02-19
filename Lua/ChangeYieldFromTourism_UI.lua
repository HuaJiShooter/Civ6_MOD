function GetTurnsTourism()
	--判断是否是孤独摇滚文明
	local AlivePlayerList = PlayerManager.GetAlive()


	for rowvalue in pairs(AlivePlayerList) do
	
		local value = rowvalue-1
		local pPlayerConfig = PlayerConfigurations[value]
		local sCivic =  pPlayerConfig:GetCivilizationTypeName()
		local bCivic = sCivic == 'CIVILIZATION_BOCCHI_THE_ROCK'  --这里写孤独摇滚的文明名
		
		if bCivic then
			
			local pPlayer = Players[value]
			TourismThisRound = pPlayer:GetStats():GetTourism()
			ExposedMembers.BOCCHITourism.ChangeYieldFromTourism(value, TourismThisRound)	--调用修改的函数
			
		end
	
	end
	
end

Events.TurnEnd.Add(GetTurnsTourism)