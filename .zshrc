# 自動補完を有効にする
autoload -Uz compinit && compinit

setopt auto_list

setopt auto_menu
# 補完候補をできるだけ詰めて表示する
setopt list_packed
zstyle ':completion:*:default' menu select=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# cdなしで移動
setopt auto_cd
# コマンドミスを修正
setopt correct
# コマンドライン全てのスペルチェックをする
setopt correct_all
# ビープ音を鳴らさないようにする
setopt no_beep
# ワイルドカード展開を使用する
setopt extended_glob
# 8bit文字を有効にする
setopt print_eight_bit
#ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt MARK_DIRS
#rm *で確認
setopt RM_STAR_WAIT
#補完対象のファイルの末尾に識別マークをつける
setopt LIST_TYPES
#ディレクトリ名を補完すると、末尾がスラッシュになる。
setopt AUTO_PARAM_SLASH

export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

#ヒストリに時刻情報もつける
setopt EXTENDED_HISTORY
#履歴がいっぱいの時は最も古いものを先ず削除
setopt HIST_EXPIRE_DUPS_FIRST
#履歴検索中、重複を飛ばす
setopt HIST_FIND_NO_DUPS
#ヒストリリストから関数定義を除く
setopt HIST_NO_FUNCTIONS
#前のコマンドと同じならヒストリに入れない
setopt HIST_IGNORE_DUPS
#重複するヒストリを持たない
setopt HIST_IGNORE_ALL_DUPS
#実行するまえに必ず展開結果を確認できるようにする
setopt HIST_VERIFY
#履歴をインクリメンタルに追加
setopt INC_APPEND_HISTORY
#history コマンドをヒストリに入れない
unsetopt HIST_NO_STORE
#履歴から冗長な空白を除く
setopt HIST_REDUCE_BLANKS
#履歴を共有
setopt share_history
# 古いコマンドと同じものは無視
setopt HIST_SAVE_NO_DUPS
#補完時にヒストリを自動的に展開する
setopt HIST_EXPAND
#改行コードで終らない出力もちゃんと出力する
setopt NO_PROMPTCR

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
