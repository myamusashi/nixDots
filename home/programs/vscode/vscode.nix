{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      workbench.iconTheme = "material-icon-theme";
      workbench.colorTheme = "Material Theme Darker";
      editor.minimap.enabled = false;

      apc.imports = [
        "file =///home/myamusashi/.vscode-oss/extensions/brandonkirbyson.vscode-animations-2.0.1-universal/dist/updateHandler.js"
      ];

      workbench.settings.applyToAllProfiles = [
        "animations.Command-Palette"
      ];

      vscode_custom_css.imports = [
        ""
      ];

      editor.cursorSmoothCaretAnimation = "on";
      animations.CursorAnimation = true;
      editor.fontFamily = "CaskaydiaMono \Nerd \Font";
      editor.smoothScrolling = true;
      editor.cursorBlinking = "smooth";
      workbench.reduceMotion = "off";
      terminal.integrated.smoothScrolling = true;
      animations.Durations = {
        Scrolling = 200;
        Tabs = 300;
        Smooth-Mode = 200;
        Active = 200;
        Focus-Dimming = 400;
        Command-Palette = 1000;
      };
    };
    extensions = with pkgs.vscode-extensions; [
      golang.go

    ];
  };
}
