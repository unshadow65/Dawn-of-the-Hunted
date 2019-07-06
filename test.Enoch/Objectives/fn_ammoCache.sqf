[] spawn
{
	missionUnits = [];
	missionUp = true;
	publicVariable "missionUp";
	sleep 3;

	_completehint = 
	"<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#00B2EE'>COMPLETE</t><br/>____________________<br/>The Bandits won't last long at this rate<br/><br/>Next mission in few moments.</t>";

	_SMhint = "<t align='center'><t size='2.2'>New Side Mission</t><br/><t size='1.5' color='#00B2EE'>Destory Ammo Cache</t><br/>____________________<br/>Someone discovered a Bandit Ammo Cache on the island. If you clear out the enemies, you can take whatever you want then destory the rest of it to make sure anyone else can't use it ever again.</t>";
	hint parsetext _SMhint;

	_position = [[9938,18283,131],random 1000,10000, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;

	_missionBox = ["Box_FIA_Wps_F", "Box_FIA_Ammo_F", "Box_FIA_Support_F"] call BIS_fnc_selectRandom;
	sideObj = _missionBox createVehicle _position;
	sideObj addItemCargoGlobal ["itemMap", 10];
	//[sideObj] call KING_fnc_boxmission;
	missionUnits = missionUnits + [sideObj];
	sideObj setDir random 360;
	_random = (round(random 2) + 1);

	for "_i" from 0 to _random do 
	{
		_nposition = [_position,random 50,300, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
		_missionGroup	= [_nposition, independent, ["C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F"],[],[],[],[],[1,0.3],random 360] call BIS_fnc_spawnGroup;
		[_missionGroup, getpos sideObj,200 + random 500] call BIS_fnc_taskPatrol;
		missionUnits = missionUnits + (units _missionGroup);
		{[_x] call KING_fnc_sidecfg;} forEach units _missionGroup;
		sleep 1;
	};

	//[round(random 2) + 1] call fnc_CreateStatic;

	//https://community.bistudio.com/wiki/BIS_fnc_findSafePos
	_nposition = [_position,random random 5,50, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
	_missionGroup	= [_nposition, independent, ["C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F"],[],[],[],[],[1,0.3],random 360] call BIS_fnc_spawnGroup;
	[_missionGroup, getpos sideObj] call BIS_fnc_taskDefend;
	{[_x] call KING_fnc_sidecfg;} forEach units _missionGroup;
	missionUnits = missionUnits + (units _missionGroup);

	"sideMarker" setmarkerpos (position sideobj);
	"sideMarker" setmarkertext "Destory Bandit Cache";
	"sideMarker" setmarkercolor "ColorOrange";
	"sideMarker" setMarkerAlpha 0;
	"sideMarker" setmarkerType "Empty";// mil_unknown
	_txt2 = format ["The ammo cache is around map co-ordinates %1. We need to find it then destory it after taking whatever we want out of it.",mapGridPosition sideObj];
		
	killAmmoTask = player createSimpleTask ["killAmmoTask"];
	killAmmoTask setSimpleTaskType "attack";
	killAmmoTask setSimpleTaskDescription [_txt2,"Destory Bandit Cache",""];
	killAmmoTask setSimpleTaskDestination (getMarkerPos "sideMarker");
	killAmmoTask setTaskState "Assigned";

	player setCurrentTask killAmmoTask;
	waitUntil {!alive sideObj};
	"sideMarker" setMarkerPos [0,0,0];
	"sideMarker" setmarkertext "";
	"sideMarker" setmarkeralpha 0;
	killAmmoTask setTaskState "Succeeded";
		
	player removeSimpleTask killAmmoTask;
	hint parsetext _completehint;
	missionUp = false;
	publicVariable "missionUp";
	sleep 320;
	{deletevehicle _x} foreach missionUnits;
	missionUnits = [];
};