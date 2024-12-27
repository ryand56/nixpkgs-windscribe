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

`nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'`

`./result/bin/windscribe-cli --version`


You must put the windscribe folder into your NixOS configuration as a module. The windscribe folder contains default.nix and package.nix files. The Wiregaurd protocol will not work without this step, and the VPN will not connect.

there's no service related stuff set up for this yet, so you'll need to manually start the helper
```bash
# (in another shell/run it in the background/etc)
sudo nix run .#windscribe_helper
```

then actually run the main windscribe executable
```bash
nix run .#
```

Contributions to this repo are welcomed, just make a pull request.

Good Luck!

### Credits

[https://github.com/Windscribe](Windscribe) for their amazing VPN.

thanks to [https://github.com/adrianmgg](adrianmgg) for his excellent work getting the GUI working.