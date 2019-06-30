params ["_zombie"];
_zombie = _this select 0;

comment "AI Settings";
_zombie disableAI "ALL";
_zombie enableAI "TEAMSWITCH";
_zombie enableAI "ANIM";
_zombie enableAI "MOVE";
_zombie enableAI "PATH";
_zombie allowfleeing 0;
_zombie setvariable ["BIS_noCoreConversations", true];
_zombie switchMove (selectRandom ["ApanPknlMstpSnonWnonDnon_G01","ApanPknlMstpSnonWnonDnon_G02","ApanPknlMstpSnonWnonDnon_G03"]);
doStop _zombie;

_zombie setvariable ["isZombie",true];
_sleepTime = 1;

[_zombie,_sleepTime] spawn
{
	_zombie 	= _this select 0;
	_sleepTime 	= _this select 1;
	while {enableZombieAI && alive _zombie} do
	{
		_zombieTarget = _zombie getVariable "thisTarget";
		if !(isNil "_zombieTarget") then {if(!alive _zombieTarget) then {_zombieTarget = nil;};};
		if (isNil "_zombieTarget") then 
		{
			systemChat ("Finding new target: " + (name _zombie)+"(Zombie)");
			_targets = _zombie nearEntities ["Man",650];
			{
				if ((_zombie knowsAbout _x) > 0) then 
				{

				};
			} forEach _targets;
		}
		else 
		{
			_zombie doMove (getPosASL _zombieTarget);
			systemChat ("Moving to Target: " + (name _zombieTarget));
		};
		sleep _sleepTime;
	};
};