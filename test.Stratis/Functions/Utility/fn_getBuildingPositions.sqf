params [["_center",getPosATL player],["_radius",250]];

_buildings = nearestTerrainObjects [_center, ["House"], _radius];
_allPositions = [];

{
	_allPositions append ([_x] call BIS_fnc_buildingPositions);	
} foreach _buildings;

// debugging
	hint parseText ("<t size= '1.25'>Buildings in range:<br/> "+(str count _buildings)+
					"<br/> Total Positions:<br/> "+(str count _allPositions)+"</t>");

_allPositions