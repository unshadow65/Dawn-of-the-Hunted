// Spawn zombies inside buildings only

allValidBuildings = nearestTerrainObjects [[worldSize/2, worldSize/2], ["House"], worldSize];
allValidBuildingPositions = [];

{
	_allPositons = [_x] call BIS_fnc_buildingPositions;
	{
		_arrow = createVehicle ["Sign_Arrow_F", _x, [], 0, "CAN_COLLIDE"];
		_mkr = createMarker [("marker_"+(str count allMapMarkers)),_x];
		_mkr setMarkerShape "ELLIPSE";
		_mkr setMarkerSize [20,20];
		_mkr setMarkerAlpha 1;
	} foreach _allPositons;
	allValidBuildingPositions append _allPositons;

	// debugging
	hint parseText ("<t size= '1.5'>TOTAL VALID BUILDINGS:<br/> "+(str count allValidBuildings)+
					"<br/> TOTAL VALID POSITIONS:<br/> "+(str count allValidBuildingPositions)+"</t>");

} foreach allValidBuildings;
