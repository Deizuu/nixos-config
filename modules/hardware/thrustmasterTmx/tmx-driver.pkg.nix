{
  stdenv,
  fetchFromGitHub,
  linuxHeaders,
  kernel,
  kernelModuleMakeFlags
}: stdenv.mkDerivation rec {
  pname = "tmx-driver";
  version = "unstable";
  
  src = fetchFromGitHub {
    owner = "emtek995";
    repo = "TMX-driver";
    rev = "7e23d9a388de18b96903b6c3e76b20f3a060091f";  # Specific commit
    sha256 = "1hcy2rhpa3kzpmd0rssk80pfpq03vlc8annci8lnwnrdl68msc8y";  # Prefetch hash
  };
  
  nativeBuildInputs = kernel.moduleBuildDependencies;

  sourceRoot = "${src.name}";

  makeFlags = kernelModuleMakeFlags ++ [
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "INSTALL_MOD_PATH=${placeholder "out"}"
  ];

  installPhase = ''
    make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build M=$(pwd) modules_install $makeFlags
  '';
}
