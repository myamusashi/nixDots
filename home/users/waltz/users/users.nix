{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.waltz = {
    isNormalUser = true;
    description = "gilang";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "vsftpd"];
  };

  users.users.cloudflared = {};
}
