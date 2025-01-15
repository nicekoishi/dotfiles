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

Let's be honest, using a GPG key as an SSH key wasn't the brightest idea. So we stay with good old
ssh-keygen and ssh-agent.

By the way, if any of these keys are appearing on `git diff` despite what `.gitattributes` say,
Try using `git add --renormalize`.
*/
let
  # User keys
  supeen = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILS3uO3yGee8JadAAwk9ojmyv0+fX4XG3sqSYxVVigQF";

  # Host keys
  # I'm dumb
  polaris = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQkx4TRxbVNK1LZDwzgczATSBu+PmoFUl5lzUDv2oex";
in {
  "tailscale.age".publicKeys = [supeen polaris];
  #"cloudflare-dns.age".publicKeys = [supeen polaris];
  #"kanidm-idm-admin.age".publicKeys = [supeen polaris];
  #"kanidm-admin.age".publicKeys = [supeen polaris];
  #"navidrome-env.age".publicKeys = [supeen polaris];
}
