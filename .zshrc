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

zplug "supercrabtree/k"
# zplug "b4b4r07/enhancd", use:init.sh
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "djui/alias-tips"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "ael-code/zsh-plugin-fasd"
zplug "esc/conda-zsh-completion"
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
zplug 'wfxr/forgit'

# Prompt
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "darvid/zsh-poetry"

# install any uninstalled plugins
zplug check || zplug install


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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ubuntu/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ubuntu/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ubuntu/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ubuntu/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
export PATH="/home/ubuntu/.poetry/bin/:$PATH"

# Let's use our jlab
conda activate base

# Deal with * in bash script
# setopt NULL_GLOB
# source ~/resources/install_spark.sh
# unsetopt NULL_GLOB
# # Bah! Not sure why I need this
# sh ~/resources/install_spark.sh

# source /usr/local/share/zsh/site-functions/_awless
# eval "$(fasd --init auto)"

# source ~/.zshrc.local
# [[ $SHLVL != "2" ]] && tmux new
####### alias ls="gls --color"
#

# conda activate base
#export PATH="$HOME/bin:$PATH"
#export EDITOR=nvim
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'


# zprof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
