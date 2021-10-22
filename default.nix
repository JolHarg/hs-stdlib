{ 
  nixpkgs ? import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") {},
  compiler ? "ghc901"
} :
let
  gitignore = nixpkgs.nix-gitignore.gitignoreSourcePure [ ./.gitignore ];
  myHaskellPackages = nixpkgs.pkgs.haskell.packages.${compiler}.override {
    overrides = self: super: rec {
      hs-stdlib = self.callCabal2nix "hs-stdlib" (gitignore ./.) {};
      # https://github.com/kallisti-dev/hs-webdriver/issues/177
      webdriver = self.callCabal2nix "webdriver" (builtins.fetchGit {
        url = "https://github.com/danwdart/hs-webdriver.git";
        rev = "52a82be322cbb8ee8e65f87056827a3b89277e2a";
      }) {};
    };
  };
  shell = myHaskellPackages.shellFor {
    packages = p: [
      p.hs-stdlib
    ];
    shellHook = ''
      gen-hie > hie.yaml
    '';
    buildInputs = with nixpkgs; [
      haskellPackages.apply-refact
      haskellPackages.cabal-install
      haskellPackages.ghcid
      haskellPackages.hlint
      haskellPackages.implicit-hie
      haskellPackages.stan
      haskellPackages.stylish-haskell
      haskellPackages.weeder
      parallel
    ];
    withHoogle = false;
  };
  exe = nixpkgs.haskell.lib.justStaticExecutables (myHaskellPackages.hs-stdlib);
in
{
  inherit shell;
  inherit exe;
  inherit myHaskellPackages;
  hs-stdlib = myHaskellPackages.hs-stdlib;
}

