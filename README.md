# Chezmoi dotfiles

## Install chezmoi and your dotfiles on a new machine with a single command

chezmoi's install script can run `chezmoi init` for you by passing extra arguments to the newly installed chezmoi binary. If your dotfiles repo is `github.com/$GITHUB_USERNAME/dotfiles` then installing chezmoi, running `chezmoi init`, and running `chezmoi apply` can be done in a single line of shell:

```
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```


