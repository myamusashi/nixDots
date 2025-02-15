{inputs, ...}: {
  imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];

  programs.hyprpanel = {
    enable = true;

    systemd.enable = true;
    hyprland.enable = false;
    overwrite.enable = true;

    override = {
      theme.bar.background = "override = ";
    };

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [
            "dashboard"
            "cava"
            "media"
            "netstat"
          ];
          middle = [
            "workspaces"
          ];
          right = [
            "volume"
            "network"
            "bluetooth"
            "battery"
            "hyprsunset"
            "systray"
            "clock"
            "notifications"
          ];
        };
        "1" = {
          left = [
            "dashboard"
            "cava"
            "media"
            "windowtitle"
            "netstat"
          ];
          middle = [
            "workspaces"
          ];
          right = [
            "cpu"
            "ram"
            "volume"
            "network"
            "bluetooth"
            "weather"
            "battery"
            "hyprsunset"
            "hypridle"
            "systray"
            "clock"
            "notifications"
          ];
        };
      };
    };

    settings = {
      ## Configuration settings

      scalingPriority = "hyprland";
      wallpaper.enable = true;

      bar = {
        autoHide = "never";

        battery = {
          label = true;
          hideLabelWhenFull = false;
        };

        customModules = {
          weather.unit = "metric";

          ram = {
            labelType = "free";
            label = true;
          };

          cava.showActiveOnly = true;

          cpuTemp.showUnit = true;

          netstat = {
            label = true;
            round = true;
            dynamicIcon = true;
            labelType = "in";
            rateUnit = "auto";
            networkInterface = "";
          };

          hyprsunset.temperature = "3000k";

          hypridle = {
            onIcon = "";
            offIcon = "󰾪";
          };
        };

        bluetooth.label = true;
        network.label = true;
        volume.label = false;

        clock = {
          format = "%a %b %d  %I:%M%P";
          showTime = true;
          showIcon = true;
        };

        media = {
          format = "{artist}";
          truncation_size = 30;
        };

        network = {
          showWifiInfo = true;
          truncation_size = 15;
        };

        workspaces = {
          show_icons = false;
          workspaces = 6;
        };
      };

      theme = {
        matugen = false;

        font = {
          name = "Inconsolata LGC Nerd Font";
          size = ".9rem";
        };

        bar = {
          border_radius = "0.1em";
          outer_spacing = "0em";
          location = "top";
          floating = true;
          transparent = false;
          border.location = "none";
          dropdownGap = "3.1em";

          buttons = {
            y_margins = "0.2em";
            padding_x = "0.4rem";
          };

          menus = {
            menu = {
              notifications = {
                height = "49em";
                pager.show = true;
              };
              power.scaling = 100;
              clock.scaling = 95;
            };
          };
        };

        osd = {
          active_monitor = true;
          margins = "0px 20px 1.5em 30px";
          orientation = "vertical";
          location = "right";
          monitor = 1;
          muted_zero = true;
          radius = "0.1em";
        };
      };

      menus = {
        transition = "none";

        clock.weather = {
          location = "Jakarta";
          key = "57db8ad20afe44b8a9364641242207";
          unit = "metric";
        };

        volume.raiseMaximumVolume = true;
        power.lowBatteryNotification = true;

        media.displayTime = true;
        media.displayTimeTooltip = true;

        dashboard = {
          controls.enabled = false;
          powermenu = {
            avatar.image = "/home/myamusashi/face.png";
            sleep = "systemctl hibernate";
            reboot = "systemctl reboot";
            shutdown = "systemctl poweroff";
          };
          shortcuts = {
            right.shortcut3.command = "$HOME/.dots/home/programs/hypr/scripts/screen-capture.sh";
            right.shortcut1.command = "$HOME/.dots/home/programs/hypr/scripts/picker.sh";

            left.shortcut1.tooltip = "Zen browser";
            left.shortcut1.command = "zen";
            left.shortcut1.icon = "";
            left.shortcut2.command = "LD_PRELOAD=/usr/lib/spotify-adblock.so spotify";
            left.shortcut3.command = "legcord";
            left.shortcut4.command = "$HOME/.config/rofi/launchers/type-5/launcher.sh";
          };
        };
      };

      hyprpanel.restartCommand = "hyprpanel -q; hyprpanel";

      notifications = {
        showActionsOnHover = true;
        position = "top";
      };

      ## Themes settings
      theme = {
        font = {
          label = "Inconsolata LGC Nerd Font Bold";
          weight = 900;
        };

        bar = {
          scaling = 85;

          workspaces = {
            icons.available = "";
            show_numbered = false;
            workspaceMask = true;
            applicationIconOncePerWorkspace = false;
            showWsIcons = true;
            showAllActive = true;
            scroll_speed = 6;
            showApplicationIcons = false;
            monitorSpecific = false;

            workspacesIconMap = {
              "1" = "一";
              "2" = "二";
              "3" = "三";
              "4" = "四";
              "5" = "五";
              "6" = "六";
              "7" = "七";
              "8" = "八";
              "9" = "九";
              "10" = "十";
              "11" = "十一";
              "12" = "十二";
              "13" = "十三";
              "14" = "十四";
              "15" = "十五";
              "16" = "十六";
              "17" = "十七";
              "18" = "十八";
              "19" = "十九";
              "20" = "二十";
            };

            applicationIconFallback = "";
            applicationIconMap = {};
            numbered_active_indicator = "underline";
          };

          menus = {
            transitionTime = 0;
            monochrome = false;
            menu = {
              network = {
                switch.enabled = "#BF616A";
                switch.disabled = "#4C566A";
                switch.puck = "#4b5263";
                scroller.color = "#d16d9e";
              };

              notifications.scaling = 100;

              bluetooth.scroller.color = "#62b3b2";

              clock.weather = {
                thermometer = {
                  cold = "#88C0D0";
                  extremelycold = "#56b6c2";
                };
                hourly = {
                  time = "#BF616A";
                  icon = "#BF616A";
                  temperature = "#BF616A";
                };
              };

              dashboard = {
                scaling = 95;
                card.color = "#00010A";
                background.color = "#0F111A";
                border.color = "#4b5263";
                profile.name = "#BF616A";

                powermenu = {
                  shutdown = "#f07178";
                  restart = "#d19a66";
                  logout = "#A3BE8C";
                  sleep = "#56b6c2";

                  confirmation = {
                    card = "#00010A";
                    background = "#0F111A";
                    border = "#4b5263";
                    label = "#88C0D0";
                    body = "#abb2bf";
                    confirm = "#A3BE8C";
                    deny = "#f07178";
                    button_text = "#0F111A";
                  };
                };

                battery = {
                  slider = {
                    puck = "#4C566A";
                    backgroundhover = "#4C566A";
                    background = "#5c6370";
                    primary = "#EBCB8B";
                  };

                  icons = {
                    active = "#EBCB8B";
                    passive = "#828997";
                  };

                  listitems = {
                    active = "#EBCB8B";
                    passive = "#abb2bf";
                  };

                  text = "#abb2bf";
                  label.color = "#EBCB8B";
                  border.color = "#4b5263";
                  background.color = "#0F111A";
                  card.color = "#00010A";
                };

                systray = {
                  dropdownmenu = {
                    divider = "#00010A";
                    text = "#abb2bf";
                    background = "#0F111A";
                  };
                };

                bluetooth = {
                  iconbutton = {
                    active = "#88C0D0";
                    passive = "#abb2bf";
                  };

                  icons = {
                    active = "#88C0D0";
                    passive = "#5c6370";
                  };

                  listitems = {
                    active = "#88C0D0";
                    passive = "#abb2bf";
                  };

                  switch = {
                    puck = "#4b5263";
                    disabled = "#4C566A";
                    enabled = "#88C0D0";
                  };

                  switch_divider = "#4b5263";

                  status = "#5c6370";
                  text = "#abb2bf";
                  label.color = "#88C0D0";
                  border.color = "#4C566A";
                  background.color = "#0F111A";
                  card.color = "#00010A";
                };

                shortcuts = {
                  background = "#88C0D0";
                  text = "#0F111A";
                  recording = "#A3BE8C";
                };

                controls = {
                  disabled = "#5c6370";

                  wifi.background = "#BF616A";
                  wifi.text = "#0F111A";

                  bluetooth.background = "#56b6c2";
                  bluetooth.text = "#0F111A";

                  notifications.background = "#EBCB8B";
                  notifications.text = "#0F111A";

                  volume.background = "#f07178";
                  volume.text = "#0F111A";

                  input.background = "#BF616A";
                  input.text = "#0F111A";
                };

                clock = {
                  weather = {
                    thermometer = {
                      moderate = "#88C0D0";
                      hot = "#d19a66";
                      extremelyhot = "#f07178";
                    };

                    stats = "#BF616A";
                    status = "#56b6c2";
                    temperature = "#abb2bf";
                    icon = "#BF616A";

                    calendar = {
                      contextdays = "#5c6370";
                      days = "#abb2bf";
                      currentday = "#BF616A";
                      paginator = "#BF616A";
                      weekdays = "#BF616A";
                      yearmonth = "#56b6c2";
                    };

                    time.timeperiod = "#56b6c2";
                    time.time = "#BF616A";

                    text = "#abb2bf";
                    border.color = "#4b5263";
                    background.color = "#0F111A";
                    card.color = "#00010A";
                  };
                };

                directories = {
                  left = {
                    top.color = "#BF616A";
                    middle.color = "#EBCB8B";
                    bottom.color = "#f07178";
                  };
                  right = {
                    top.color = "#56b6c2";
                    middle.color = "#BF616A";
                    bottom.color = "#88C0D0";
                  };
                };

                monitors = {
                  bar_background = "#4C566A";
                  cpu = {
                    icon = "#f07178";
                    bar = "#f07178";
                    label = "#f07178";
                  };
                  ram = {
                    icon = "#EBCB8B";
                    bar = "#EBCB8B";
                    label = "#EBCB8B";
                  };
                  gpu = {
                    icon = "#A3BE8C";
                    bar = "#A3BE8C";
                    label = "#A3BE8C";
                  };
                  disk = {
                    icon = "#BF616A";
                    bar = "#BF616A";
                    label = "#BF616A";
                  };
                };
              };

              power = {
                background.color = "#0F111A";
                border.color = "#4b5263";

                buttons = {
                  shutdown = {
                    background = "#00010A";
                    icon_background = "#f07178";
                    text = "#f07178";
                    icon = "#0F111A";
                  };
                  restart = {
                    background = "#00010A";
                    icon_background = "#d19a66";
                    text = "#d19a66";
                    icon = "#0F111A";
                  };
                  logout = {
                    background = "#00010A";
                    icon_background = "#A3BE8C";
                    text = "#A3BE8C";
                    icon = "#0F111A";
                  };
                  sleep = {
                    background = "#00010A";
                    icon_background = "#56b6c2";
                    text = "#56b6c2";
                    icon = "#0F111A";
                  };
                };
              };

              volume = {
                text = "#abb2bf";
                card.color = "#00010A";
                label.color = "#f07178";
              };

              notifications = {
                label = "#88C0D0";
                no_notifications_label = "#4b5263";
                background = "#0F111A";
                card = "#00010A";
                border = "#4b5263";
                switch_divider = "#4C566A";
                clear = "#f07178";

                switch = {
                  enabled = "#88C0D0";
                  disabled = "#4b5263";
                  puck = "#4C566A";
                };

                pager = {
                  background = "#0F111A";
                  button = "#88C0D0";
                  label = "#828997";
                };

                scrollbar.color = "#88C0D0";
              };

              network = {
                iconbuttons = {
                  active = "#BF616A";
                  passive = "#abb2bf";
                };

                icons = {
                  active = "#BF616A";
                  passive = "#5c6370";
                };

                listitems = {
                  active = "#BF616A";
                  listitems.passive = "#abb2bf";
                };

                status.color = "#5c6370";
                text = "#abb2bf";
                label.color = "#BF616A";
                border.color = "#4C566A";
                background.color = "#0F111A";
                card.color = "#00010A";
              };

              media = {
                slider = {
                  puck = "#5c6370";
                  backgroundhover = "#4b5263";
                  background = "#4b5263";
                  primary = "#A3BE8C";
                };

                buttons = {
                  text = "#0F111A";
                  background = "#A3BE8C";
                  enabled = "#56b6c2";
                  inactive = "#4b5263";
                };

                border.color = "#4C566A";
                background.color = "#0F111A";
                album = "#A3BE8C";
                artist = "#56b6c2";
                song = "#A3BE8C";
              };

              volume = {
                input_slider = {
                  puck = "#4b5263";
                  backgroundhover = "#4b5263";
                  background = "#4b5263";
                  primary = "#f07178";
                };
                audio_slider = {
                  puck = "#4b5263";
                  backgroundhover = "#4b5263";
                  background = "#4b5263";
                  primary = "#f07178";
                };

                icons = {
                  active = "#f07178";
                  passive = "#5c6370";
                };
                iconbutton = {
                  active = "#f07178";
                  passive = "#abb2bf";
                };
                listitems = {
                  active = "#f07178";
                  passive = "#abb2bf";
                };

                border.color = "#4C566A";
                background.color = "#0F111A";
              };
            };

            tooltip.text = "#abb2bf";
            tooltip.background = "#0F111A";


            popover = {
              text = "#88C0D0";
              border = "#0F111A";
              background = "#0F111A";
              scaling = 80;
            };

            dropdownmenu = {
              divider = "#00010A";
              text = "#abb2bf";
              background = "#0F111A";
            };

            slider = {
              puck = "#5c6370";
              backgroundhover = "#4b5263";
              background = "#4b5263";
              primary = "#88C0D0";
            };

            progressbar = {
              background = "#4b5263";
              foreground = "#88C0D0";
            };

            iconbuttons = {
              active = "#88C0D0";
              passive = "#abb2bf";
            };
          };

          buttons = {
            radius = "0.3em";

            style = "default";
          };


        };

        buttons = {
          notifications = {
            total = "#88C0D0";
            icon = "#88C0D0";
            background = "#00010A";
          };

          clock = {
            enableBorder = true;
            icon = "#A3BE8C";
            text = "#A3BE8C";
            background = "#00010A";
          };

          battery = {
            icon = "#EBCB8B";
            text = "#EBCB8B";
            background = "#00010A";
          };

          systray = {
            enableBorder = false;
            background = "#00010A";
          };

          bluetooth = {
            enableBorder = false;
            icon = "#88C0D0";
            text = "#88C0D0";
            background = "#00010A";
          };

          network = {
            icon = "#BF616A";
            text = "#BF616A";
            background = "#00010A";
          };

          volume = {
            icon = "#f07178";
            text = "#f07178";
            background = "#00010A";
          };

          windowtitle = {
            icon = "#A3BE8C";
            text = "#A3BE8C";
            background = "#00010A";
          };

          workspaces = {
            enableBorder = false;
            active = "#BF616A";
            occupied = "#f07178";
            available = "#88C0D0";
            hover = "#4C566A";
            background = "#00010A";
            smartHighlight = false;
          };

          dashboard = {
            enableBorder = false;
            icon = "#EBCB8B";
            background = "#00010A";
          };
        };

        osd = {
          label = "#88C0D0";
          icon = "#0F111A";
          bar_overflow_color = "#f07178";
          bar_empty_color = "#4b5263";
          bar_color = "#88C0D0";
          icon_container = "#88C0D0";
          bar_container = "#0F111A";
        };

        notification = {
          close_button = {
            label = "#0F111A";
            background = "#f07178";
          };

          labelicon = "#88C0D0";
          text = "#abb2bf";
          time = "#5c6370";
          border = "#4b5263";
          label = "#88C0D0";
          scaling = 100;

          actions = {
            text = "#0F111A";
            background = "#88C0D0";
          };

          icon_background = "#88C0D0";
          background = "#0F111A";
        };

        matugen_settings = {
          mode = "dark";
          scheme_type = "tonal-spot";
          variationa = "monochrome_2";
        };
      };
    };
  };
}
