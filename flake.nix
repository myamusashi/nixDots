{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:myamusashi/zen-twilight-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };

    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };

    # Hyprspace = {
    #   url = "github:myamusashi/Hyprspace";
    #   inputs.hyprland.follows = "hyprland";
    # };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprsunset = {
      url = "github:hyprwm/hyprsunset";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          inputs.hyprpanel.overlay
          inputs.hyprpicker.overlays.default
          inputs.hyprsunset.overlays.default
          inputs.hypridle.overlays.default
          inputs.hyprland.overlays.default
        ];
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./system/default.nix
            home-manager.nixosModules.home-manager
            {
              nixpkgs.overlays = pkgs.overlays;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."myamusashi" = {
                imports = [
                  ./home/default.nix
                ];
                # Pass inputs to the configuration
                _module.args.inputs = inputs;
              };
            }
          ];
          # Also pass inputs at the system level
          specialArgs = { inherit inputs; };
        };
      };

      homeConfigurations."myamusashi" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/default.nix
          # Pass inputs to the standalone home-manager configuration
          {
            _module.args.inputs = inputs;
          }
        ];
      };
    };
}
