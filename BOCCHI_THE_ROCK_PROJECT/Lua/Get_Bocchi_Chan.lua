-----------------------------------------------
-- 此段代码部分来自Phantagonist的唐玄宗李隆基模组中，恰好玩法撞上了就借用了代码
-----------------------------------------------
function HITORIMusic(player1ID, player2ID)
	local pPlayer = Players[player1ID]
	local pPlayerConfig = PlayerConfigurations[player1ID]
	local sCivic =  pPlayerConfig:GetCivilizationTypeName()
	local bCivic = sCivic == 'CIVILIZATION_BOCCHI_THE_ROCK'  --这里写孤独摇滚的文明名
	local MetCivilizationAmount = 0
	local AlivePlayerList = PlayerManager.GetAlive()
		
	if bCivic then
		
		
		for rowvalue in pairs(AlivePlayerList) do
			value = rowvalue - 1
			if pPlayer:GetDiplomacy():HasMet(value) and Players[value]:IsMajor() then
				MetCivilizationAmount = MetCivilizationAmount + 1
			end
		end

		local pPlayers=Players[player1ID];
		if (MetCivilizationAmount == 1) then
			local individual = GameInfo.GreatPersonIndividuals["GREAT_PERSON_INDIVIDUAL_KOTOU_HITORI_1"].Hash;
			local class = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_MUSICIAN"].Hash;
			local era = GameInfo.Eras["ERA_ANCIENT"].Hash;
			local cost = 0;
			Game.GetGreatPeople():GrantPerson(individual, class, era, cost, player1ID, false);
		end
	end
end


Events.DiplomacyMeetMajors.Add(HITORIMusic)