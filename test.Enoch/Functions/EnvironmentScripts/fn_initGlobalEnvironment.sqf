comment "time acceleration";
setTimeMultiplier 60;

comment "Set fog";
3 setFog 0.35;
setViewDistance 500;

comment "random smoke/fire across the map for buildings";
{
	_pos = getPos _x;
	_chance = 100;
	_rdm = round random _chance;
	if(_rdm == (_chance/2)) then
	{
		_smokeNfire = createVehicle ["test_EmptyObjectForFireBig",_pos,[],0,"CAN_COLLIDE"]; 
		_light = createVehicle ["#lightpoint",_pos,[],0,"CAN_COLLIDE"]; 
		[_light,5] remoteExec ["setLightBrightness",0];
		[_light,[0.75, 0.25, 0.1]] remoteExec ["setLightAmbient",0];
		[_light,[1, 1, 1]] remoteExec ["setLightColor",0];

		comment "debug only";
		_marker = createMarkerLocal ["marker_"+str((count allMapMarkers)+1),_pos];
		_marker setMarkerTypeLocal "mil_dot";
	};
}
forEach nearestTerrainObjects 
[
	[worldSize/2, worldSize/2], 
	["House"],
	worldSize, 
	false
];

comment "random smoke/fire across the map for trees";
{
	_pos = getPos _x;
	_chance = 1000;
	_rdm = round random _chance;
	if(_rdm == (_chance/2)) then 
	{			
		_marker = createMarkerLocal ["marker_"+str((count allMapMarkers)+1),_pos];
		_source01 = createVehicle ["#particlesource",getMarkerPos _marker,[],0,"CAN_COLLIDE"]; 
		_source01 setParticleClass "ObjectDestructionFire1Smallx";

		_light = createVehicle ["#lightpoint",getMarkerPos _marker,[],0,"CAN_COLLIDE"]; 
		[_light,5] remoteExec ["setLightBrightness",0];
		[_light,[0.75, 0.25, 0.1]] remoteExec ["setLightAmbient",0];
		[_light,[1, 1, 1]] remoteExec ["setLightColor",0];
		deleteMarker _marker;

		comment "debug only";
		_marker = createMarkerLocal ["marker_"+str((count allMapMarkers)+1),_pos];
		_marker setMarkerTypeLocal "mil_dot";
		_marker setMarkerColorLocal "ColorGreen";
	};
}
forEach nearestTerrainObjects 
[
	[worldSize/2, worldSize/2], 
	["Tree"],
	worldSize, 
	false
];

comment "damage all buildings";
{
	_x setDamage 0.5;
}
forEach nearestTerrainObjects 
[
	[worldSize/2, worldSize/2], 
	["House"],
	worldSize, 
	false
];

_allWrecks = [];

comment "spawn wrecks on roads all over";
_classNames = 
[
	"Land_Wreck_BMP2_F",
	"Land_Wreck_BRDM2_F",
	"Land_Wreck_Car_F",
	"Land_Wreck_Car2_F",
	"Land_Wreck_Car3_F",
	"Land_Wreck_CarDismantled_F",
	"Land_Wreck_HMMWV_F",
	"Land_Wreck_Hunter_F",
	"Land_Wreck_Offroad_F",
	"Land_Wreck_Offroad2_F",
	"Land_Wreck_Skodovka_F",
	"Land_Wreck_Slammer_F",
	"Land_Wreck_Slammer_hull_F",
	"Land_Wreck_Slammer_turret_F",
	"Land_Wreck_T72_hull_F",
	"Land_Wreck_T72_turret_F",
	"Land_Wreck_Truck_dropside_F",
	"Land_Wreck_Truck_F",
	"Land_Wreck_UAZ_F",
	"Land_Wreck_Ural_F",
	"Land_Wreck_Van_F",
	"Land_Bulldozer_01_abandoned_F",
	"Land_Bulldozer_01_wreck_F",
	"Land_Excavator_01_abandoned_F",
	"Land_Excavator_01_wreck_F",
	"Land_HistoricalPlaneWreck_03_F",
	"Land_HistoricalPlaneWreck_02_wing_right_F",
	"Land_HistoricalPlaneWreck_02_wing_left_F",
	"Land_HistoricalPlaneWreck_02_rear_F",
	"Land_HistoricalPlaneWreck_02_front_F",
	"Land_HistoricalPlaneWreck_01_F",
	"Land_Wreck_Heli_Attack_02_F",
	"Land_UWreck_MV22_F",
	"Land_UWreck_Heli_Attack_02_F"
];

