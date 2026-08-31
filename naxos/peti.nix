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
  };

  # this reqiures paid proton
  #  # systemd.user.services.protonmail-bridge = {
  #   enable = true;
  #   description = "ProtonMail Bridge";
  #   after = [ "network-online.target" ];
  #   wants = [ "network-online.target" ];
  #   wantedBy = [ "default.target" "multi-user.target" ];
  #   unitConfig.ConditionUser = "peti";
  #   serviceConfig = {
  #     Type = "simple";
  #     ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive";
  #     Restart = "always";
  #     RestartSec = 5;
  #   };
  # };   

  #  # expose protonbridge
  # systemd.tmpfiles.rules =  [
  #   "d /var/lib/protonbridge 0750 protonbridge protonbridge - -"
  #   "d /var/lib/protonbridge/.cache 0755 protonbridge protonbridge - -"
  #   "d /var/lib/protonbridge/.config 0755 protonbridge protonbridge - -"
  # ];

  fonts.packages = with pkgs; [
    nerd-fonts.noto
    nerd-fonts.fira-code
    nerd-fonts.sauce-code-pro
    nerd-fonts.blex-mono
    nerd-fonts.code-new-roman
    nerd-fonts.departure-mono
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.ubuntu-mono
  ];
  
  # Random ass programs
  programs.firefox.enable = false;
  programs.fish.enable = true;
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../.tmux.conf;
  };

  # env vars for whatever reason,
  # but its not the cleanest way
  # to handle helix i think...
  environment.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    HELIX_RUNTIME = "/home/peti/personal/build-from-source/helix/runtime";
  };


  # actual packages
  environment.systemPackages = with pkgs; [
    	git
    	fish
    	vim
    	# built from source for steel + plugins
    	# helix
    	alacritty
    	tmux
    	gh
    	delta # cool diff pager for git

    	eza
    	tree
    	bat
    	fd
    	htop
    	ripgrep

    	rustup
    	gnumake
    	gcc
    	gdb
    	perf
    	bpftrace

    	inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    	# editor, lsp, etc
    	nil
    	nixfmt
    	# texlab
    	# pkgs.texlive.combine {
      #    inherit (pkgs.texlive)
      #      scheme-basic
      #      preprint
      #      titlesec
      #      marvosym
      #      enumitem
      #      hyperref
      #      fancyhdr
      #      babel
      #      texlab;
      # }

    	# misc
    	gparted
    	qbittorrent
      thunderbird    	
    	gitui
    ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment? :D
}
