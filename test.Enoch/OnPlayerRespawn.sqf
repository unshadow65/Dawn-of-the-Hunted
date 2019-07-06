[] spawn
{
if (hasInterface) then
	{
		if (alive player) then
	{
		_RandomHeadgear = ["H_Watchcap_sgg","H_BandMask_blk","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_indp","H_Booniehat_mcamo","H_Booniehat_grn","H_Booniehat_tan","H_Booniehat_dirty","H_Booniehat_dgtl","H_Booniehat_khk_hs","H_Cap_red","H_Cap_blu","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_blk_CMMG","H_Cap_brn_SPECOPS","H_Cap_tan_specops_US","H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_grn_BI","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_oli_hs","H_Cap_press","H_Cap_usblack","H_Cap_surfer","H_Cap_police","H_Bandanna_surfer","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_camo","H_Bandanna_mcamo","H_StrawHat","H_StrawHat_dark","H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_grey","H_Hat_checker","H_Hat_tan"] call BIS_fnc_selectRandom;
		_RandomItem = ["FirstAidKit","Binocular","ItemWatch","ItemCompass","ItemMap","HandGrenade_Stone","HandGrenade","MiniGrenade","SmokeShell","SmokeShellYellow","SmokeShellGreen","SmokeShellRed","SmokeShellPurple","SmokeShellOrange","SmokeShellBlue","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue","B_IR_Grenade","O_IR_Grenade","I_IR_Grenade","10Rnd_762x54_Mag","20Rnd_762x51_Mag","9Rnd_45ACP_Mag","16Rnd_9x21_Mag","6Rnd_45ACP_Cylinder","30Rnd_9x21_Mag","30Rnd_65x39_caseless_green","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green","30Rnd_65x39_caseless_mag","hgun_P07_F","hgun_ACPC2_F","hgun_Rook40_F","hgun_Pistol_heavy_02_F"] call BIS_fnc_selectRandom;
		_uniforms = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_Rangemaster","U_NikosBody","U_OrestesBody","U_Competitor","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_C_Poor_1"] call BIS_fnc_selectRandom;
		_RandomHorn = ["FakeHorn","CarHorn","BikeHorn","TruckHorn","TruckHorn2","TruckHorn3","SportCarHorn","MiniCarHorn","AmbulanceHorn","PoliceHorn"] call BIS_fnc_selectRandom;
		_RandomFlashLight = ["acc_flashlight","acc_flashlight_pistol"] call BIS_fnc_selectRandom;
		_show = false;
		{
			if(ctrlIDC _x isEqualTo 1002) then {_x ctrlShow _show;};
			if(ctrlIDC _x isEqualTo 1003) then {_x ctrlShow _show;};
			if(ctrlIDC _x isEqualTo 1004) then {_x ctrlShow _show;};
			if(ctrlIDC _x isEqualTo 1005) then {_x ctrlShow _show;};
		} foreach allControls (findDisplay 46);
		player setCaptive true;
		player allowDamage false;
		player enableSimulation true;
//		[player] call KING_fnc_gas;
		player triggerDynamicSimulation true;
		["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
		//disableUserInput false;
		player setSpeaker "NoVoice";
		player setvariable ["name",name player,true];
		player addRating 9999999;
		enableRadio false;
		setCurrentChannel 5;
		//player setSpeaker "Male02GRE";
		0 enableChannel [false,false];
		1 enableChannel [false,false];
		2 enableChannel [false,false];
		setViewDistance 1000;
		setObjectViewDistance 1000;
		removeAllAssignedItems player;
		removeAllItems player;
		removeAllWeapons player;
		removeuniform player;
		removeGoggles player;
		removeHeadgear player;
		removeVest player;
		removeBackpack player;
		//player addweapon "FakeHorn";
		player addweapon _RandomHorn;
		player addHeadgear _RandomHeadgear;
		player forceadduniform _uniforms;
		player addvest "V_Rangemaster_belt";
		player addItemToVest _RandomItem;
		player addItemToVest _RandomFlashLight;
		player addItemToUniform "FirstAidKit";
		player addItemToUniform "Chemlight_green";
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "Chemlight_yellow";
		player addItemToUniform "Chemlight_blue";
		player setUnitTrait ["Medic",true];
		player setUnitTrait ["engineer",true];
		player setUnitTrait ["explosiveSpecialist",true];
		player setUnitTrait ["UAVHacker",true];
		player triggerDynamicSimulation true;
		player setCustomAimCoef 0.6;
		player setUnitRecoilCoefficient 0.6;
		player enableFatigue false;
		isPlayerSetupCompleted = true;
		//playMusic "AmbientTrack03b_F_Tacops";
		titleText ["","BLACK IN",10];
		player allowDamage false;
		player setCaptive true;
		if (alive player) then
		{
		sleep 0.5;
		playsound3D ["A3\sounds_f\characters\human-sfx\Person1\P1_choke_03.wss",player,false,getPosASL player,1,1,500];
		player switchMove "Acts_UnconsciousStandUp_part1";
		player switchCamera "INTERNAL";
		sleep 43.5;
		if (alive player) then
		{
			player enableSimulation true;
		1 enableChannel [true,false];
		[parseText "<t font='PuristaBold' size='2'>Arma Z</t><br />by King", true, 0, 1, 9, 0] spawn BIS_fnc_textTiles;
		//titleText ["Arma Z: Dawn of the Hunted", "PLAIN"];
		//any= ["ArmaZ: Dawn of the Hunted","By King"] spawn BIS_fnc_infoText;
		//["<t color='#ff0000' size = '.8'>Arma Z<br />Dawn of the Hunted</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;
		//[parseText "<t font='PuristaBold' size='1.6'>Arma Z</t><br />by King", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles
		//[ "Somewhere", format ["Year %1", date select 0], mapGridPosition player ] spawn BIS_fnc_infoText;
		//[["line1",4,5],["line2",3,5,8]] spawn BIS_fnc_EXP_camp_SITREP;
		//[
		//	[
		//		["ArmaZ:","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"], 
		//		[" Dawn of the Hunted","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"], 
		//		["By King","<t align = 'center' shadow = '1' size = '1'>%1</t>"] 
		//	],
		//	0.75,
		//	1
		//] spawn BIS_fnc_typeText;
		player switchMove "AmovPercMstpSnonWnonDnon";
		player switchCamera "EXTERNAL";
		player setCaptive false;
		player allowDamage true;
		["ScoreAdded",["Press M to open your map for information!",1]] call BIS_fnc_showNotification;
		((findDisplay 49) displayCtrl 104) ctrlShow true;
		//[] call BIS_fnc_groupIndicator;
		sleep 15;
		_show = true;
		{
			if(ctrlIDC _x isEqualTo 1002) then {_x ctrlShow _show;};
			if(ctrlIDC _x isEqualTo 1003) then {_x ctrlShow _show;};
			if(ctrlIDC _x isEqualTo 1004) then {_x ctrlShow _show;};
			if(ctrlIDC _x isEqualTo 1005) then {_x ctrlShow _show;};
		} foreach allControls (findDisplay 46);
		SystemChat "UI";
	};
}}}};
//systemChat "I'm thirsty.";
/*
		player addEventHandler [
			"HandleDamage", 
			format [
				'if (switch (_this select 1) do {
					case "": {_this select 2 >= 1};
					case "head": {_this select 2 >= %1};
					case "body": {_this select 2 >= %2};
					default {false};
				}) then {moveOut player}',
				getNumber (configFile >> "CfgFirstAid" >> "CriticalHeadHit"),
				getNumber (configFile >> "CfgFirstAid" >> "CriticalBodyHit")
			]
		];
		*/
