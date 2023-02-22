function ChangeYieldFromTourism (value, TourismThisRound)

			
	local pPlayer = Players[value]
	local ChangeAmount = TourismThisRound * 0.5  --这里是旅游业绩转化的数值百分比
	pPlayer:GetTreasury():ChangeGoldBalance(ChangeAmount)
	pPlayer:GetCulture():ChangeCurrentCulturalProgress(ChangeAmount)
	pPlayer:GetTechs():ChangeCurrentResearchProgress(ChangeAmount)
			
end

ExposedMembers.BOCCHITourism = ExposedMembers.BOCCHITourism or {}
ExposedMembers.BOCCHITourism.ChangeYieldFromTourism = ChangeYieldFromTourism