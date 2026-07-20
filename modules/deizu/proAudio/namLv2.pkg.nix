{
  stdenv,
  fetchFromGitHub,
  cmake,
}:
stdenv.mkDerivation {
  pname = "neural-amp-modeler-lv2";
  version = "0.2.3";

  src = fetchFromGitHub {
    owner = "mikeoliphant";
    repo = "neural-amp-modeler-lv2";
    tag = "v0.2.3";
    fetchSubmodules = true;
    hash = "sha256-TkynGmhwnkTqieJNuC+H2rDgxYZ9IFvqukfmtbSj790=";
  };

  nativeBuildInputs = [
    cmake
  ];
}
