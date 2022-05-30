{ 
  nixpkgs ? import <unstable> {},
  haskell-tools ? import (builtins.fetchTarball "https://github.com/danwdart/haskell-tools/archive/master.tar.gz") {},
  compiler ? "ghc923"
} :
let
  gitignore = nixpkgs.nix-gitignore.gitignoreSourcePure [ ./.gitignore ];
  tools = haskell-tools compiler;
  lib = nixpkgs.pkgs.haskell.lib;
  myHaskellPackages = nixpkgs.pkgs.haskell.packages.${compiler}.override {
    overrides = self: super: rec {
      hs-stdlib = lib.dontHaddock (self.callCabal2nix "hs-stdlib" (gitignore ./.) {});
      # https://github.com/kallisti-dev/hs-webdriver/issues/177
      #webdriver = self.callCabal2nix "webdriver" (builtins.fetchGit {
      #  url = "https://github.com/danwdart/hs-webdriver.git";
      #  rev = "52a82be322cbb8ee8e65f87056827a3b89277e2a";
      #}) {};
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
    buildInputs = tools.defaultBuildTools;
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

