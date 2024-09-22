/*
why is this necessary just to use the cli?
is there a better way to do this?
send help

Let's document this here it I forget it for some reason

For some unknown, dumb reason, I though that running `rm -rf ~/.ssh` would be a good idea.
It wasn't, and so I had to find a way to recover my private key - it was stored on the gpg-agent still.
Using `pgp2ssh`, you can derive it with just one command, and it has a flake as well!
I just had some problems using a .gpg extension, but renaming it to priv.asc fixed it

  `nix run github:pinpox/pgp2ssh`

Also, here is the link to the repository it future me is feeling lazy (dumbass)
  https://github.com/pinpox/pgp2ssh

Will bgenix finally support ssh-agent?
*/
let
  # User keys
  supeen = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGe2kpQYXqM0SG7QCiPN1vLeTehGL/l2BGYBrzDz8Ou6";

  # Host keys
  # agenix, why do I have to put this here if it's already my host key:?
  polaris = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMt/fj0+1c7Ktr9WQCqYHoi3jWSxV8/cwEUaT/92DA7q";
in {
  "tailscale.age".publicKeys = [supeen polaris];
  "cloudflare-dns.age".publicKeys = [supeen polaris];
  "navidrome-env.age".publicKeys = [supeen polaris];
}
