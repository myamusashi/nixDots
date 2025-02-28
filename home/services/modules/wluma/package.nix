{
  lib,
  stdenv,
  fetchFromGitHub,
  makeWrapper,
  rustPlatform,
  marked-man,
  coreutils,
  vulkan-loader,
  wayland,
  pkg-config,
  udev,
  v4l-utils,
  dbus,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "wluma";
  version = "4.8.0";

  src = fetchFromGitHub {
    owner = "maximbaz";
    repo = pname;
    rev = version;
    hash = "sha256-O8pS6E1wgWdAgDbZnN9CDA0OgpN0pxYwOzVPxQS+SFs=";
  };

  postPatch = ''
    substituteInPlace 90-wluma-backlight.rules --replace \
      'RUN+="/bin/' 'RUN+="${coreutils}/bin/'

    substituteInPlace wluma.service --replace \
      'ExecStart=/usr/bin/wluma' 'ExecStart=${placeholder "out"}/bin/wluma'
  '';

  useFetchCargoVendor = true;
  cargoHash = "sha256-eFHZ5F60Ra66ycbtLBF/qAzWejNX/3Lgm1skOYxc3Q4=";

  nativeBuildInputs = [
    makeWrapper
    pkg-config
    rustPlatform.bindgenHook
    marked-man
  ];

  buildInputs = [
    udev
    v4l-utils
    vulkan-loader
    dbus
  ];

  dontCargoInstall = false;
  installFlags = ["PREFIX=${placeholder "out"}"];
  postInstall = ''
    mkdir -p $out/etc/systemd/system/
    mkdir -p $out/lib/udev/rules.d

    cp wluma.service $out/etc/systemd/system/
    cp 90-wluma-backlight.rules $out/lib/udev/rules.d
		
		chmod 644 $out/etc/systemd/system/wluma.service

    wrapProgram $out/bin/wluma \
              --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [wayland]}"
  '';

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Automatic brightness adjustment based on screen contents and ALS";
    homepage = "https://github.com/maximbaz/wluma";
    changelog = "https://github.com/maximbaz/wluma/releases/tag/${version}";
    license = licenses.isc;
    maintainers = with maintainers; [
      yshym
      jmc-figueira
      atemu
    ];
    platforms = platforms.linux;
    mainProgram = "wluma";
  };
}
