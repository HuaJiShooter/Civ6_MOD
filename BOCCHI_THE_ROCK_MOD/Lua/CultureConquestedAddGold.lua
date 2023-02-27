function ChangeGoldBalanceFromConquest (value, ChangeAmount)
	
	local pPlayer = Players[value]
	CultureConquestChangeBOCCHI (value, ChangeAmount)
	Players[value].GoldModifierAmountNow = ChangeAmount
	
end


function PlayerSettingBOCCHI(value, AmountNow)
	local pPlayer = Players[value]
	if pPlayer.GoldModifierAmountNow == nil then
		table.insert(Players[value], "GoldModifierAmountNow")
		Players[value].GoldModifierAmountNow = AmountNow
	end
end

function CultureConquestChangeBOCCHI (value, Amount)
	local pPlayer = Players[value]
	
	if Amount >= 0 then
		
		for var = Players[value].GoldModifierAmountNow, 0, -1 do
			pPlayer:AttachModifierByID("CAPITALCITY_REDUCELITTLE_YIELD_GOLD")
		end
	
		for var = 0, Amount, 1 do
			pPlayer:AttachModifierByID("CAPITALCITY_ADDLITTLE_YIELD_GOLD")
		end
	end
end

ExposedMembers.BOCCHIConquest = ExposedMembers.BOCCHIConquest or {}
ExposedMembers.BOCCHIConquest.ChangeGoldBalanceFromConquest = ChangeGoldBalanceFromConquest
ExposedMembers.BOCCHIConquest.PlayerSettingBOCCHI = PlayerSettingBOCCHI