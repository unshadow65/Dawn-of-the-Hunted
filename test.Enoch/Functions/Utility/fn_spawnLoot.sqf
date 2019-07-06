
	if(isServer)then{
	isSpawnLootRunning = true;
	_pos=	(_this select 0);
	_pos0=	(_pos select 0);
	_pos1=	(_pos select 1);
	_pos2=	(_pos select 2);
	_showLoot=	(_this select 1);

		_BOX = createVehicle ["Land_Ammobox_rounds_F",[_pos0,_pos1,_pos2+0.05], [], 0, "can_Collide"];
			sleep 1;
			_holder = createVehicle ["groundweaponholder",[_pos0,_pos1,(getposATL _BOX select 2)], [], 0, "can_Collide"];
				deletevehicle _BOX;
				_holder enableDynamicSimulation true;
	_type=floor (random 100);

		if (_showLoot) 
				then {			
				_id=format ["%1",_pos];
				_debug=createMarker [_id,GETPOS _holder];
				_debug setMarkerShape "ICON";
				_debug setMarkerType "hd_dot";
				_debug setMarkerColor "ColorBlack";
				_txt=format ["%1",_type];
				_debug setMarkerText _txt;	
						};
							
	// Spawn Weapon/Ammo x1/Exotic
	 if (_type == 0) 
			then {
		_weapon= weaponLootExotic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};
						
						
	// Spawn Ammo x2
	 if (_type == 1) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 2) 
			then {
		_item= itemsLootRare call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Basic Vest x1
	 if (_type == 3) 
			then {
		_vest= vestsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Backpack x1
	 if (_type == 4) 
			then {
		_backpack= backpacksLootBasic call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 5) 
			then {
		_item= itemsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1/Legendary
	 if (_type == 6) 
			then {
		_weapon= weaponLootLegendary call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 7) 
			then {
		_hat= hatLootUncommon call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x2/Legendary
	 if (_type == 8) 
			then {
		_weapon= weaponLootLegendary call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};
						
						
	// Spawn Ammo x3
	 if (_type == 9) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 3];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 10) 
			then {
		_item= itemsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Basic Vest x1
	 if (_type == 11) 
			then {
		_vest= vestsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Backpack x1
	 if (_type == 12) 
			then {
		_backpack= backpacksLootBasic call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 13) 
			then {
		_item= itemsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1/Rare
	 if (_type == 14) 
			then {
		_weapon= weaponLootRare call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 15) 
			then {
		_hat= hatLootUncommon call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x1/Rare
	 if (_type == 16) 
			then {
		_weapon= weaponLootRare call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};
						
						
	// Spawn Ammo x1
	 if (_type == 17) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 18) 
			then {
		_item= itemsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Basic Vest x1
	 if (_type == 19) 
			then {
		_vest= vestsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Backpack x1
	 if (_type == 20) 
			then {
		_backpack= backpacksLootBasic call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 21) 
			then {
		_item= itemsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1/Rare
	 if (_type == 22) 
			then {
		_weapon= weaponLootRare call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 23) 
			then {
		_hat= hatLootRare call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x2/Uncommon
	 if (_type == 24) 
			then {
		_weapon= weaponLootUncommon call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};
						
						
	// Spawn Ammo x3
	 if (_type == 25) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 3];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 26) 
			then {
		_item= itemsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Basic Vest x1
	 if (_type == 28) 
			then {
		_vest= vestsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Backpack x1
	 if (_type == 28) 
			then {
		_backpack= backpacksLootBasic call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 29) 
			then {
		_item= itemsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1/Uncommon
	 if (_type == 30) 
			then {
		_weapon= weaponLootUncommon call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 31) 
			then {
		_hat= hatLootUncommon call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x1/Uncommon
	 if (_type == 32) 
			then {
		_weapon= weaponLootUncommon call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};
						
						
	// Spawn Ammo x2
	 if (_type == 33) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 34) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Basic Vest x1
	 if (_type == 35) 
			then {
		_vest= vestsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Backpack x1
	 if (_type == 36) 
			then {
		_backpack= backpacksLootBasic call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 37) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1/Uncommon
	 if (_type == 38) 
			then {
		_weapon= weaponLootUncommon call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 39) 
			then {
		_hat= hatLootBasic call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x2/Uncommon
	 if (_type == 40) 
			then {
		_weapon= weaponLootUncommon call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};
						
						
	// Spawn Ammo x3
	 if (_type == 41) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 3];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 42) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Basic Vest x1
	 if (_type == 43) 
			then {
		_vest= vestsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Backpack x1
	 if (_type == 44) 
			then {
		_backpack= backpacksLootBasic call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 45) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1
	 if (_type == 46) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 47) 
			then {
		_hat= hatLootBasic call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x1
	 if (_type == 48) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};
						
						
	// Spawn Ammo x2
	 if (_type == 49) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};	
						
						
	// Spawn Weapon/Ammo x1
	 if (_type == 50) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};
						
						
	// Spawn Ammo x2
	 if (_type == 51) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 52) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Basic Vest x1
	 if (_type == 53) 
			then {
		_vest= vestsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Backpack x1
	 if (_type == 54) 
			then {
		_backpack= backpacksLootBasic call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 55) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1
	 if (_type == 56) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 57) 
			then {
		_hat= hatLootBasic call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x2
	 if (_type == 58) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};
						
						
	// Spawn Ammo x3
	 if (_type == 59) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 3];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 60) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Basic Vest x1
	 if (_type == 61) 
			then {
		_vest= vestsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Uncommon Backpack x1
	 if (_type == 62) 
			then {
		_backpack= backpacksLootUncommon call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 63) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1
	 if (_type == 64) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 65) 
			then {
		_hat= hatLootBasic call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x1
	 if (_type == 66) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};
						
						
	// Spawn Ammo x2
	 if (_type == 67) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 68) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Uncommon Vest x1
	 if (_type == 69) 
			then {
		_vest= vestsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Basic Backpack x1
	 if (_type == 70) 
			then {
		_backpack= backpacksLootBasic call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 71) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1
	 if (_type == 72) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 73) 
			then {
		_hat= hatLootBasic call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x2
	 if (_type == 74) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};
						
						
	// Spawn Ammo x3
	 if (_type == 75) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 3];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 76) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Uncommon Vest x1
	 if (_type == 77) 
			then {
		_vest= vestsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Uncommon Backpack x1
	 if (_type == 78) 
			then {
		_backpack= backpacksLootUncommon call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 79) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1
	 if (_type == 80) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Uniform x1
	 if (_type == 81) 
			then {
		_hat= hatLootBasic call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x1
	 if (_type == 82) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};
						
						
	// Spawn Ammo x1
	 if (_type == 83) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 84) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Uncommon Vest x1
	 if (_type == 85) 
			then {
		_vest= vestsLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Uncommon Backpack x1
	 if (_type == 86) 
			then {
		_backpack= backpacksLootUncommon call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 87) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1
	 if (_type == 88) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn Hat x1/Unifrom x1
	 if (_type == 89) 
			then {
		_hat= hatLootBasic call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon/Ammo x2
	 if (_type == 90) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 2];
					};
						
						
	// Spawn Ammo x3
	 if (_type == 91) 
			then {
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 3];
					};	
						
						
	// Spawn Item x1/Uniform x1
	 if (_type == 92) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
		
		_uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Rare Vest x1
	 if (_type == 93) 
			then {
		_vest= vestsLootRare call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_vest, 1];
					};
						
						
	// Spawn Rare Backpack x1
	 if (_type == 94) 
			then {
		_backpack= backpacksLootRare call bis_fnc_selectRandom;
		 _holder addBackpackCargoGlobal [_backpack, 1];
					};


	// Spawn Ammo x1/item x1
	 if (_type == 95) 
			then {
		_item= itemsLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_item, 1];
			
		_weapon= ammoLootStandard call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 1];
					};


	// Spawn Weapon x1/Uniform x1
	 if (_type == 96) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];

		 _uniforms= uniformLootBasic call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};


	// Spawn hat x2 and unifrom x2
	 if (_type == 97) 
			then {
		_hat= hatLootUncommon call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootUncommon call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
		
		_hat= hatLootUncommon call bis_fnc_selectRandom;
		 _holder additemCargoGlobal [_hat, 1];
		
		_uniforms= uniformLootRare call bis_fnc_selectRandom;
		 _holder addItemCargoGlobal [_uniforms, 1];
					};	
						
						
	// Spawn Weapon x1/Ammo x1
	 if (_type == 98) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
		
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		_holder addWeaponCargoGlobal [_weapon, 1];
		 _holder addMagazineCargoGlobal [_magazineClass, 4];
					};
						
						
	// Spawn Ammo x5
	 if (_type == 99) 
			then {
		_weapon= weaponLootBasic call bis_fnc_selectRandom; 
			_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
			_magazineClass = _magazines call bis_fnc_selectRandom; 

		 _holder addMagazineCargoGlobal [_magazineClass, 4];
					};	
						
						
	isSpawnLootRunning = false;
	};//IsServer 
