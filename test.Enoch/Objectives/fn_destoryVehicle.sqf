[] spawn
{
	missionUnits = [];
	missionUp = true;
	publicVariable "missionUp";
	sleep 3;

	_completehint = 
	"<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#00B2EE'>COMPLETE</t><br/>____________________<br/>The Bandits won't last long at this rate<br/><br/>Next mission in few moments.</t>";

	_SMhint = "<t align='center'><t size='2.2'>New Side Mission</t><br/><t size='1.5' color='#00B2EE'>Destory Vehicle</t><br/>____________________<br/>Bandit units have deployed a vehicle with some special equipment to the battlefield.  Destory that vehicle at all costs!</t>";
	hint parsetext _SMhint;

	_position = [[9938,18283,131],random 1000,10000, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;

	_vehicle = vehicleUnits call BIS_fnc_selectRandom;

	sideObj = _vehicle createVehicle _position;
	missionUnits = missionUnits + [sideObj];
	sideObj setDir random 360;
	_random = (round(random 2) + 1);

	for "_i" from 0 to _random do 
	{
		_nposition = [_position,random 50,300, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
				_missionGroup	= [_nposition, independent, ["C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F"],[],[],[],[],[1,0.3],random 360] call BIS_fnc_spawnGroup;
		[_missionGroup, getpos sideObj,200 + random 500] call BIS_fnc_taskPatrol;
		//_missionGroup = [_nposition, independent, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
		missionUnits = missionUnits + (units _missionGroup);
		{[_x] call KING_fnc_sidecfg;} forEach units _missionGroup;
		sleep 1;
	};


//[getPosATL player, 400, 60, 20, getPosATL player] call BIS_fnc_findOverwatch;


	//[round(random 2) + 1] call KING_fnc_banditStatic;

	_nposition	= [_position,random random 10,50, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
	_missionGroup	= [_nposition, independent, ["C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F"],[],[],[],[],[1,0.3],random 360] call BIS_fnc_spawnGroup;
	[_missionGroup, getpos sideObj] call BIS_fnc_taskDefend;
	{[_x] call KING_fnc_sidecfg;} forEach units _missionGroup;
	missionUnits = missionUnits + (units _missionGroup);

	"sideMarker" setmarkerpos (position sideobj);
	"sideMarker" setmarkertext "Loot & Destory";
	"sideMarker" setmarkercolor "ColorBlue";
	"sideMarker" setMarkerAlpha 0;
	"sideMarker" setmarkerType "Empty";//Destroy
	_txt2 = format ["Bandit units have deployed a %1 with some special equipment to the battlefield.  It is suspected to be at map grid %2.",getText(configFile >> "cfgVehicles" >> (typeOf sideObj) >> "displayName"), mapGridPosition sideObj];
		
	killVehicleTask = player createSimpleTask ["killVehicleTask"];
	killVehicleTask setSimpleTaskType "attack";
	killVehicleTask setSimpleTaskDestination (getMarkerPos "sideMarker");
	killVehicleTask setSimpleTaskDescription [_txt2,"Loot & Destory",""];
	killVehicleTask setTaskState "Assigned";
		
	player setCurrentTask killVehicleTask;
	waitUntil {!alive sideObj};
	"sideMarker" setMarkerPos [0,0,0];
	"sideMarker" setmarkertext "";
	"sideMarker" setmarkeralpha 0;
	killVehicleTask setTaskState "Succeeded";
		
	player removeSimpleTask killVehicleTask;
	hint parsetext _completehint;
	missionUp = false;
	publicVariable "missionUp";
	sleep 320;
	{deletevehicle _x} foreach missionUnits;
	missionUnits = [];
};