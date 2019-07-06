	_currentUniform = uniform player;
	switch (_currentUniform) do 
	{
		case "U_C_Commoner1_1": 
		{
			player setObjectTextureGlobal [0,"textures\U_abstract_finial.paa"];
		};
		case "U_C_Commoner1_2": 
		{
			player setObjectTextureGlobal [0,"textures\U_abstract_finial.paa"];
		};
		case "U_C_Commoner1_2": 
		{
			player setObjectTextureGlobal [0,"textures\U_abstract_finial.paa"];
		};
		case "U_VirtualMan_F": 
		{
			disableUserInput true;
		};
		case "U_MillerBody":
		{
			player setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"];
		};
		case "U_B_CombatUniform_mcam_vest":
		{
			player setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"];
		};
		case "U_B_SpecopsUniform_sgg": 
		{
			player setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"];
		};
		case "U_B_CombatUniform_mcam_worn": 
		{
			player setObjectTextureGlobal [0, "a3\characters_f_exp\Gendarmerie\Data\U_B_GEN_Soldier_F_02_co.paa"];
		};
		case "U_Marshal": 
		{
			player setObjectTextureGlobal [0, "A3\Characters_F\Civil\Data\ig_poloshirt_2_co.paa"];
		};
		case "U_B_survival_uniform": 
		{
			player setObjectTextureGlobal [0, "\a3\characters_f_epb\BLUFOR\Data\clothing1_dirty_co.paa"];
		};
		case "U_I_CombatUniform_tshirt": 
		{
			player setObjectTextureGlobal [0, "A3\characters_f_exp\Syndikat\Data\U_I_C_Soldier_Para_4_F_2_co.paa"];
		};
		case "U_BG_Guerilla3_2": 
		{
			player setObjectTextureGlobal [0,"textures\U_navy_blue_final.paa"];
		};
		case "U_IG_Guerilla3_2": 
		{
			player setObjectTextureGlobal [0,"textures\U_Pirate_Stripes_v2_Final.paa"];
		};
		case "U_OG_Guerilla3_2": 
		{
			player setObjectTextureGlobal [0, "A3\characters_f_exp\Syndikat\Data\U_I_C_Soldier_Para_4_F_2_co.paa"];
		};
		case "U_BG_Guerilla1_1": 
		{
			player setObjectTextureGlobal [0, "\a3\characters_f_gamma\Civil\Data\c_cloth1_black.paa"];
			player setObjectTextureGlobal [1,"textures\U_Pirate_Stripes_v2_Final.paa"];
		};
		case "U_BG_Guerilla1_2_F": 
		{
			player setObjectTextureGlobal [1, "A3\characters_f_exp\Syndikat\Data\U_I_C_Soldier_Para_4_F_2_co.paa"];
		};
		case "U_C_WorkerCoveralls": 
		{
			player setObjectTextureGlobal [0, "A3\characters_f\common\data\coveralls_urbancamo_co.paa"];
		};
		case "U_O_SpecopsUniform_blk": 
		{
			player setObjectTextureGlobal [0, "A3\Characters_F\Common\Data\basicbody_black_co.paa"];
			player setObjectTextureGlobal [1, "#(argb,8,8,3)color(0.2,0.2,0.2,0.5)"];
		};
		case "U_O_SpecopsUniform_ocamo": 
		{
			player setObjectTextureGlobal [0,"a3\characters_f\OPFOR\Data\clothing_rus_co.paa"];
			player setObjectTextureGlobal [1, "#(argb,8,8,3)color(0.2,0.2,0.2,0.5)"];
		};
		case "U_B_GhillieSuit":
		{
			player setObjectTextureGlobal [0, "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"];
		};
		case "U_B_T_GhillieSuit": 
		{
			player setObjectTextureGlobal [0, "a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"];
		};
		case "U_I_GhillieSuit": 
		{
			player setObjectTextureGlobal [0,"textures\U_Pirate_Stripes_v2_Final.paa"];
		};
	};

