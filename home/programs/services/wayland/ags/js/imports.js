// kindly borrowed from NotAShelf, just like most of the stuff here
export const require = async (file) => (await import(resource(file))).default;
export const requireCustom = async (/** @type {string}*/ path) =>
    (await import(path)).default;
export const resource = (file) => `resource:///com/github/Aylur/ags/${file}.js`;
export const fromService = async (file) => await require(`service/${file}`);

// Required stuff
export const App = await require("app");
export const GLib = await requireCustom("gi://GLib");
export const Gtk = await requireCustom("gi://Gtk?version=3.0");
export const Service = await require("service");
export const Utils = await import(resource("utils"));
export const Variable = await require("variable");
export const Widget = await require("widget");

// Services
export const Audio = await fromService("audio");
export const Hyprland = await fromService("hyprland");
export const Mpris = await fromService("mpris");
export const Network = await fromService("network");
export const Notifications = await fromService("notifications");
export const SystemTray = await fromService("systemtray");

export const Icons = await requireCustom("./utils/icons.js");
