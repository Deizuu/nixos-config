{
  stdenv,
  linuxKernel,
  fetchFromGitHub
}: stdenv.mkDerivation rec {
  pname = "t150_driver";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "scarburato";
    repo = "t150_driver";
    rev = "f7ecb30c65ee5f7870e921bc0a2354df8e1e8100";
    sha256 = "162czsaarjq1dbwh7lnp6wcggbblk976ch9qm20qx5lzkr26p3vi";
  };
  nativeBuildInputs = kernel.moduleBuildDependencies;

  sourceRoot = "${src.name}/hid-t150";

  makeFlags = kernelModuleMakeFlags ++ [
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "INSTALL_MOD_PATH=${placeholder "out"}"
  ];

  installPhase = ''
    make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build M=$(pwd) modules_install $makeFlags
  '';
}
