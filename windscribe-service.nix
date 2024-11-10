{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.windscribe;
in {
  options = {
    services.windscribe = {
      enable = mkEnableOption "Windscribe VPN service";
      
      package = mkOption {
        type = types.package;
        default = pkgs.windscribe;
        description = "The Windscribe package to use.";
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    # Link configuration files
    environment.etc = {
      "windscribe/cert.pem" = {
        source = "${cfg.package}/etc/windscribe/cert.pem";
      };
      "windscribe/cgroups-down" = {
        source = "${cfg.package}/etc/windscribe/cgroups-down";
        mode = "0755";
      };
      "windscribe/cgroups-up" = {
        source = "${cfg.package}/etc/windscribe/cgroups-up";
        mode = "0755";
      };
      "windscribe/dns-leak-protect" = {
        source = "${cfg.package}/etc/windscribe/dns-leak-protect";
        mode = "0755";
      };
      "windscribe/install-update" = {
        source = "${cfg.package}/etc/windscribe/install-update";
        mode = "0755";
      };
      "windscribe/update-network-manager" = {
        source = "${cfg.package}/etc/windscribe/update-network-manager";
        mode = "0755";
      };
      "windscribe/update-resolv-conf" = {
        source = "${cfg.package}/etc/windscribe/update-resolv-conf";
        mode = "0755";
      };
      "windscribe/update-systemd-resolved" = {
        source = "${cfg.package}/etc/windscribe/update-systemd-resolved";
        mode = "0755";
      };
    };

    # Install systemd services
    systemd.packages = [ cfg.package ];

    # Ensure required directories exist with proper permissions
    systemd.tmpfiles.rules = [
      "d /var/log/windscribe 0755 root root -"
      "d /var/lib/windscribe 0755 root root -"
    ];

    # Install polkit policy
    security.polkit.enable = true;
  };
}