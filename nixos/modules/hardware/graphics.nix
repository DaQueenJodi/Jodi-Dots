 { lib, pkgs, config, ... }:
  with lib; let
    cfg = config.modules.hardware.graphics;
   in {
   hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
        mesa.drivers
        rocm-opencl-icd
        rocm-opencl-runtime
        clinfo
      ];
   };
 }
