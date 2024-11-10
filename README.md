# nixpkgs-windscribe
Windscribe GUI for NixOS

In response to: https://www.reddit.com/r/NixOS/comments/zpsk1h/i_try_to_package_windscribe_the_vpn_client/

and: https://github.com/NixOS/nixpkgs/issues/158368

`nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'`

`./result/bin/windscribe-cli --version`
