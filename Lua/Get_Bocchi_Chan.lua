-----------------------------------------------
-- 此段代码部分来自Phantagonist的唐玄宗李隆基模组中，恰好玩法撞上了就借用了代码
-----------------------------------------------
function HITORIMusic(playerID, cityID, iX, iY)
	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local sCivic =  pPlayerConfig:GetCivilizationTypeName()
	local bCivic = sCivic == 'CIVILIZATION_BOCCHI_THE_ROCK'  --这里写孤独摇滚的文明名
		
	if bCivic then

		local pPlayers=Players[playerID];
		if (pPlayers:GetCities():GetCount() == 1) then
			local individual = GameInfo.GreatPersonIndividuals["GREAT_PERSON_INDIVIDUAL_KOTOU_HITORI_1"].Hash;
			local class = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_MUSICIAN"].Hash;
			local era = GameInfo.Eras["ERA_ANCIENT"].Hash;
			local cost = 0;
			Game.GetGreatPeople():GrantPerson(individual, class, era, cost, playerID, false);
		end
	end
end


GameEvents.CityBuilt.Add(HITORIMusic)