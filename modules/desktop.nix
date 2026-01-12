{ pkgs, ... }: {
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    nushell
    starship
    wezterm
    helix
    yazi
    zellij
    zoxide
    eza
    bat
    ripgrep
    fd
    bottom
    termscp

    git
    vscode
    cursor
    discord
    zen-browser
    _1password-gui
    _1password
    wireguard-tools
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "royalfoxy" ];
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}