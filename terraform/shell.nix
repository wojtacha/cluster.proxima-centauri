let
  pkgs = import <nixpkgs> {
    config = {
      allowUnfree = true;
    };
  };
in

pkgs.mkShell {
  name = "terraform-env-shell";

  buildInputs = [ pkgs.terraform pkgs.kubectl ];

}
