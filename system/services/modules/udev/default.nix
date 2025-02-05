{
	services.udev.enable = true;
	services.udev.extraRules = builtins.readFile [
		./rules/battery-low.rules
		./rules/bt-connected.rules
		./rules/charged-battery-connected.rules
	];
}
