staticWeapons = ["I_GMG_01_high_F","I_HMG_01_high_F","I_Mortar_01_F"];
_amount = _this select 0;
for "_i" from 0 to _amount do
{
	_StaticWep = staticWeapons call BIS_fnc_selectRandom;
	_positionStatic = [_position,random 10,800, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
	_Static = _staticWep createVehicle _positionStatic;
	_gunGuy	= [position _Static, independent, ["C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F"],[],[],[],[],[1,0.1],random 360] call BIS_fnc_spawnGroup;
	{
		[_x] call KING_fnc_sidecfg;
	} forEach units _thegroup;
	Group _gunGuy addVehicle _Static;
	_gunGuy assignAsGunner _Static;
	[_gunGuy] orderGetIn true;
};

//_gunGuy	= [position _Static, independent, ["C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F","C_Man_French_universal_F"],[],[],[],[],[1,0.1],random 360] call BIS_fnc_spawnGroup;
//_gunGuy	= "I_G_Soldier_universal_F" createVehicle (position _Static);