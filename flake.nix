{
  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://chaotic-nyx.cachix.org"
      "https://ezkea.cachix.org"
      "https://yazi.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=f771eb401a46846c1aebd20552521b233dd7e18b";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/release-24.11";
    sops-nix.url = "github:Mic92/sops-nix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

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

    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

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

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    chaotic,
    nixgl,
    home-manager,
    sops-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
      overlays = [inputs.neovim-nightly-overlay.overlays.default];
    };
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        inputs.hyprpanel.overlay
        inputs.hyprpicker.overlays.default
        inputs.hyprsunset.overlays.default
        inputs.hypridle.overlays.default
        inputs.hyprland.overlays.default
        nixgl.overlay
        inputs.neovim-nightly-overlay.overlays.default
        (import ./overlays/default.nix)
      ];
    };
  in {
    nixosConfigurations = {
      waltz = nixpkgs.lib.nixosSystem {
        inherit system;
        inherit pkgs-stable;

        modules = [
          ./home/users/waltz/default.nix
          ./home/common/programs/git.nix
          ./home/common/programs/htop.nix
          ./home/common/programs/lazygit.nix
          ./home/common/services.nix
          sops-nix.nixosModules.sops
        ];
        specialArgs = {inherit inputs;};
      };

      # NOTE: nixos dan myamusashi sama saja
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          chaotic.nixosModules.default
          ./system/default.nix
          ./home/common/programs/git.nix
          ./home/common/programs/htop.nix
          ./home/common/programs/lazygit.nix
          ./home/common/services.nix
        ];
        specialArgs = {inherit inputs;};
      };
    };

    homeConfigurations = {
      "myamusashi" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit system;
          inherit inputs;
        };

        modules = [
          ./home/users/myamusashi/default.nix
          ./scripts/symlinks/symlinks.nix
        ];
      };
    };
  };
}
