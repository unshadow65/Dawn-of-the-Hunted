onPlayerDisconnected if (alive player) then
{
	deleteVehicle player;
};
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	true;
}];
//onPlayerDisconnected diag_log [_id, _uid, _name, _jip, _owner];
onPlayerDisconnected player triggerDynamicSimulation false;
//onPlayerDisconnected "systemChat "Cleaning Disconnected Player Body";";
//onPlayerDisconnected "deleteVehicle player;";
//onPlayerDisconnected "if(alive player) then {deleteVehicle player;};";