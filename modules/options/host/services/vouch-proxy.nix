# WARN: This isn't being used at the moment.
# See: https://kanidm.github.io/kanidm/master/integrations/oauth2/examples.html#vouch-proxy
#
# This module is based from both the following PR and the `security.acme` module on Nixpkgs:
# https://github.com/NixOS/nixpkgs/pull/299381
# https://github.com/NixOS/nixpkgs/blob/c04d5652cfa9742b1d519688f65d1bbccea9eb7e/nixos/modules/security/acme/default.nix
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.attrsets) mapAttrs mapAttrs' nameValuePair recursiveUpdate removeAttrs;
  inherit (lib.modules) mkIf;
  inherit (lib.options) literalExpression mkEnableOption mkOption;
  inherit (lib.types) attrsOf enum listOf nullOr package path port str submodule;

  cfg = config.nice.host.services.vouch-proxy;

  yaml = pkgs.formats.yaml {};

  serviceDescription = idp: {
    description = "Vouch Proxy for ${idp}";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];
  };

  commonServiceConfig = {
    Type = "idle";
    KillSignal = "SIGINT";
    Restart = "on-failure";
    RestartSec = 5;
    StartLimitBurst = 3;

    # hardening
    CapabilityBoundingSet = "";
    DynamicUser = true;
    LockPersonality = true;
    MemoryDenyWriteExecutable = true;
    NoNewPrivileges = true;
    PrivateDevices = true;
    PrivateMounts = true;
    PrivateTmp = true;
    PrivateUsers = true;
    ProcSubset = "pid";
    ProtectClock = true;
    ProtectControlGroups = true;
    ProtectHome = true;
    ProtectHostname = true;
    ProtectKernelLogs = true;
    ProtectKernelTunables = true;
    ProtectProc = "invisible";
    ProtectSystem = "strict";
    RemoveIPC = true;
    RestrictAddressFamilies = [
      "AF_INET"
      "AF_INET6"
    ];
    RestrictNamespaces = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    SystemCallArchitectures = "native";
    SystemCallFilter = [
      "@system-service"
      "~@privileged"
      "~@resources"
    ];
    SystemCallErrorNumber = "EPERM";
  };
in {
  # vouch-proxy can be configured used environment variables, and we're going to abuse that here
  options.nice.host.services = {
    vouch-proxy = {
      enable = mkEnableOption "Vouch proxy authentication service";

      package = mkOption {
        type = package;
        default = pkgs.vouch-proxy;
        description = "The package providing vouch-proxy";
        defaultText = literalExpression "pkgs.vouch-proxy";
      };

      defaults = mkOption {
        default = {};
        description = ''
          Options that should be common to all vouch-proxy's instances.

          All options here must fall under `vouch`, or you run the risk of
          having an invalid configuration file.
        '';
        type = submodule {
          freeformType = yaml.type;

          options = {
            logLevel = mkOption {
              type = str;
              default = "info";
              description = "vouch-proxy's log level.";
            };
          };
        };
      };

      providers = mkOption {
        default = {};
        description = ''
          Attribute set of identity providers, each getting it's own vouch-proxy instance.
        '';
        type = attrsOf (submodule {
          options = {
            environmentFile = mkOption {
              type = nullOr path;
              default = null;
              description = ''
                The environment file to be used on this provider's systemd service config.

                It usually contains sensitive information such as client_id and jwt_secret.
              '';
            };

            vouch = mkOption {
              default = {};
              description = ''
                Free form attribute set containing options under vouch.

                It usually defines things such as the IP Address and port that this instance
                will listen on.
              '';
              type = submodule {
                freeformType = yaml.type;

                options = {
                  listen = mkOption {
                    type = str;
                    default = "127.0.0.1";
                    description = "The IP vouch-proxy will listen on";
                  };

                  port = mkOption {
                    type = port;
                    default = 9090;
                    description = "The port vouch-proxy will listen on";
                  };
                };
              };
            };

            oauth = {
              provider = mkOption {
                type = enum [
                  "oidc"
                  "adfs"
                  "azure"
                  "github"
                  "homeassistant"
                  "indieauth"
                  "nextcloud"
                ];
                default = "oidc";
                description = ''
                  The service providing the necessary credentials for successful login

                  OAUTH_PROVIDER
                '';
              };

              code_challenge_method = mkOption {
                type = str;
                default = "S256";
                description = "OAUTH_CODE_CHALLENGE_METHOD";
              };

              scopes = mkOption {
                type = listOf str;
                default = [];
                description = "OAUTH_SCOPES";
              };

              auth_url = mkOption {
                type = str;
                default = "";
                description = "OAUTH_AUTH_URL";
              };

              callback_url = mkOption {
                type = str;
                default = "";
                description = "OAUTH_CALLBACK_URL";
              };

              token_url = mkOption {
                type = str;
                default = "";
                description = "OAUTH_TOKEN_URL";
              };

              user_info_url = mkOption {
                type = str;
                default = "";
                description = "OAUTH_USER_INFO_URL";
              };
            };
          };
        });
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services = let
      cleanProviders = mapAttrs (_: n: removeAttrs n ["environmentFile"]) cfg.providers;

      providerToCfg = provider: data:
        (serviceDescription provider)
        // {
          serviceConfig =
            commonServiceConfig
            // (let
              finalConfig =
                yaml.generate "config.yaml"
                (recursiveUpdate {vouch = cfg.defaults;} cleanProviders."${provider}");
            in {
              EnvironmentFile = mkIf (data.environmentFile != null) [data.environmentFile];
              ExecStart = "${cfg.package} -config ${finalConfig}";
            });
        };

      vouchConfigs = lib.mapAttrs providerToCfg cfg.providers;
      vouchProxyServices = mapAttrs' (provider: conf: nameValuePair "vouch-proxy-${provider}" conf) vouchConfigs;
    in
      vouchProxyServices;
  };
}
