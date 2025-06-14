{
  lib,
  fetchFromGitHub,
  php,
}:

php.buildComposerProject2 (finalAttrs: {
  version = "6.10.0";
  pname = "libphp-phpmailer";
  vendorHash = "sha256-5pn2mLFPpD1IdDoznd4H+urXDw870gHwmZ8ificH/wE=";

  src = fetchFromGitHub {
    owner = "PHPMailer";
    repo = "PHPMailer";
    tag = "v${finalAttrs.version}";
    hash = "sha256-zmBc0e9WcZSlOmup9hypl+x2wLhIFbeq+IpplTV2ypg=";
  };
  meta = {
    homepage = "https://github.com/PHPMailer/PHPMailer";
    description = "A full-featured email creation and transfer class for PHP";
    license = lib.licenses.lgpl21Only;
    changelog = "https://github.com/PHPMailer/PHPMailer/raw/v${finalAttrs.version}/changelog.md";
    platforms = lib.platforms.all;
  };
})
