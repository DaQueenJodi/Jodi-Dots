  { pkgs,
    ...
  }: {

  imports = [
    ./hardware
    ./wm
  ];
}