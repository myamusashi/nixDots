{ pkgs, ... }:

{
  programs.fish.enable = true;

  users.users.myamusashi = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Gilang Ramadhan";
    extraGroups = [ "networkmanager" "wheel" "mlocate" "gns3" "docker" "libvirtd" "wireshark" "ubridge" ];
  };

  users.groups.ubridge = { };
}
