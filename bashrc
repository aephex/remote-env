[[ $- != *i* ]] && return # Exit if not interactive

tbold="\033[1m"
tnorm="\033[0m"

PS1="${tbold}\u@\h \w > ${tnorm}" # simple prompt
PROMPT_COMMAND="echo" # new line after commands

# Add completions when host supports them
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# History
HISTTIMEFORMAT="%F-%T%z "
HISTCONTROL=ignoredups
HISTSIZE=10000
HISTFILESIZE=5000

# Enable these shell options
shopt -s cdspell
shopt -s checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -s complete_fullquote
shopt -s direxpand
shopt -s expand_aliases
shopt -s extglob
shopt -s extquote
shopt -s force_fignore
shopt -s globasciiranges
shopt -s globstar
shopt -s histappend
shopt -s hostcomplete
shopt -s interactive_comments
shopt -s progcomp
shopt -s promptvars
shopt -s sourcepath

# Disable these shell options
shopt -u assoc_expand_once
shopt -u autocd
shopt -u cdable_vars
shopt -u checkhash
shopt -u compat31
shopt -u compat32
shopt -u compat40
shopt -u compat41
shopt -u compat42
shopt -u compat43
shopt -u compat44
shopt -u dirspell
shopt -u dotglob
shopt -u execfail
shopt -u extdebug
shopt -u failglob
shopt -u gnu_errfmt
shopt -u histreedit
shopt -u histverify
shopt -u huponexit
shopt -u inherit_errexit
shopt -u lastpipe
shopt -u lithist
shopt -u localvar_inherit
shopt -u localvar_unset
shopt -u login_shell
shopt -u mailwarn
shopt -u no_empty_cmd_completion
shopt -u nocaseglob
shopt -u nocasematch
shopt -u nullglob
shopt -u progcomp_alias
shopt -u restricted_shell
shopt -u shift_verbose
shopt -u xpg_echo

# Aliases
alias cp='cp -i' # Confirm before overwrite
alias mv='mv -i' # Confirm before overwrite
alias ls='ls -F --group-directories-first --color=auto'
alias ll='ls -lah'
alias mkdir='mkdir -p' # Make intermediate dirs if they don't exist
alias dps='docker ps --format "table {{.ID}}\t{{.Status}}\t{{.Names}}"'
alias dfx='df -h -x overlay -x tmpfs -x devtmpfs | sed "/\/boot\//d"' # Hide some filesystems

# Functions
function hg() {
    history | grep -i "$1"
}

function si() {
    printf "%9s %s\n" "IP ADDR:" " $(curl -qs4 checkip.amazonaws.com)"
    printf "%9s %s\n" "HOSTNAME:" " $(hostname -f)"
    printf "%9s %s\n" "KERNEL:" " $(uname -rms)"
    printf "%9s %s\n" "CPU:" "$(awk -F: '/model name/{print $2}' </proc/cpuinfo | head -1)"
    printf "%9s %s\n" "MEMORY:" " $(free -gh | awk '/Mem/{print $3"/"$2}')"
    printf "%9s %s\n" "UPTIME:" " $(uptime -p)"
    printf "\n"
}
