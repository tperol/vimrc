# Path to your oh-my-zsh installation.
export ZSH=/Users/tperol/.oh-my-zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER='tperol'
CASE_SENSITIVE="false"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? 
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git zsh-autosuggestions)

# ============================================
# Aliases
# For a full list of active aliases, run `alias`.
# ============================================
# remote connections
alias labo="ssh thibaut@dhcp-140-247-55-238.fas.harvard.edu"
alias occam="ssh tibo@occam.csail.mit.edu"
alias odyssey='ssh -CY tperol@login.rc.fas.harvard.edu'
# shortcuts
alias l="ls -lah"
alias matlab="matlab -nodesktop -nosplash"
alias vrc='vim ~/.vimrc'
alias zrc='vim ~/.zshrc'
alias doc='cd ~/Documents'
alias gst='git status'
alias tm="tmux at"
alias py='python'

# ============================================
# path extension
# ============================================
# added by Anaconda3 4.1.1 installer
export PATH="/Users/tperol/anaconda/bin:$PATH"
# PYTHONPATH added by tibo
export PYTHONPATH="${PYTHONPATH}:$HOME/ConvNetQuake:$HOME"



# ============================================
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
source $ZSH/oh-my-zsh.sh
