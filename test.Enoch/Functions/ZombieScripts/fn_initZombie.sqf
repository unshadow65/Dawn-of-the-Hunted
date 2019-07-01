params ["_zombie"];
_zombie = _this select 0;

comment "AI Settings";
_zombie disableAI "ALL";
_zombie enableAI "TEAMSWITCH";
_zombie enableAI "ANIM";
_zombie enableAI "MOVE";
_zombie enableAI "PATH";
_zombie allowfleeing 0;
group _zombie setBehaviourStrong "CARELESS";
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
		if !(isNil "_zombieTarget") then
		{
			_isZomb = _zombieTarget getVariable "isZombie"; 
			if(!alive _zombieTarget || (!isNil "_isZomb")) then {_zombieTarget = nil;};};
		if (isNil "_zombieTarget") then 
		{
			systemChat ("Finding new target: " + (name _zombie)+"(Zombie)");
			_sleepTime = 3;
			_targets = nearestObjects [_zombie,["Man"],650,true];
			{
				_unit = _x;
				_isZomb = _unit getVariable "isZombie";
				if (isNil "_isZomb" && alive _unit) then
				{
					_cansee = [_zombie, "VIEW"] checkVisibility [eyePos _zombie, eyePos _unit];
					hint ("Visibility of "+(name _unit)+": "+(str _cansee));
					if ((_cansee > 0.825) || (_zombie knowsAbout _unit > 0)) exitWith
					{
						_sleepTime = 1;
						_zombie reveal [_unit,4];
						_zombie setVariable ["thisTarget",_x];
					};
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