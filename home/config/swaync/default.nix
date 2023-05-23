{ config, lib, pkgs, ... }:

{
  xdg.configFile."swaync/style.css".source = ./style.css;
  xdg.configFile."swaync/config.json".text = ''
{
  "$schema": "${pkgs.swww}/etc/xdg/swaync/configSchema.json",

  "control-center-height": 960,
  "control-center-margin-bottom": 8,
  "control-center-margin-left": 8,
  "control-center-margin-right": 8,
  "control-center-margin-top": 8,
  "control-center-positionX": "none",
  "control-center-positionY": "top",
  "control-center-width": 450,
  "fit-to-screen": false,
  "positionX": "right",
  "positionY": "top",

  "cssPriority": "user",
  "hide-on-action": true,
  "hide-on-clear": true,
  "image-visibility": "when-available",
  "keyboard-shortcuts": true,
  "layer": "overlay",
  "notification-body-image-height": 100,
  "notification-body-image-width": 200,
  "notification-icon-size": 64,
  "notification-window-width": 500,
  "script-fail-notify": true,
  "timeout": 7,
  "timeout-critical": 0,
  "timeout-low": 5,
  "transition-time": 200,

  "widgets": [
    "inhibitors",
    "title",
    "dnd",
    "mpris",
    "notifications"
  ],

  "widget-config": {
    "dnd": {
      "text": "Calm down"
    },
    "inhibitors": {
      "text": "Inhibitors",
      "button-text": "Clear",
      "clear-all-button": true
    },
    "label": {
      "max-lines": 5,
      "text": "Label Text"
    },
    "mpris": {
      "image-size": 96,
      "image-radius": 8
    },
    "title": {
      "text": "Notifications",
      "clear-all-button": true,
      "button-text": "Clear"
    }
  }
}
  '';
}
