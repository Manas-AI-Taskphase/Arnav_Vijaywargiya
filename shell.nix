{ pkgs ? import <nixpkgs> {} }:
let
  my-python-packages = ps: with ps; [
    pandas
    numpy
    matplotlib
  ];
in pkgs.mkShell {
  packages = with pkgs; [
    (python3.withPackages my-python-packages) # we have defined this in the installation section
    espeak-classic
    pyright
    espeakup
  ];
  propagatedBuildInputs = with pkgs; [
    espeak-classic
    jupyter
    pyright
    espeakup
  ];
}
