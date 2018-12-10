
# Path to your oh-my-zsh installation.
export ZSH=/home/nhz/.oh-my-zsh
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR=nvim
export PATH=~/.local/bin:$PATH
DISABLE_UNTRACKED_FILES_DIRTY="true"
#Ruby rbenv config
export PATH="$HOME/.rbenv/bin:$PATH"``
eval "$(rbenv init -)"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh


# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
#export LANG=en_US.UTF-8

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
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias i3config="vim ~/.config/i3/config"
alias x="startx"
alias p="poweroff"
alias t="tmux"
alias powerbi="cd ~/Code/PowerBI_ERMRT"
alias fhfscreen="~/.screenlayout/fhfscree.sh"
alias dscreen="~/.screenlayout/dellscreen.sh && feh --bg-fill ~/Pictures/walli/IMG_20171026_080650.jpg"
alias nscreen="~/.screenlayout/normalscreen.sh"
alias hscreen="~/.screenlayout/hscreen.sh"
alias meetscreen="~/.screenlayout/meetscreen.sh"
alias fsc="~/.screenlayout/dellhdmi.sh && feh --bg-fill ~/Pictures/walli/autumn-autumn-leaves-blur-589840.jpg"
alias sysm="gnome-system-monitor"
alias ran="ranger"
alias red='redshift -O 1800'
alias python='python2.7'
alias py="python3"
alias ac="source ~/Code/acustreamenv/bin/activate && cd ~/Code/knowledge_base/acustream_intranet"
alias acs="source ~/Code/acustreamenv/bin/activate && cd ~/Code/knowledge_base/acustream_intranet && python manage.py runserver"
# alias tl="cd /home/nhz/Code/Personal/traffic-light && source venv/bin/activate"
alias tl="cd /home/nhz/Code/Personal/tlight-firmware"
alias acf="cd ~/Code/knowledge_base/frontend/ingestion"
alias acfront="cd ~/Code/knowledge_base/frontend/ingestion"
alias acsql="psql -h db -d acustream -U overlord"
alias utilsql="psql -h db3 -d utility -U ingestion"
alias v2o="source ~/Code/v2oenv/bin/activate && cd ~/Code/v2o"
alias ldjango="cd ~/Code/learn/django/djrp/ed_reviews && source ~/Code/learn/django/lvenv/bin/activate"
alias lf="slack & hipchat4"
alias tg="cd /home/nhz/Code/testGround"
alias rec="cd ~/Code/learn/react"
alias rewifi="sudo ip link set wlp3s0b1 down  && sudo ip link set wlp3s0b1 up"
alias rnra="react-native run-android"
alias resetnet="sudo ip addr flush dev enp0s20u2 && sleep 3 && sudo ip link set enp0s20u2 ndown && sleep 3 && sudo ip link set enp0s20u2 up"
alias resetnet2="sudo ip addr flush dev wlp3s0 && sleep 3 && sudo ip link set wlp3s0 down && sleep 3 && sudo ip link set wlp3s0 up"
alias e="exit"
alias per="cd ~/Code/Personal"
alias note="cd ~/vimwiki"
export EDITOR=vim


gcom(){
    msg="$(git_current_branch)"
    msg="$msg : $1"
    git commit -m "$msg"
}

gpr(){
    base ="$(git_current_branch)"
    msg="$base: $2"
    echo msg
    echo $1
    hub pull-request -f -b $1 -h $base -m msg  
}

vpn(){
        cd ~/selfConfig 
        one_time_pass=$(oathtool -b --totp HA47IO2I6SUG3LKC)
        rm -rf onetimepass
        echo $one_time_pass | xclip -in -selection clipboard
        echo $one_time_pass > onetimepass 
        sudo openvpn --config ~/selfConfig/client.ovpn 
}
lock(){
       /bin/lock/lock && systemctl suspend
}

export ANDROID_HOME=/home/nhz/Android/Sdk
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

