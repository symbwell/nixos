{ pkgs, ... }: {
  imports = [ ./hardware.nix ];

  networking.hostName = "lenovo-legion";
  networking.networkmanager.enable = false;
  networking.wireless.iwd.enable = true;
  systemd.network.enable = true;

  boot.loader.refind.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.unifiedKernelImage.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_6_12_65;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      amdgpuBusId = "PCI:6:0:0"; 
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  users.users.royalfoxy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "podman" ];
    shell = pkgs.nushell;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}