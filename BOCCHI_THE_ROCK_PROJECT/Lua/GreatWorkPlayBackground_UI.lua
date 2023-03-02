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

Events.GreatWorkCreated.Add(BocchiGreatWorkPlay)