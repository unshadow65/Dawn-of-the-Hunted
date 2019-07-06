//died//

[] spawn
{
	_deathsounds	= ["A3\sounds_f\characters\human-sfx\Person0\P0_hit_01.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_02.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_03.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_04.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_05.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_06.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_07.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_08.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_09.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_10.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_11.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_12.wss","A3\sounds_f\characters\human-sfx\Person0\P0_hit_13.wss"];
	if (!alive player) then
	{
		//[Exit] call BIS_fnc_groupIndicator;
		//playsound3D [selectRandom _deathsounds,player,false,getPosASL player,1,1,100];
		//playSound3D ["A3\Missions_F_Bootcamp\data\sounds\vr_shutdown.wss", player];
		//playSound3D ["A3\sounds_f\characters\human-sfx\Person0\P0_choke_04.wss", player];
		//playsound3D [selectRandom _deathsounds,player,false,getPosASL player,1,1,100];
		player triggerDynamicSimulation false;
		2 fadeSound 0.1;
        setCurrentChannel 5;
		titleText ["You are dead","BLACK OUT",2];
		while {1==1} do
		{
			if (!alive player) then
			{
				((findDisplay 49) displayCtrl 104) ctrlShow false;
				//disableUserInput false;
			};
		};
	sleep 0.1;
	};
};
//The abilty for the player to understand how long someone has been dead dueto the amount of flies.//
/*
[] spawn
{
    _bodyObj = player;
    waitUntil {sleep 0.3;vectorMagnitude(velocity _bodyObj) < 1};
    _timeOfDeath= time;
    _future     = time + 120;//1800// 30 minutes
    _bodyPos	= getpos player;

    _delay_1 	= 300;
    _delay_2 	= 600;
    _stage 		= 1;

    _allowCrows = true;
    _allowFlies = true;
    _allowFlies2= true;

    while {time <= _future} do
    {
        _root	= parsingNamespace getVariable "MISSION_ROOT"; 
        _range	= 50;
        _volume	= 10;

        if (time < (_timeOfDeath+_delay_1)) then {_stage = 1;};
        if (time > (_timeOfDeath+_delay_1)) then {_stage = 2;};
        if (time > (_timeOfDeath+_delay_2)) then {_stage = 3;};

        switch (_stage) do
        {
            case 1:
            {
                //systemChat "F01";
                if (_allowCrows) then
                {
                    [_bodyObj, 50 + random 10, 1 + random 2, 40 + random 10] call BIS_fnc_crows;
                    _allowCrows = false;
                };
                //no flies//died less than five minutes//still gets crows
            };
            case 2:
            {
                if (_allowFlies) then
                {
                    //[_bodyPos, 0.01, 0.5] call BIS_fnc_flies;
                    _allowFlies = false;
                };
                //systemChat "F02";
				playSound3D [_root + "sfx\flies.wss",_bodyPos,false,_bodyPos,_volume,1,_range];
                sleep 14;
                //plays after five minutes
            };
            case 3:
            {
                //systemChat "F03";
                if (_allowFlies2) then
                {
                    [_bodyPos, 0.05, 1.5] call BIS_fnc_flies;
                    _allowFlies2 = false;
                };
				playSound3D [_root + "sfx\flies2.wss",_bodyPos,false,_bodyPos,_volume,1,_range];
                sleep 14;
                //plays after 10-15 minutes
            };
        };
        sleep 1;
    };
};