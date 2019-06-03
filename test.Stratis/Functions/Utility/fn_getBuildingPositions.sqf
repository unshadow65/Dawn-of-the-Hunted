//#include "blacklistedBuildings.sqf";

params [["_center",getPosASL player],["_radius",250],["_debug",false]];

_terrainBuildings = nearestTerrainObjects [_center, ["House"], _radius];
_allPositions = [];

{
	_allPositions append (_x buildingPos -1);
} foreach _terrainBuildings;

// debugging
if (_debug) then
{
	hint parseText ("<t size= '1.25'>Buildings in range:<br/> "+(str count _terrainBuildings)+
					"<br/> Total Positions:<br/> "+(str count _allPositions)+"</t>");
	{
		// Sign_Arrow_F
		// Land_Ammobox_rounds_F
		_veh = createVehicle ["Sign_Arrow_F", _x, [], 0, "CAN_COLLIDE"];
		_mkr = createMarker ["marker_"+str(count allMapMarkers),_x];
		_mkr setMarkerType "mil_dot";
	} foreach _allPositions;
};

_allPositions