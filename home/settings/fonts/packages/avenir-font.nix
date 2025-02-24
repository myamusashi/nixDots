{
  lib,
  stdenvNoCC,
  fetchzip,
}:
stdenvNoCC.mkDerivation rec {
  pname = "avenir-lt-pro";

  src = fetchzip {
    url = "https://font.download/dl/font/${pname}.zip";
    sha256 = "";
  };

  postInstall = ''
    mkdir -p $out/share/fonts/truetype/${pname}

    install -Dm644 ./AvenirLTProBlack.otf $out/share/fonts/truetype/${pname}/AvenirLTProBlack.otf
    install -Dm644 ./AvenirLTProBlackOblique.otf $out/share/fonts/truetype/${pname}/AvenirLTProBlackOblique.otf
    install -Dm644 ./AvenirLTProBook.otf $out/share/fonts/truetype/${pname}/AvenirLTProBook.otf
    install -Dm644 ./AvenirLTProBookOblique.otf $out/share/fonts/truetype/${pname}/AvenirLTProBookOblique.otf
    install -Dm644 ./AvenirLTProHeavy.otf $out/share/fonts/truetype/${pname}/AvenirLTProHeavy.otf
    install -Dm644 ./AvenirLTProHeavyOblique.otf $out/share/fonts/truetype/${pname}/AvenirLTProHeavyOblique.otf
    install -Dm644 ./AvenirLTProLight.otf $out/share/fonts/truetype/${pname}/AvenirLTProLight.otf
    install -Dm644 ./AvenirLTProLightOblique.otf $out/share/fonts/truetype/${pname}/AvenirLTProLightOblique.otf
    install -Dm644 ./AvenirLTProMedium.otf $out/share/fonts/truetype/${pname}/AvenirLTProMedium.otf
    install -Dm644 ./AvenirLTProMediumOblique.otf $out/share/fonts/truetype/${pname}/AvenirLTProMediumOblique.otf
    install -Dm644 ./AvenirLTProOblique.otf $out/share/fonts/truetype/${pname}/AvenirLTProOblique.otf
    install -Dm644 ./AvenirLTProRoman.otf $out/share/fonts/truetype/${pname}/AvenirLTProRoman.otf
  '';

  meta = with lib; {
    description = "";
    homepage = "";
    maintainers = [myamusashi];
  };
}
