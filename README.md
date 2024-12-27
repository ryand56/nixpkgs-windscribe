<h1 align="center">
   <img src="https://static.windscribe.com/v2/img/WS-Logo-white@2x.png" width="200px" /> 
   <br>
  nixpkgs-windscribe
   <div align="center">
</div>
</h1>

<div align="center"> Unofficial Windscribe GUI & CLI for NixOS </div>
<div align="center"> (working) </div>

> [!NOTE]
> Currently only WireGaurd protocol works.
> Stealth, UDP, TCP, and WSTunnel protocols are a work in progress.
> This project is a work in progress

nixpkg for https://github.com/Windscribe/Desktop-App

In response to: https://www.reddit.com/r/NixOS/comments/zpsk1h/i_try_to_package_windscribe_the_vpn_client/

https://github.com/Windscribe/Desktop-App/issues/131

and: https://github.com/NixOS/nixpkgs/issues/158368


### The Nix Module

This project has two parts, a Nix module, and a windscribe executable / service.

To test the module, cd into the windscribe folder and run:

`nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'`

`./result/bin/windscribe-cli --version`

If you get a version back then it is working!

Since everyones config is structured a little differently, you will have to figure out how and where to incorporate the 'windscribe' folder module in your Nix flake and configuration.

In my configuration.nix I have:

```nix
services.windscribe = {
enable = true;
autoStart = true;  # Optional: set to false if you don't want it to start automatically
};
```

You must put the windscribe folder into your NixOS configuration as a module. The windscribe folder contains default.nix and package.nix files. The Wiregaurd protocol will not work without this step, and the VPN will not connect. 'windscribe' must be declared as a module in your Nix flake.


### Running The Executable(s)

there's no service related stuff set up for this yet, so you'll need to manually start the helper:
```bash
# (in another shell/run it in the background/etc)
sudo nix run .#windscribe_helper
```

then actually run the main windscribe executable:
```bash
nix run .#
```

### Contributions to this repo are welcomed, just make a pull request!!!

I hope you understood anything here because I didn't.

Good Luck! 😉

### Credits

[Windscribe](https://github.com/Windscribe) for their amazing VPN.

thanks to [adrianmgg](https://github.com/Windscribe) for his excellent work getting the GUI working.
