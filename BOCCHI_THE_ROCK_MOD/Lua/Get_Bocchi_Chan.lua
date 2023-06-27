-----------------------------------------------
-- 此段代码部分来自Phantagonist的唐玄宗李隆基模组中，恰好玩法撞上了就借用了代码
-----------------------------------------------

--先获取文明
function MeetCountGameBegin()
	local AlivePlayerList = PlayerManager.GetAlive()


	for rowvalue in pairs(AlivePlayerList) do
	
		local value = rowvalue-1
		local pPlayerConfig = PlayerConfigurations[value]
		local sCivic =  pPlayerConfig:GetCivilizationTypeName()
		local bCivic = sCivic == 'CIVILIZATION_BOCCHI_THE_ROCK'		--如果是孤独摇滚文明则进入以下分支
		
		if bCivic then
			--通过遍历获得孤独摇滚相遇文明的数量
			local pPlayer = Players[value]
			local MetCivilizationAmount = 0
			for rowvalueONE in pairs(AlivePlayerList) do		--遍历每个文明
				local valueONE = rowvalueONE - 1
				if pPlayer:GetDiplomacy():HasMet(valueONE) and Players[valueONE]:IsMajor() then		--如果和文明相遇并且这个文明是主要文明，相遇文明数量就加一
					MetCivilizationAmount = MetCivilizationAmount + 1
				end
			end
			
			--将获取遍历得到的遇见文明数量BocchiHasMet加入玩家属性中
			if pPlayer.BocchiHasMet == nil then
				table.insert(Players[value], "BocchiHasMet")
				Players[value].BocchiHasMet = MetCivilizationAmount
			end
			
		end
	end
end


function HITORIMusic(player1ID, player2ID)			--有文明相遇时触发该函数
	local pPlayer = Players[player1ID]
	local pPlayerConfig = PlayerConfigurations[player1ID]
	local sCivic =  pPlayerConfig:GetCivilizationTypeName()
	local bCivic = sCivic == 'CIVILIZATION_BOCCHI_THE_ROCK'  --这里写孤独摇滚的文明名
	local MetCivilizationAmount = 0			--默认相遇文明为0
	local AlivePlayerList = PlayerManager.GetAlive()
		
	if bCivic then 	--当相遇的文明是孤独摇滚文明时进入以下程序分支
		
		
		for rowvalue in pairs(AlivePlayerList) do		--遍历每个文明
			value = rowvalue - 1
			if pPlayer:GetDiplomacy():HasMet(value) and Players[value]:IsMajor() then		--如果和文明相遇并且这个文明是主要文明，相遇文明数量就加一
				MetCivilizationAmount = MetCivilizationAmount + 1
			end
		end


		if (pPlayer.BocchiHasMet == 0 and MetCivilizationAmount > 0) then 			--当孤独摇滚文明文明相遇数量从0变到0以上时
			local individual = GameInfo.GreatPersonIndividuals["GREAT_PERSON_INDIVIDUAL_KOTOU_HITORI_1"].Hash;
			local class = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_MUSICIAN"].Hash;
			local era = GameInfo.Eras["ERA_ANCIENT"].Hash;
			local cost = 0;
			Game.GetGreatPeople():GrantPerson(individual, class, era, cost, player1ID, false);
		end

		pPlayer.BocchiHasMet = MetCivilizationAmount
	end
end


Events.DiplomacyMeetMajors.Add(HITORIMusic)
Events.LoadGameViewStateDone.Add(MeetCountGameBegin)
Events.TurnEnd.Add(MeetCountGameBegin)