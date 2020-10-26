autoload -Uz compinit && compinit
setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
setopt auto_cd

export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

setopt share_history

# Git
fpath=(~/.zsh $fpath)
if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
         zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
         fi
         if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
                  source ${HOME}/.zsh/git-prompt.sh
                  fi
                  GIT_PS1_SHOWDIRTYSTATE=true
                  GIT_PS1_SHOWUNTRACKEDFILES=true
                  GIT_PS1_SHOWSTASHSTATE=true
                  GIT_PS1_SHOWUPSTREAM=auto
                  setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
