<p align="center">
    nicekoishi/dotfiles
</p>

## About
Every day I keep using NixOS, I can't help but like it even more.
It's really that cool.

Now about the config itself? Kindly borrowed code, a bit of coffee
and me going deaf from loud music (I should really turn down the volume).

## Desktop Preview
<p id="preview" align="center">
    <img src="https://github.com/nicekoishi/dotfiles/assets/89671198/c80face8-fe92-412e-b9b1-0ae017553d16" />
</p>

## Structure

- [environment](environment): environment variables for my sessions
- [flake](flake): modular flake.nix thanks to [flake-parts](https://github.com/hercules-ci/flake-parts)
  - [modules](flake/modules): collection of useful modules you may want to use
  - [packages](flake/pkgs): collection of useless packages that no one would ever use
- [home](home): [home-manager](https://github.com/nix-community/home-manager) configuration
  - [editors](home/editors): my editors configuration, mainly using neovim
  - [profiles](home/profiles): all my home-manager imports are made there
  - [programs](home/programs): programs and their configurations, managed by home-manager
  - [terminal](home/terminal): terminal emulators and cli programs configuration
  - [theme](home/theme): ~~hopefully~~ unified theming for all my systems
- [hosts](hosts): host specific configuration
  - [polaris](hosts/polaris): main ~~and for now only~~ host of this configuration. It has a NVIDIA card, unfortunately
- [modules](modules): modules shared across my hosts
  - [core](modules/core): without this, we can't even boot
  - [programs](modules/programs): nixos system level configuration, things like fonts and desktop environment
  - [services](modules/services): useful services for my host~~s~~

## Outputs

Run packages with:

```console
    nix run github:nicekoishi/dotfiles#<package>
```

Or install them through your inputs:

```nix
# flake.nix
{
    inputs.nicekoishi-dots = {
        url = "github:nicekoishi/dotfiles";
        inputs.nixpkgs.follows = "nixpkgs"
    };
}

# configuration.nix
{pkgs, inputs, ...}: {
    environment.systemPackages = [
        inputs.nicekoishi-dots.packages."${pkgs.system}".<package>
    ];
}
```

Same thing for modules:

```nix
# flake.nix
...

# configuration.nix
{inputs, ...}: {
    imports = [
        # for nixos modules
        inputs.nicekoishi-dots.nixosModules.<module>

        # for home manager modules
        inputs.nicekoishi-dots.homeManagerModules.<module>
    ];
}
```

## Credits

Here is a collection of all repos I ~~shamelessy~~ kindly borrowed
some code from. My special thanks goes to both fufexan and NotAShelf, 
as I learned a lot from their configurations alone.

I couldn't have done any of this if it wasn't for these amazing people.

- [NotAShelf](https://github.com/NotAShelf/nyx)
- [fufexan](https://github.com/fufexan/dotfiles)
- [dustinlyons](https://github.com/dustinlyons/nixos-config)
- [hlissner](https://github.com/hlissner/dotfiles)
- [MatthiasBenaets](https://github.com/MatthiasBenaets/nixos-config)
- [Misterio77](https://github.com/Misterio77/nix-config)
- [n3oney](https://github.com/n3oney/nixus)
- [NobbZ](https://github.com/NobbZ/nixos-config)
- [outfoxxed](https://github.com/outfoxxed)
- [pimeys](): repo isn't on GitHub anymore, but I still keep it here