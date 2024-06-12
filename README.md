# Chezmoi dotfiles

## Setting up a new machine

1. `xcode-select --install`
1. `xcodebuild -runFirstLaunch`
1. `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME` assuming your dotfiles repo is `github.com/$GITHUB_USERNAME/dotfiles`

## Backing up keyboard shortcuts
```
defaults export com.apple.symbolichotkeys - > ./my-macos-keyboard-shortcuts.xml
```
