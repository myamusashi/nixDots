final: prev: {
  kitty = prev.kitty.overrideAttrs (oldAttrs: {
    version = "0.40.1";

    src = prev.fetchFromGitHub {
      owner = "kovidgoyal";
      repo = "kitty";
      tag = "v0.40.1";
      hash = "sha256-ta9MTbSkIkowkd5zBUbtauFNGVRDgxof1SSQXuEgFTQ=";
    };

    # Hapus patch-patch yang tidak ada di versi 0.40.1
    patches = [
      # Gets `test_ssh_env_vars` to pass when `bzip2` is in the output of `env`.
      ./fix-test_ssh_env_vars.patch

      # Needed on darwin
      # Gets `test_ssh_shell_integration` to pass for `zsh` when `compinit` complains about
      # permissions.
      ./zsh-compinit.patch

      # Skip `test_ssh_bootstrap_with_different_launchers` when launcher is `zsh` since it causes:
      # OSError: master_fd is in error condition
      ./disable-test_ssh_bootstrap_with_different_launchers.patch
    ];

    # Ganti Go 1.24 dengan Go 1.23
    nativeBuildInputs =
      builtins.map
      (input:
        if input == prev.go_1_24
        then prev.go_1_23
        else input)
      oldAttrs.nativeBuildInputs;

    # Ganti buildGo124Module dengan buildGo123Module
    goModules =
      (prev.buildGo123Module {
        pname = "kitty-go-modules";
        inherit (oldAttrs) src;
        version = "0.40.1";
        vendorHash = "sha256-wr5R2X+lV8vVVWsDYLLSaz7HRNOB7Zzk/a7knsdDlXs=";
      }).goModules;

    # Perbarui preCheck jika diperlukan
    preCheck = prev.lib.optionalString prev.stdenv.hostPlatform.isDarwin ''
      # can be re-enabled with the next kitty release, see https://github.com/kovidgoyal/kitty/pull/7939
      substituteInPlace kitty_tests/file_transmission.py \
        --replace test_transfer_send dont_test_transfer_send
      # theme collection test starts an http server
      rm tools/themes/collection_test.go
      # passwd_test tries to exec /usr/bin/dscl
      rm tools/utils/passwd_test.go
    '';

    # Perbarui wrapProgram untuk menggunakan --prefix daripada --suffix
    installPhase =
      builtins.replaceStrings
      ["--suffix PATH :"]
      ["--prefix PATH :"]
      oldAttrs.installPhase;
  });
}