{
	_pos = getPos _x;
	_chance = 20;
	_rdm = round random _chance;
	if(_rdm == (_chance/2)) then 
	{			
		_className = _classNames select round random ((count _classNames)-1);
		_obj = createVehicle [_className,_pos,[],0,"CAN_COLLIDE"];
		_obj setVariable ["deleteMe",true,true];
		_allWrecks pushBack _obj;
		_obj setDir (round random 360);
		_obj setPos getPos _obj;

		comment "debug only";
		_marker = createMarkerLocal ["marker_"+str((count allMapMarkers)+1),_pos];
		_marker setMarkerTypeLocal "mil_dot";
		_marker setMarkerColorLocal "ColorYellow";
	};
} forEach ([worldSize/2, worldSize/2,0] nearRoads worldSize);

comment "spawn helicopter wrecks on all helipads";
_classNames = 
[
	"Land_UWreck_Heli_Attack_02_F",
	"Land_UWreck_MV22_F",
	"Land_Wreck_Heli_Attack_01_F",
	"Land_Wreck_Heli_Attack_02_F",
	"Land_HistoricalPlaneWreck_01_F"
];

{
	_pos = getPos _x;
	_className = _classNames select round random ((count _classNames)-1);
	_obj = createVehicle [_className,_pos,[],0,"CAN_COLLIDE"];
	_obj setVariable ["deleteMe",true,true];
	_allWrecks pushBack _obj;
	_obj setDir (round random 360);
	_obj setPos getPos _obj;

	comment "debug only";
	_marker = createMarkerLocal ["marker_"+str((count allMapMarkers)+1),_pos];
	_marker setMarkerTypeLocal "mil_dot";
	_marker setMarkerColorLocal "ColorBlue";
} forEach ([0,0,0] nearobjects ["HeliH",worldsize * 10]);

comment "set random wrecks on fire";
{
	_pos = getPos _x;
	_chance = 4;
	_rdm = round random _chance;
	if(_rdm == (_chance/2)) then 
	{			
		_marker = createMarkerLocal ["marker_"+str((count allMapMarkers)+1),_pos];
		_source01 = createVehicle ["#particlesource",getMarkerPos _marker,[],0,"CAN_COLLIDE"]; 
		_source01 setParticleClass "ObjectDestructionFire1Smallx";

		_light = createVehicle ["#lightpoint",getMarkerPos _marker,[],0,"CAN_COLLIDE"]; 
		[_light,5] remoteExec ["setLightBrightness",0];
		[_light,[0.75, 0.25, 0.1]] remoteExec ["setLightAmbient",0];
		[_light,[1, 1, 1]] remoteExec ["setLightColor",0];
		deleteMarker _marker;

		comment "debug only";
		_marker = createMarkerLocal ["marker_"+str((count allMapMarkers)+1),_pos];
		_marker setMarkerTypeLocal "mil_dot";
		_marker setMarkerColorLocal "ColorRed";
	};
} foreach _allWrecks;

/*
_source01 = "#particlesource" createVehicle getPos player; 
_source01 setParticleClass "ObjectDestructionFire1Smallx";
_source01 attachto [player,[0,0,0]];

_smokeNfire = "test_EmptyObjectForFireBig" createVehicle (position player);

_light = "#lightpoint" createVehicle position player;
_light setLightBrightness 5.0;
_light setLightAmbient [0.75, 0.25, 0.1];
_light setLightColor [1, 1, 1];
_light attachto [_smokeNfire,[0,0,0]];

{
	{deleteVehicle _x;} foreach allMissionObjects "#lightpoint";
	{deleteVehicle _x;} foreach allMissionObjects "#particlesource";
	{deleteVehicle _x;} foreach allMissionObjects "test_EmptyObjectForFireBig";
	{deleteMarker _x;} foreach allMapMarkers;
	{if(_x getVariable "deleteMe") then {deleteVehicle _x;};} foreach allMissionObjects "All";
	removeAllMusicEventHandlers "MusicStop";
} remoteExec ["BIS_fnc_call",2];
*/