{ pkgs, ... }:

{
    programs.fish.enable = true;

    users.users.myamusashi = {
        isNormalUser = true;
        shell = pkgs.fish;
        description = "Gilang Ramadhan";
        extraGroups = [ "networkmanager" "wheel" "mlocate" ];
    };
}
