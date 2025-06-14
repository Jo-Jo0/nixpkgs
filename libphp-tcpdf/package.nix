{
  lib,
  fetchFromGitHub,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libphp-tcpdf";
  version = "6.10.0";
  
  src = fetchFromGitHub {
    owner = "tecnickcom";
    repo = "tcpdf";
    tag = "${finalAttrs.version}";
    hash = "sha256-RfCLmY7AHiGp18os6UFm56za++nxY3nZ6rieLeVmCK0=";
  };
  buildPhase = ''
    cp -r $src $out
  '';
  meta = {
    homepage = "https://tcpdf.org";
    description = "PHP PDF Library";
    license = lib.licenses.lgpl3Plus;
    changelog = "https://github.com/tecnickcom/TCPDF/raw/${finalAttrs.version}/CHANGELOG.TXT";
    platforms = lib.platforms.all;
    maintainers = with lib.maintainers; [ Jo-Jo0 ];
  };
})