player addEventHandler ["Take",
{
	params ["_unit", "_container", "_item"];
	_currentUniform = uniform player;
	switch (_currentUniform) do 
	{
		case "U_C_Commoner1_1": 
		{
			player setObjectTextureGlobal [0,"textures\U_abstract_finial.paa"];
		};
		case "U_C_Commoner1_2": 
		{
			player setObjectTextureGlobal [0,"textures\U_abstract_finial.paa"];
		};
		case "U_C_Commoner1_2": 
		{
			player setObjectTextureGlobal [0,"textures\U_abstract_finial.paa"];
		};
		case "U_VirtualMan_F": 
		{
			disableUserInput true;
		};
		case "U_B_Soldier_VR": 
		{
			disableUserInput true;
		};
		case "U_o_Soldier_VR": 
		{
			disableUserInput true;
		};
		case "U_I_Soldier_VR": 
		{
			disableUserInput true;
		};
		case "U_C_Soldier_VR": 
		{
			disableUserInput true;
		};
		case "U_MillerBody":
		{
			player setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"];
		};
		case "U_B_CombatUniform_mcam_vest":
		{
			player setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"];
		};
		case "U_B_SpecopsUniform_sgg": 
		{
			player setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"];
		};
		case "U_B_CombatUniform_mcam_worn": 
		{
			player setObjectTextureGlobal [0, "a3\characters_f_exp\Gendarmerie\Data\U_B_GEN_Soldier_F_02_co.paa"];
		};
		case "U_Marshal": 
		{
			player setObjectTextureGlobal [0, "A3\Characters_F\Civil\Data\ig_poloshirt_2_co.paa"];
		};
		case "U_B_survival_uniform": 
		{
			player setObjectTextureGlobal [0, "\a3\characters_f_epb\BLUFOR\Data\clothing1_dirty_co.paa"];
		};
		case "U_I_CombatUniform_tshirt": 
		{
			player setObjectTextureGlobal [0, "A3\characters_f_exp\Syndikat\Data\U_I_C_Soldier_Para_4_F_2_co.paa"];
		};
		case "U_BG_Guerilla3_2": 
		{
			player setObjectTextureGlobal [0,"textures\U_navy_blue_final.paa"];
		};
		case "U_IG_Guerilla3_2": 
		{
			player setObjectTextureGlobal [0,"textures\U_Pirate_Stripes_v2_Final.paa"];
		};
		case "U_OG_Guerilla3_2": 
		{
			player setObjectTextureGlobal [0, "A3\characters_f_exp\Syndikat\Data\U_I_C_Soldier_Para_4_F_2_co.paa"];
		};
		case "U_BG_Guerilla1_1": 
		{
			player setObjectTextureGlobal [0, "\a3\characters_f_gamma\Civil\Data\c_cloth1_black.paa"];
			player setObjectTextureGlobal [1,"textures\U_Pirate_Stripes_v2_Final.paa"];
		};
		case "U_BG_Guerilla1_2_F": 
		{
			player setObjectTextureGlobal [1, "A3\characters_f_exp\Syndikat\Data\U_I_C_Soldier_Para_4_F_2_co.paa"];
		};
		case "U_C_WorkerCoveralls": 
		{
			player setObjectTextureGlobal [0, "A3\characters_f\common\data\coveralls_urbancamo_co.paa"];
		};
		case "U_O_SpecopsUniform_blk": 
		{
			player setObjectTextureGlobal [0, "A3\Characters_F\Common\Data\basicbody_black_co.paa"];
			player setObjectTextureGlobal [1, "#(argb,8,8,3)color(0.2,0.2,0.2,0.5)"];
		};
		case "U_O_SpecopsUniform_ocamo": 
		{
			player setObjectTextureGlobal [0,"a3\characters_f\OPFOR\Data\clothing_rus_co.paa"];
			player setObjectTextureGlobal [1, "#(argb,8,8,3)color(0.2,0.2,0.2,0.5)"];
		};
		case "U_B_GhillieSuit":
		{
			player setObjectTextureGlobal [0, "a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"];
		};
		case "U_B_T_GhillieSuit": 
		{
			player setObjectTextureGlobal [0, "a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"];
		};
		case "U_I_GhillieSuit": 
		{
			player setObjectTextureGlobal [0,"textures\U_Pirate_Stripes_v2_Final.paa"];
		};
	};
}];