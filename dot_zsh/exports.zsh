# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export PYPI_USERNAME="__TOKEN__"
export PYPI_TOKEN=""

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export XDG_CONFIG_HOME="$HOME/.config"
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
export STEAMLIBRARY="$HOME/.local/share/Steam"
export PROTON="$HOME/.local/share/Steam/compatibilitytools.d/GE-Proton10-25/files"
