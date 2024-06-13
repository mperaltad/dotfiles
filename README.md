# Chezmoi dotfiles

## Setting up a new MacOS machine

1. `xcode-select --install`
1. `xcodebuild -runFirstLaunch`
1. `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME` assuming your dotfiles repo is `github.com/$GITHUB_USERNAME/dotfiles`
1. Sync cloud files (take a look at dot_zsh/zsh-zsh.tmpl and to dot_tmux/symlink_resurrect.tmpl)
1. Change shell to zsh `which zsh | sudo tee -a /etc/shells` & `chsh -s $(which zsh)`
1. Open a tmux session and press `prefix` + `I` to fetch all the tmux plugins

## Backing up keyboard shortcuts

```
defaults export com.apple.symbolichotkeys - > ./my-macos-keyboard-shortcuts.xml
```

