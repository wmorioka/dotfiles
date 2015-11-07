export PROMPT='%n@%m $ '
export RPROMPT='[%d]'

export LSCOLORS='cxfxcxdxbxegedabagacad'

case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# 補完
# 補完機能を有効にする
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

alias ls='ls -p'
alias l='ls -Gp'
alias ll='ls -lGp'
alias la='ls -aGp'
alias lla='ls -laGp'
alias grep='grep --color=auto'
alias grepc='\grep -v -e "^\s*#" -e "^\s*$"'
alias pwdc='pwd | pbcopy && pwd && echo copied to clipboard!'
alias diff='colordiff'
alias ..='cd ..'

# Gitのブランチ名を表示する
# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=ja_JP.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
#RPROMPT="%1(v|%F{green}%1v%f|)"
export PROMPT='%n@%m %1(v|%F{green}%1v%f|)$ '

if [[ -f $HOME/src/github.com/wmorioka/dotfiles/.zsh/keybind.zsh ]]; then
    source $HOME/src/github.com/wmorioka/dotfiles/.zsh/keybind.zsh
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"
