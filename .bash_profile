# GIT
# =====================
# Configures git to not require a message when you merge.
export GIT_MERGE_AUTOEDIT='no'
alias gst="git status"

# COMMAND HELPERS
# =====================
# Create dir then cd into it
function mkcd () {
mkdir -p -- "$1" && cd -P -- "$1"
}

# FILE UTILS
# =====================
set noclobber # prevent unintentional overwriting when copying
alias rm='rm -i'  # confirm before rm
# set completion-ignore-case On #case-insensitive auto-complete


# EDITORS
# =====================
# The -w flag tells your shell to wait until Atom exits
export VISUAL="atom -w"
export SVN_EDITOR="atom -w"
export GIT_EDITOR="atom -w"
export EDITOR="atom -w"
function edit () {
  open -a 'Atom' "$1"
}

# ALIASES
# =====================
# eg alias sbox="cd /Users/Anders/Dropbox/WWW/sbox-project"


# NODE
# =====================
# get node to recognize items installed by homebrew
# export PATH=/usr/local/share/npm/bin:$PATH

# HOMEBREW
# =====================
# brew doctor asks for this
# export PATH="/usr/local/sbin:$PATH"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# TERMINAL PROMPT
# ======================
# Display active branch in terminal prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# This function builds your prompt. It is called below
function prompt {
  # Define some local colors
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local        CHAR="⚡"
  #⚡  👉 💣 🔰🚲 ♣ ☛ ♥ 👾 ☆ - Keeping some cool ASCII Characters for reference

  # Here is where we actually export the PS1 Variable which stores the text for your prompt
  export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \[\e[32m\]\W\[\e[0m\]\n\[\e[0;31m\]⚡   \[\e[0m\]"
    PS2='> '
    PS4='+ '
  }

# Finally call the function and our prompt is all pretty
prompt
