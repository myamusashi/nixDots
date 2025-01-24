{
    systemd.user.startServices = true;
    
    imports = [
        ./modules/adzan/adzan.nix
        ./modules/get_adzan_data/get_data_adzan.nix
    ];
}
