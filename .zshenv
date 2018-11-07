set TERM=xterm-256color
path=(
  /usr/local/{bin,sbin}
  $path
)

. $HOME/anaconda3/etc/profile.d/conda.sh

# if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
#   source "${VIRTUAL_ENV}/bin/activate"
# fi

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
