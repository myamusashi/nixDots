{
  image = "phpmyadmin:latest";

  environment = {
    "TZ" = "Asia/Jakarta";
    "MYSQL_ROOT_PASSWORD" = "123";
    "PMA_HOST" = "123";
    "PMA_ABSOLUTE_URI" = "https://phpmyadmin.home.myamusashi";
    "UPLOAD_LIMIT" = "10M";
  };

  volumes = [
    "/home/myamusashi/phpmyadmin/config.user.inc.php:/etc/phpmyadmin/config.user.inc.php"
  ];

  extraOptions = [
    "--pull=newer"
    "--name=phpmyadmin"
    "--hostname=phpmyadmin"
    "--network=net_macvlan"
    "--ip=192.168.1.1"
    "--mac-address="
  ];

  dependsOn = ["mariadb"];
}

