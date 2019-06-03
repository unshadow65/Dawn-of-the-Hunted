class CfgSounds
{
	sounds[] = {};
	class RadioTransmitter
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "Radio_Transmitter";

		// filename, volume, pitch, distance (optional)
		sound[] = { "fx\wolf1.ogg", 1, 1, 100 };
	};
	
	class RadioReceiver
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "Radio_Receiver";

		// filename, volume, pitch, distance (optional)
		sound[] = { "fx\wolf1.ogg", 1, 1, 100 };
	};
};