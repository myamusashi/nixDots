{pkgs, ...}: {
  xonsh = {
    enable = true;
    package = pkgs.xonsh;
    config = ''
      execx($(starship init xonsh))
    '';
  };
}
