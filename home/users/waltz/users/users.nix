{pkgs-stable, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.waltz = {
    isNormalUser = true;
    description = "gilang";
    shell = pkgs-stable.fish;
    extraGroups = ["networkmanager" "wheel" "vsftpd"];
  };
	
	users.users.cloudflared.isNormalUser = true;
  users.users.cloudflared.group = "cloudflared";
  users.groups.cloudflared = {};
}
