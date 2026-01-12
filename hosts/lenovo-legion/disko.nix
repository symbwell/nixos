{
  disko.devices = {
    disk = {
      system = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = { type = "filesystem"; format = "vfat"; mountpoint = "/boot"; };
            };
            swap = {
              size = "8G";
              content = { type = "swap"; discardPolicy = "both"; };
            };
            root = {
              size = "100%";
              content = { type = "filesystem"; format = "xfs"; mountpoint = "/"; };
            };
          };
        };
      };
      data = {
        type = "disk";
        device = "/dev/nvme1n1";
        content = {
          type = "gpt";
          partitions = {
            home = {
              size = "100%";
              content = { type = "filesystem"; format = "xfs"; mountpoint = "/home"; };
            };
          };
        };
      };
    };
  };
}