{
  description = "Software packaged by Jo-Jo0";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs } @inputs:
  let
    supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
  in
  {
    packages = forAllSystems(system:
    let
     pkgs = nixpkgsFor.${system};
    in
    {
      libphp-tcpdf = pkgs.callPackage ./libphp-tcpdf/package.nix {};
      libphp-phpmailer = pkgs.callPackage ./libphp-phpmailer/package.nix {};
    }
    );
    hydraJobs = {
      inherit (self)
        packages;
    };
  };
}
