{
  stdenv,
  linuxKernel,
  fetchFromGitHub
}: linuxKernel.buildExternalModule {
  pname = "tmx-driver";
  version = "unstable";
  
  src = fetchFromGitHub {
    owner = "emtek995";
    repo = "TMX-driver";
    rev = "7e23d9a388de18b96903b6c3e76b20f3a060091f";  # Specific commit
    sha256 = "1hcy2rhpa3kzpmd0rssk80pfpq03vlc8annci8lnwnrdl68msc8y";  # Prefetch hash
  };
  
  postPatch = ''
    sed -i '/depmod -A/d' Makefile
  '';
  
  meta = with stdenv.lib; {
    description = "Linux Kernel Module for Thrustmaster TMX Racing Wheel";
    homepage = "https://github.com/emtek995/TMX-driver";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}
