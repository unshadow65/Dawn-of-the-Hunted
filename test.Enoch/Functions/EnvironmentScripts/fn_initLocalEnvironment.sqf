[] spawn 
{
	if(!hasInterface) exitWith {};
	waitUntil {sleep 1; getClientState isEqualTo "BRIEFING READ"};
	sleep 1;

	comment "Set color filter";
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 0.9, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6],  [0.199, 0.587, 0.114, 0.0]];  
	"colorCorrections" ppEffectCommit 0;

	comment "visual settings";
	setViewDistance 1500;
 	setObjectViewDistance 2000;
	setTerrainGrid 50;

	comment "music volume";
	10 fadeMusic 0.275;

	//comment "turn off terrain lights";
	//{
	//	_x setHit ["light_1_hitpoint", 0.97];
	//	_x setHit ["light_2_hitpoint", 0.97];
	//	_x setHit ["light_3_hitpoint", 0.97];
	//	_x setHit ["light_4_hitpoint", 0.97];
	//} forEach nearestObjects [[worldSize/2, worldSize/2,0], [
	//	"Lamps_base_F",
	//	"PowerLines_base_F",
	//	"PowerLines_Small_base_F"
	//], worldSize];
};