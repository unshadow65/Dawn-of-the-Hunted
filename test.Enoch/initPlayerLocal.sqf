waitUntil {getClientState isEqualTo "BRIEFING READ"};

[] spawn ZOMB_fnc_VONEvent;
call ZOMB_fnc_initLocalEnvironment;

if !(hasInterface) exitWith {};
player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	_unit triggerDynamicSimulation true;
	_vehicle triggerDynamicSimulation true;
	_unit enableSimulation true;
}];
player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	_vehicle triggerDynamicSimulation false;
	_unit enableSimulation true;
}];
{player addEventHandler ["Explosion", {
	params ["_vehicle", "_damage"];
	playSound "combat_deafness";
	systemchat "My ears hurt!";
}];} foreach allPlayers;
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	(if (_this select 1 == 57 && _this select 2 isEqualTo true) then {
		if (velocity player select 2 == 0 && stance player isEqualTo "STAND") then {
			_jump = 4;
			player setVelocity [(velocity player select 0) + 1*sin (getdir player), (velocity player select 1) + 1*cos (getdir player), (velocity player select 2) + (_jump)];
		}
	})
}];
player enableSimulation true;
player triggerDynamicSimulation true;
player setvariable ["name",name player,true];
["isCombat"] call BIS_fnc_jukebox;
