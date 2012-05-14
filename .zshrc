export PATH=~/bin:/usr/local/bin:/opt/local/bin/:$PATH
export CC=gcc-4.2
autoload -U colors
colors

#source ~/.git-completion.sh
#PS1='[%{$fg[green]%}% %n@%m %{$fg[cyan]%}% %c%{$fg[red]%}% $(__git_ps1 "(%s)")%{$fg[white]%}% ]\$ '
PS1="[%{$fg[green]%}% %{$fg[cyan]%}% @${HOST%%.*} %{$fg[red]%}% %1~%{$fg[white]%}% ]%(!.#.$) "

RPROMPT="%T"                      # 右側に時間を表示
setopt transient_rprompt          # 右側まで入力がきたら時間を消す
setopt prompt_subst               # 

export LANG=ja_JP.UTF-8           # 日本語環境
autoload -U compinit              # 補完
compinit -u                       # 補完
setopt autopushd                  # cdの履歴を表示
setopt pushd_ignore_dups          # 同ディレクトリを履歴に追加しない
setopt auto_cd                    # 自動的にディレクトリ移動
setopt list_packed                # リストを詰めて表示
setopt list_types                 # 補完一覧ファイル種別表示

# history
HISTFILE=~/.zsh_history           # history
HISTSIZE=1000000                  # file size
SAVEHIST=1000000                  # save
setopt hist_ignore_dups           # 重複を記録しない
setopt hist_reduce_blanks         # スペース排除
setopt share_history              # 履歴ファイルを共有
setopt EXTENDED_HISTORY           # zshの開始終了を記録

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
#bindkey '^R' history-incremental-pattern-search-backward # 使えなかった*がfailing bck-i-searchになる

# key bind
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^D' backward-kill-line     # ctrl+Dでカーソルから前全削除
bindkey '^F' kill-line              # ctrl+Fでカーソルから後全削除

# alias
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
alias grep=egrep

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# rbenv
eval "$(rbenv init -)"

#function pt() {
#  echo "</pre>" >> ~/shell_history/output.txt
#  echo "<p>"$@"</p>" >> ~/shell_history/output.txt
#  echo "<pre class=\"brush:shell\">" >> ~/shell_history/output.txt
#}
#
#function pd() {
#  echo $@ >> ~/shell_history/output.txt
#  exec pwd
#  $@ 2>&1 | tee -a ~/shell_history/output.txt
#  exit 1
#}

#=============================
# source auto-fu.zsh
#=============================
if [ -f ~/.zsh/auto-fu.zsh ]; then
    source ~/.zsh/auto-fu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':completion:*' completer _oldlist _complete
fi

