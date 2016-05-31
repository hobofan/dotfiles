# Local env (should actually already be loaded)
[[ -f ~/.zshenv ]] && source ~/.zshenv

# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# completion
autoload -U compinit
compinit

# set TERM Color 256
export TERM=xterm-256color

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt inc_append_history
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
# bindkey -v
# bindkey "^F" vi-cmd-mode
# bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# eliminate lag when switching between vi modes
export KEYTIMEOUT=1

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# load rbenv if available
#if which rbenv &>/dev/null ; then
#  eval "$(rbenv init - --no-rehash)"
#fi

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
# [[ -s "/home/hobofan/.gvm/scripts/gvm" ]] && source "/home/hobofan/.gvm/scripts/gvm"

export FZF_COMPLETION_OPTS='-x'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

source ~/stuff/bash-dotenv/dotenv.zsh
