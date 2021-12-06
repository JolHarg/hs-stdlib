{ 
  nixpkgs ? import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") {},
  compiler ? "ghc921"
} :
let
  gitignore = nixpkgs.nix-gitignore.gitignoreSourcePure [ ./.gitignore ];
  lib = nixpkgs.pkgs.haskell.lib;
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
      for i in $(find -type f); do krank $i; done
    '';
    buildInputs = with myHaskellPackages; with nixpkgs; with haskellPackages; [
      apply-refact
      cabal-install
      ghcid
      ghcide
      haskell-language-server
      hasktags
      hlint
      implicit-hie
      krank
      haskellPackages.stan # issue with 9.0.1
      stylish-haskell
      weeder
    ];
    withHoogle = false;
  };
  exe = lib.justStaticExecutables (myHaskellPackages.hs-stdlib);
in
{
  inherit shell;
  inherit exe;
  inherit myHaskellPackages;
  hs-stdlib = myHaskellPackages.hs-stdlib;
}

