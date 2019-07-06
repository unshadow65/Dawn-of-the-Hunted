enableZombieAI = true;
call ZOMB_fnc_initGlobalEnvironment;
call ZOMB_fnc_initMusic;
["mkr"] spawn ZOMB_fnc_LootInitCiv;
//[[worldSize/2,worldSize/2,0],worldSize,true] spawn  ZOMB_fnc_getBuildingPositions;