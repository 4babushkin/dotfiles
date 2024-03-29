# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
USER=$(whoami)

export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="blinks"
#ZSH_THEME="bureau"
ZSH_THEME="bira"

# ZSH_THEME="powerlevel9k/powerlevel9k"
 POWERLEVEL9K_MODE="nerdfont-complete"
 POWERLEVEL9K_DISABLE_RPROMPT=true
 POWERLEVEL9K_PROMPT_ON_NEWLINE=true
 POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
 POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
 POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_ubuntu_icon context dir vcs)
 POWERLEVEL9K_CUSTOM_UBUNTU_ICON="echo "
 POWERLEVEL9K_CUSTOM_UBUNTU_ICON_BACKGROUND=069
 POWERLEVEL9K_CUSTOM_UBUNTU_ICON_FOREGROUND=015

export TERM="xterm-256color"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
export PATH="/path/to/google-cloud-sdk/bin:$PATH"

#gcloud zsh completion
fpath=(/path/to/gcloud-zsh-completion/src $fpath)
autoload -U compinit compdef
compinit

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 #ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ssh-agent pip pipenv vagrant docker docker-compose zsh-autosuggestions command-not-found colored-man-pages history-substring-search zsh-syntax-highlighting zsh-navigation-tools sudo git kubectl terraform)
#plugins=(ssh-agent pip pipenv vagrant docker docker-compose zsh-autosuggestions command-not-found colored-man-pages history-substring-search zsh-syntax-highlighting zsh-navigation-tools sudo git kubectl terraform poetry)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#kube
KUBE_PS1_SYMBOL_ENABLE=false 
KUBE_PS1_NS_ENABLE=false
source "/home/$USER/dotfiles/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
export KUBECONFIG=$(find /home/$USER/.kube -maxdepth 1 -type f -name '*' | tr "\n" ":")
alias kex="export KUBECONFIG=$(find /home/$USER/.kube -maxdepth 1 -type f -name '*' | tr '\n' ';')"

alias kube="kubectl"
alias kaf="kubectl apply -f"
alias kud="kubectl delete"
alias kgd="kubectl get deployment"
alias kgp="kubectl get pods"
alias kgpa="kubectl get pods --all-namespaces"
alias kgn="kubectl get nodes"
alias kgi="kubectl get ingress"
alias kgs="kubectl get service"
alias kgj="kubectl get jobs"
alias kgcj="kubectl get cronjobs"
alias kgpv="kubectl get persistentvolume"
alias kls="kubectl logs"
alias kec="kubectl exec -ti"
alias kd=" kubectl describe"
alias kgc="kubectl config get-contexts"
alias kuc=" kubectl config use-context"
alias kcunsk="kubectl config use-context k8s-nsk"
alias kcumlm="kubectl config use-context mlmsoft-eu-do-main"
alias kcumlmeu="kubectl config us context mlmsoft-eu-do" 
alias kcumlmny="kubectl config use context mlmsoft-ny-do"
alias kcumlmru="kubectl config use-context mlmsoft-ru-selectel"


#lazy stuff
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias l='ls -la'

alias pbcopy='xclip -sel clip'
alias pbpaste='xclip -sel clip -o'
alias vim='/home/bobah/.local/bin/lvim'
alias pgj="pgcli postgresql://postgres:password@127.0.0.1:5432/jeffit --ssh-tunnel"
alias pgt="pgcli postgresql://postgres:password@127.0.0.1:5432/threads --ssh-tunnel"
export ANSIBLE_NOCOWS=1
export CDPATH="~:$HOME/BROOMA:/etc"

# added by travis gem
[ -f /home/$USER/.travis/travis.sh ] && source /home/$USER/.travis/travis.sh

export PATH=${HOME}/bin:${PATH}
export PATH=${HOME}/binvpn:${PATH}

export PATH=${HOME}/BROOMA/ansible/api/cloudflare:${PATH}

autoload -Uz compinit; compinit

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/my_projects/go

for possiblekey in ${HOME}/.ssh/*; do
     if grep -q PRIVATE "$possiblekey"; then
         ssh-add "$possiblekey"
     fi
done


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/bobah/bin/terraform terraform

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:/usr/bin/Postman"
