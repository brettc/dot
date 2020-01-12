# ZPLUG from here -----------------------------------------------------------
# zmodload zsh/zprof

[[ -d ~/.zplug ]] || {
	git clone https://github.com/zplug/zplug ~/.zplug
	source ~/.zplug/init.zsh && zplug update --self
}

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zsh plugins
# Start sensibly!
zplug "yous/vanilli.sh"
zplug "chrissicool/zsh-256color"
#zplug "unixorn/warhol.plugin.zsh" colors?
zplug "shayneholmes/zsh-iterm2colors"

zplug "supercrabtree/k"
# zplug "b4b4r07/enhancd", use:init.sh
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "djui/alias-tips"
zplug "joshuarubin/zsh-homebrew"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "ael-code/zsh-plugin-fasd"
zplug "esc/conda-zsh-completion"

zplug "greymd/awless-zsh-completion"

# zplug "plugins/common-aliases", from:oh-my-zsh
#zplug "jimmijj/zsh-syntax-highlighting"
zplug "zdharma/fast-syntax-highlighting"
# zplug "trapd00r/zsh-syntax-highlighting-filetypes"

# zplug "sorin-ionescu/prezto", use:modules/git/alias.zsh
# Fancy mac completions
# zplug "unixorn/tumult.plugin.zsh"
#
# Conda environments
# zplug "bckim92/zsh-autoswitch-conda"

# Coding
zplug "voronkovich/gitignore.plugin.zsh"
# zplug "davidparsson/zsh-pyenv-lazy"

# Prompt
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# GEOMETRY_PROMPT_SUFFIX="'\n'"
# PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
# zplug "geometry-zsh/geometry"

# install any uninstalled plugins
zplug check || zplug install

export ZSH_PLUGINS_ALIAS_TIPS_TEXT='💡 '
# export EMOJI_CLI_KEYBIND='^ '

zplug load

unset CONDA_PROMPT_MODIFIER

precmd() {
    # if [[ -n $CONDA_DEFAULT_ENV ]]; then
        if [[ $CONDA_DEFAULT_ENV = base ]]; then
            unset VIRTUAL_ENV
        else
            VIRTUAL_ENV=$CONDA_DEFAULT_ENV
        fi
    # fi
}

stty stop undef
stty start undef

# source /usr/local/share/zsh/site-functions/_awless
# eval "$(fasd --init auto)"

# source ~/.zshrc.local
# [[ $SHLVL != "2" ]] && tmux new
####### alias ls="gls --color"
#

# Virtual envs
# export WORKON_HOME=~/.ve
# export PROJECT_HOME=~/Code

# export PATH="$HOME/miniconda3/bin:$PATH"
# Too many problems!
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv init -)"
# pyenv virtualenvwrapper_lazy

# conda activate base
export PATH="$HOME/bin:$PATH"
export EDITOR=nvim
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'


# zprof

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/brett.calcott/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/brett.calcott/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/brett.calcott/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/brett.calcott/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda deactivate

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/brett.calcott/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/brett.calcott/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/brett.calcott/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/brett.calcott/google-cloud-sdk/completion.zsh.inc'; fi


# ac Novel
# ac RippedCasts
ac Galaxy
