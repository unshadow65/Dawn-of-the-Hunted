params ["_zombie","_targets"];
_zombie = _this select 0;

comment "AI Settings";
//_zombie disableAI "ALL";
//_zombie enableAI "TEAMSWITCH";
//_zombie enableAI "ANIM";
//_zombie enableAI "MOVE";
//_zombie enableAI "PATH";
//_zombie allowfleeing 0;
//_zombie setvariable ["BIS_noCoreConversations", true];
//_zombie switchMove (selectRandom ["ApanPknlMstpSnonWnonDnon_G01","ApanPknlMstpSnonWnonDnon_G02","ApanPknlMstpSnonWnonDnon_G03"]);
//_zombie setUnitAbility 10;
//doStop _zombie;

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
			_targets = _zombie targetsQuery [objNull, sideUnknown, "", [], 10];
			{
				_accuracy 	= _x select 0;
				_target 	= _x select 1;
				_side 		= _x select 2;
				_type 		= _x select 3;
				_position 	= _x select 4;
				_age 		= _x select 5;
				if !(isNil "_target") then
					{
						systemChat ("Valid Target: " + (name _target));
						if (alive _target) then
						{
							systemChat ("Alive Target: " + (name _target));
							_isZombie = _target getvariable "isZombie";
							if !(isNil "_isZombie") then
							{
								systemChat ("Friendly Target: " + (name _target));
								_sleepTime = 10;
								_zombie forceWalk true;
								_zombie setAnimSpeedCoef (0.8 + random 1);
							}
							else
							{
								systemChat ("Enemy Target: " + (name _target));
								_zombie forceWalk false;
								_zombie setAnimSpeedCoef (1.1 + random 1.4);
								_closestTarget = [objNull,worldSize];
								{
									if (_zombie distance (_x select 1) < (_closestTarget select 1)) then
									{
										_closestTarget = [_x select 1 , (_zombie distance (_x select 1))];
									};
								} foreach _targets;
								if !(_closestTarget isEqualTo objNull) then 
								{
									comment "closestTarget found";
									systemChat ("Closest Target: " + (name (_closestTarget select 0)));
									_zombie setvariable ["thisTarget",_closestTarget select 0];
								};
							};
						};
					};
			} forEach _targets;
		}
		else 
		{
			_zombie doMove (getPosASL _zombieTarget);
			systemChat ("Moving to Target: " + (name _zombieTarget));
			if (1==1) then
			{
				if (_zombie distance _zombieTarget < 1.7 && alive _zombieTarget) then
				{
					systemChat ("Target In Range: " + (name _zombieTarget));
					if (lifeState _zombieTarget == "INCAPACITATED") then
					{
						systemChat ("Attacking: " + (name _zombieTarget));
						_zombie switchMove (selectRandom ["UnconsciousMedicOut","AinvPknlMstpSnonWnonDnon_medic3"]);
						vehicle _zombieTarget setDamage (damage vehicle _zombieTarget + 0.01 + random 0.02);
					} else
					{
						systemChat ("Attacking: " + (name _zombieTarget));
						_zombie switchMove (selectRandom ["UnconsciousMedicOut","AinvPknlMstpSrasWrflDnon_Putdown_AmovPknlMstpSrasWrflDnon","AmovPknlMstpSrasWrflDnon_gear_AmovPknlMstpSrasWrflDnon","AmovPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_Putdown","AmovPknlMstpSrasWpstDnon_AinvPknlMstpSrasWpstDnon_Putdown","AmovPknlMstpSrasWpstDnon_gear_AmovPknlMstpSrasWpstDnon","AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon","AinvPknlMstpSnonWnonDr_medicUp4"]);
						vehicle _zombieTarget setDamage (damage vehicle _zombieTarget + 0.01 + random 0.21);
					};
					vehicle _zombieTarget setDamage (damage vehicle _zombieTarget + 0.01 + random 0.21);
					_zombieTarget setFatigue 1;
					[_zombieTarget] remoteExec ["BIS_fnc_fatigueEffect", owner _zombieTarget];
					sleep 1.4;
					if (alive _zombie) then
					{
						_zombie setDamage ((damage _zombie)-0.05);
						_zombie switchMove (selectRandom ["ApanPknlMsprSnonWnonDfl","ApanPknlMsprSnonWnonDfr"]);
					};
				};
			};
		};
		sleep _sleepTime;
	};
};