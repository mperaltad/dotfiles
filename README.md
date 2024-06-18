# Chezmoi dotfiles

## Setting up a new MacOS machine

1. `xcode-select --install`
1. `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME` assuming your dotfiles repo is `github.com/$GITHUB_USERNAME/dotfiles`
1. Sync cloud files (take a look at dot_zsh/zsh-zsh.tmpl and to dot_tmux/symlink_resurrect.tmpl)
1. checkout manu branch of .oh-my-zsh (my fork of oh-my-zsh with some powerups)
1. Change shell to zsh `which zsh | sudo tee -a /etc/shells` & `chsh -s $(which zsh)`
1. Open a tmux session and press `prefix` + `I` to fetch all the tmux plugins
1. Install powerline fonts by executing `./install.sh` in  `~/.oh-my-zsh/powerline-fonts/`
1. https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent

## Backing up keyboard shortcuts

```
defaults export com.apple.symbolichotkeys - > ./macos-keyboard-shortcuts.xml
```

## Update oh-my-zsh fork

I use a personal fork of oh-my-zsh on which I have extras added as submodules. When updating the fork make sure to pull submodules updates regularly as well
