{
  stdenv,
  linuxKernel,
  fetchFromGitHub
}: linuxKernel.buildExternalModule {
  pname = "t150_driver";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "scarburato";
    repo = "t150_driver";
    rev = "f7ecb30c65ee5f7870e921bc0a2354df8e1e8100";
    sha256 = "162czsaarjq1dbwh7lnp6wcggbblk976ch9qm20qx5lzkr26p3vi";
  };
  postPatch = ''
    sed -i '/depmod -A/d' Makefile
    
    substituteInPlace Makefile \
    --replace 'KDIR ?= /lib/modules/$(shell uname -r)/build' \
    'KDIR ?= ${stdenv.cc.cc.lib}/lib/modules/${linuxKernel.modDirVersion}/build'
  '';
  
  meta = with stdenv.lib; {
    description = "Linux driver for Thrustmaster T150 Steering Wheel USB";
    homepage = "https://github.com/scarburato/t150_driver";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}
