{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "simka";
  home.homeDirectory = "/home/simka";

  home.packages = [
    pkgs.fd
    pkgs.imagemagick
    pkgs.starship
    pkgs.ripgrep
    pkgs.vscode
  ];

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  programs.bat.enable = true;
  programs.exa.enable = true;

  programs.fzf = {
    enable = true;
  };

  programs.htop.enable = true;
  programs.jq.enable = true;
  programs.lazygit.enable = true;

  home.file.".nvm/default-packages".source = config.lib.file.mkOutOfStoreSymlink ./nvm/default-packages;
  home.file.".zshenv".source = config.lib.file.mkOutOfStoreSymlink ./zsh/zshenv;
  home.file.".zsh/.zshrc".source = config.lib.file.mkOutOfStoreSymlink ./zsh/zshrc;
  xdg.configFile."alacritty/alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink ./alacritty/alacritty.yml;
  xdg.configFile."/git/config".source = config.lib.file.mkOutOfStoreSymlink ./git/config;
  xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink ./nvim/init.lua;
  xdg.configFile."starship/starship.toml".source = config.lib.file.mkOutOfStoreSymlink ./starship/starship.toml;
}
