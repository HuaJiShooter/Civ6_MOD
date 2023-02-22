function ChangeGoldBalanceFromConquest (value, ChangeAmount)
	
	local pPlayer = Players[value]
	pPlayer:GetTreasury():ChangeGoldBalance(ChangeAmount)
	
end

ExposedMembers.BOCCHIConquest = ExposedMembers.BOCCHIConquest or {}
ExposedMembers.BOCCHIConquest.ChangeGoldBalanceFromConquest = ChangeGoldBalanceFromConquest