{
  stdenvNoCC,
  fetchurl,
  configFile,
}:
stdenvNoCC.mkDerivation rec {
  name = "phpmyadmin-${version}";
  version = "5.2.2";

  src = fetchurl {
    url = "https://files.phpmyadmin.net/phpMyAdmin/${version}/phpMyAdmin-${version}-all-languages.tar.gz";
    sha256 = "53bad6e63998732db704be45f1ea106cf26be23cf025922e5b2249e7709abc4f";
  };

  phases = [
    "unpackPhase"
    "installPhase"
  ];

  installPhase = ''
    mkdir -p $out
    cp -r * $out/
    ln -s ${configFile} $out/config.inc.php
  '';

  meta = {
    homepage = "https://www.phpmyadmin.net/";
    description = "phpMyAdmin is a free and open source administration tool for MySQL and MariaDB";
  };
}
