{
  stdenv,
  fetchFromGitHub,
  kernel,
  kernelModuleMakeFlags,
}:
stdenv.mkDerivation rec {
  pname = "tmx-driver";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "emtek995";
    repo = "TMX-driver";
    rev = "7e23d9a388de18b96903b6c3e76b20f3a060091f";
    sha256 = "1hcy2rhpa3kzpmd0rssk80pfpq03vlc8annci8lnwnrdl68msc8y";
  };

  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = kernelModuleMakeFlags ++ [
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
  ];

  buildPhase = ''
    make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build M=$(pwd) modules
  '';

  installPhase = ''
    make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build M=$(pwd) INSTALL_MOD_PATH=$out modules_install
  '';
}
