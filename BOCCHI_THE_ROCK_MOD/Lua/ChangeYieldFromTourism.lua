function ChangeYieldFromTourism(value, TourismThisRound)
	
	local ChangeAmount = math.floor(TourismThisRound * 0.3)  --这里是旅游业绩转化的数值百分比
	
	ChangeYieldBOCCHI(value, ChangeAmount, "YIELD_CULTURE")
	ChangeYieldBOCCHI(value, ChangeAmount, "YIELD_SCIENCE")
	ChangeYieldBOCCHI(value, ChangeAmount, "YIELD_GOLD")
	
	Players[value].ModifierAmountNow = ChangeAmount
end


function GameStartPlayerSettingBOCCHI(value, TourismThisRound)
	local pPlayer = Players[value]
	if pPlayer.ModifierAmountNow == nil then
		table.insert(Players[value], "ModifierAmountNow")
		Players[value].ModifierAmountNow = math.floor(TourismThisRound * 0.3)
	end
end

function ChangeYieldBOCCHI (value, Amount, YIELD_TYPE:string)
	local pPlayer = Players[value]
	local ModifierAddId:string = "CAPITALCITY_ADDLITTLE_" .. YIELD_TYPE
	local ModifierReduceId:string = "CAPITALCITY_REDUCELITTLE_" .. YIELD_TYPE
	
	if Amount >= 0 then
		
		for var = Players[value].ModifierAmountNow, 0, -1 do
			pPlayer:AttachModifierByID(ModifierReduceId)
		end
	
		for var = 0, Amount, 1 do
			pPlayer:AttachModifierByID(ModifierAddId)
		end
		
	end
	
end



ExposedMembers.BOCCHITourism = ExposedMembers.BOCCHITourism or {}
ExposedMembers.BOCCHITourism.ChangeYieldFromTourism = ChangeYieldFromTourism
ExposedMembers.BOCCHITourism.GameStartPlayerSettingBOCCHI = GameStartPlayerSettingBOCCHI