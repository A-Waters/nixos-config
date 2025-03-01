{ configure, pkgs,  ... } :


{
	environment.shellAliases = { 
		switch = "sudo nixos-rebuild switch";
                enix = "sudo nano /etc/nixos/configuration.nix";
	};

}
