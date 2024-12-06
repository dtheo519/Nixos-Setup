{ config, lib, pkgs, ... }:

{
   environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
	python3
	vscode-fhs
	termscp

   ];
  programs.git = {
    enable = true;
  };
   }
