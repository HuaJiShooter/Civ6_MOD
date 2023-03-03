-- GreatWorkPlayBackground
-- Author: 14830
-- DateCreated: 3/2/2023 7:25:36 PM
--------------------------------------------------------------
function BocchiGreatWorkPlay(playerID:number, creatorID:number, cityX:number, cityY:number, buildingID:number, greatWorkIndex:number)
	m_isGallery = false
	m_BuildingID = buildingID
	m_GreatWorkIndex = greatWorkIndex
	m_City = Cities.GetCityInPlot(Map.GetPlotIndex(cityX, cityY))
	if m_City ~= nil then

		m_CityBldgs = m_City:GetBuildings();
		m_GreatWorkType = m_CityBldgs:GetGreatWorkTypeFromIndex(m_GreatWorkIndex)
		local greatWorkInfo:table = GameInfo.GreatWorks[m_GreatWorkType]
		UI.PlaySound("BACKGROUND_" .. greatWorkInfo.Audio )
	end
end

function OpenDiplomacyPauseBGM()
	UI.PlaySound("Pause_BOCCHI_GW_BACKGROUND")
end

function CloseDiplomacyResumeBGM()
	UI.PlaySound("Resume_BOCCHI_GW_BACKGROUND")
end

function ExitGameStopBGM()
	UI.PlaySound("Stop_BOCCHI_GW_BACKGROUND")
end

function PlayBocchiGreatPeople(player, unitId, locationX, locationY, locationZ, isSelected, isEditable)
	local pUnit = UnitManager.GetUnit(player,unitId)
	local sUnitName = tostring(pUnit:GetName())
	UI.PlaySound("Play_" .. sUnitName)
end


LuaEvents.DiplomacyRibbon_OpenDiplomacyActionView.Add(OpenDiplomacyPauseBGM)
LuaEvents.DiploScene_SceneClosed.Add(CloseDiplomacyResumeBGM)
Events.PlayerDefeat.Add(ExitGameStopBGM)
Events.TeamVictory.Add(ExitGameStopBGM)
Events.FinishedGameplayContentConfigure.Add(ExitGameStopBGM)
Events.GreatWorkCreated.Add(BocchiGreatWorkPlay)
Events.UnitSelectionChanged.Add(PlayBocchiGreatPeople);