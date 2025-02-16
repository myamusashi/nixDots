{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
}:
buildPythonPackage rec {
  pname = "rich-cli";
  version = "1.8.0";

  src = fetchFromGitHub {
    owner = "Textualize";
    repo = "${pname}";
    rev = "v${version}";
    hash = "sha256-mV5b/J9wX9niiYtlmAUouaAm9mY2zTtDmex7FNWcezQ=";
  };

  meta = with lib; {
    description = "";
    homepage = "";
    license = licenses.gpl3;
    maintainers = [];
  };
}
