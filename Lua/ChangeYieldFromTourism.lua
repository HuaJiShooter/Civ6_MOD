function ChangeYieldFromTourism (value, TourismThisRound)
	Game.AddWorldViewText(0,'Play Successfuly', 69, 9)

			
	local pPlayer = Players[value]
	local ChangeAmount = TourismThisRound * 0.5  --这里是旅游业绩转化的数值百分比
	Game.AddWorldViewText(0,tostring(TourismThisRound), 69, 9)
	pPlayer:GetTreasury():ChangeGoldBalance(ChangeAmount)
	pPlayer:GetCulture():ChangeCurrentCulturalProgress(ChangeAmount)
	pPlayer:GetTechs():ChangeCurrentResearchProgress(ChangeAmount)
			
end

ExposedMembers.BOCCHITourism = ExposedMembers.BOCCHITourism or {}
ExposedMembers.BOCCHITourism.ChangeYieldFromTourism = ChangeYieldFromTourism