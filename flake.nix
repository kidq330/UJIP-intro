{
  inputs = { utils.url = "github:numtide/flake-utils"; };
  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nixd
            nixfmt

            nodejs # https://pptr.dev/troubleshooting#issues-with-apparmor-on-ubuntu
            # mermaid-cli # https://github.com/NixOS/nixpkgs/issues/335148
            presenterm
          ];
        };
      });
}
