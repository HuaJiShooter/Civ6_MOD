-- GreatPerosonPointFromTourist
-- Author: 14830
-- DateCreated: 2/27/2023 2:00:32 PM
--------------------------------------------------------------
function GreatPersonPointFromTourist(PlayerID,TouristAmount)
	TurnStartPlayerSettingBOCCHI(PlayerID,TouristAmount)
	local pPlayer = Players[PlayerID]

	if TouristAmount > pPlayer.TouristAmountBefore then
		local ChangeAmount = (TouristAmount - pPlayer.TouristAmountBefore)*30
		local pPlayerCapitalcity = pPlayer:GetCities():GetCapitalCity()
		local iCityX = pPlayerCapitalcity:GetX()
		local iCityY = pPlayerCapitalcity:GetY()

		pPlayer:GetGreatPeoplePoints():ChangePointsTotal(8,ChangeAmount)
		Players[PlayerID].TouristAmountBefore = TouristAmount
		Game.AddWorldViewText(0,"Musician Point + ".. tostring(ChangeAmount),iCityX,iCityY)
	end
	
end


function TurnStartPlayerSettingBOCCHI(PlayerID, TouristAmount)
	local pPlayer = Players[PlayerID]

	if pPlayer.TouristAmountBefore == nil then
		table.insert(Players[PlayerID], "TouristAmountBefore")
		Players[PlayerID].TouristAmountBefore = TouristAmount
	end

end



ExposedMembers.BOCCHITourism = ExposedMembers.BOCCHITourism or {}
ExposedMembers.BOCCHITourism.GreatPersonPointFromTourist = GreatPersonPointFromTourist