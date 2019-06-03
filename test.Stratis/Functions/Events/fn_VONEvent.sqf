comment "Creates an event for VON";

waituntil {!isnull (finddisplay 46)};
_VONKeyDownEventNum = (findDisplay 46) displayAddEventHandler ["KeyDown", 
{
	_inputNames = 
	[
		"voiceOverNet",
		"pushToTalk",
		"PushToTalkAll",
		"PushToTalkSide",
		"PushToTalkCommand",
		"PushToTalkGroup",
		"PushToTalkVehicle"
	];

	{
		if(inputAction _x != 0) then 
		{
			_isAlreadyTalking = player getVariable "isTalking";
			if (isNil "_isAlreadyTalking") then 
			{
				player setVariable ["isTalking",true,true];

				// debug
				hint parseText ("<t size= '1.25'>isTalking: "+(str (player getVariable "isTalking"))+"</t>");
			}
			else 
			{
				if(_x isEqualTo "voiceOverNet") then 
				{
					player setVariable ["isTalking",nil,true];

					// debug
					hint parseText ("<t size= '1.25'>isTalking: "+(str (player getVariable "isTalking"))+"</t>");
				};
			};
		};
	} forEach _inputNames;
}];

_VONKeyUpEventNum = (findDisplay 46) displayAddEventHandler ["KeyUp", 
{
	_inputNames = 
	[
		"voiceOverNet",
		"pushToTalk",
		"PushToTalkAll",
		"PushToTalkSide",
		"PushToTalkCommand",
		"PushToTalkGroup",
		"PushToTalkVehicle"
	];

	{
		if(inputAction _x != 0) then 
		{
			_isAlreadyTalking = player getVariable "isTalking";
			if !(isNil "_isAlreadyTalking") then 
			{
				player setVariable ["isTalking",nil,true];

				// debug
				hint parseText ("<t size= '1.25'>isTalking: "+(str (player getVariable "isTalking"))+"</t>");
			}
		};
	} forEach _inputNames;
}];