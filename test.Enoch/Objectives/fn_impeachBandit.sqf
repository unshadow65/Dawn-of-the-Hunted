[] spawn
{
	missionUnits = [];
	missionUp = true;
	publicVariable "missionUp";
	sleep 3;

	_completehint = 
	"<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#00B2EE'>COMPLETE</t><br/>____________________<br/>The Bandits won't last long at this rate<br/><br/>Next mission in few moments.</t>";


	_SMhint = "<t align='center'><t size='2.2'>New Side Mission</t><br/><t size='1.5' color='#00B2EE'>Impeach Bandit President</t><br/>____________________<br/>Bandits forces have elected a new President on the island today. If we kill him, it may turn the tide. We can't let him escape!</t>";
	hint parsetext _SMhint;

	_position = [[9938,18283,131],random 50,5000, 1, 0, 60 * (pi / 180), round(random 1), []] call BIS_fnc_findSafePos;

	sideObj = "I_G_officer_F" createVehicle _position;
	_nposition = [_position,random 50,200, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
	sideObj setPos _nposition;
	missionUnits = missionUnits + [sideObj];
	sideObj setDir random 360;
	_random = (round(random 2) + 1);

	for "_i" from 0 to _random do 
	{
		_nposition = [_position,random 50,300, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
		_missionGroup	= [_nposition, independent, ["C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F"],[],[],[],[],[1,0.3],random 360] call BIS_fnc_spawnGroup;
		[_missionGroup, getpos sideObj,200 + random 500] call BIS_fnc_taskPatrol;
		{[_x] call KING_fnc_sidecfg;} forEach units _missionGroup;
		missionUnits = missionUnits + (units _missionGroup);
		sleep 1;
	};

	//[round(random 2) + 1] call KING_fnc_banditStatic;

	_nposition = [_position,random random 10,50, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
	_missionGroup	= [_nposition, independent, ["C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F"],[],[],[],[],[1,0.3],random 360] call BIS_fnc_spawnGroup;
	[_missionGroup, getpos sideObj] call BIS_fnc_taskDefend;
	{[_x] call KING_fnc_sidecfg;} forEach units _missionGroup;
	missionUnits = missionUnits + (units _missionGroup);

	"sideMarker" setmarkerpos (position sideobj);
	"sideMarker" setmarkertext "Mr Bandit President";
	"sideMarker" setmarkercolor "ColorYellow";
	"sideMarker" setMarkerAlpha 0;
	"sideMarker" setmarkerType "Empty";//mil_warning
	_txt2 = format ["Bandit factions have elected a president. On the island today he plans a show of force.  If we eliminate him, it may discurage bandit factions from banding together. He is suspected to be around grid position %1.",mapGridPosition sideObj];
		
	killBanditTask = player createSimpleTask ["killBanditTask"];
	killBanditTask setSimpleTaskType "attack";
	killBanditTask setSimpleTaskDestination (getMarkerPos "sideMarker");
	killBanditTask setSimpleTaskDescription [_txt2,"Mr Bandit President",""];
	killBanditTask setTaskState "Assigned";
	["killBanditTask","ASSIGNED"] call BIS_fnc_taskHint;
		
	player setCurrentTask killBanditTask;
	waitUntil {!alive sideObj};
	"sideMarker" setMarkerPos [0,0,0];
	"sideMarker" setmarkertext "";
	"sideMarker" setmarkeralpha 0;
	hint parsetext _completehint;
	missionUp = false;
	publicVariable "missionUp";
	killBanditTask setTaskState "Succeeded";
	player removeSimpleTask killBanditTask;
	sleep 320;
	{deletevehicle _x} foreach missionUnits;
	missionUnits = [];
};