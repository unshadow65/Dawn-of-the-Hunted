waitUntil {getClientState isEqualTo "BRIEFING READ"};

[] spawn ZOMB_fnc_VONEvent;
call ZOMB_fnc_initLocalEnvironment;