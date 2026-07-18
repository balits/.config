{ inputs, pkgs, ... }:

{
  # nix magic stuff
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."peti" = {
    isNormalUser = true;
    description = "peti";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.noto
    nerd-fonts.fira-code
    nerd-fonts.sauce-code-pro
  ];
  
  # Random ass programs
  programs.firefox.enable = false;
  programs.fish.enable = true;
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../.tmux.conf;
  };

  # actual packages
  environment.systemPackages = with pkgs; [
    	git
    	fish
    	vim
    	helix
    	alacritty
    	tmux
    	gh
    	delta # cool diff pager for git

    	eza
    	tree
    	bat
    	fd
    	htop

    	rustup
    	gnumake
    	gcc
    	gdb
    	perf
    	bpftrace

    	inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    	# misc
    	gparted
    	nil
    	nixfmt
    ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment? :D
}
