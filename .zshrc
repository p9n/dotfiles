# Set up the prompt

if [[ "${OSTYPE}" == 'darwin'* ]]; then
  typeset -U path
  path+=('/usr/local/bin')

  if type gls >/dev/null; then
    alias ls='gls --color -F'
  else
    alias ls='ls -FG'
  fi
else
  alias ls='ls --color -F'
fi
alias cp='cp -i'
alias mv='mv -i'
alias vi=vim
alias rm='rm -i'
alias ag='ag -s --color-match "1;31"'
export TMUX_BINARY=/usr/local/bin/tmux
alias tm="$TMUX_BINARY -2 new-session -A -s phoenix"
export PS1='%F{37}[%n@%m %~]$%f '
export LANG='en_US.utf8'
export LANGUAGE='en_US.utf8'
export LC_ALL='en_US.utf8'
export CXXFLAGS="-O3 -pedantic -Wall -Wvla -std=c++1z"
export CFLAGS="-O3 -pedantic -lm -Wall -std=c11"
export TMPDIR="/tmp/"
export TMP="$TMPDIR"
export TEMP="$TMPDIR"
export SVN_EDITOR='vim'
export GIT_EDITOR='vim'
export LS_COLORS='rs=0:di=38;5;105;1:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
export TERM="xterm-256color"
export EDITOR=vim
export P4DIFF=vimdiff

# disable ctrl+s/ctrl+q XOFF/XON command
stty -ixon

autoload -Uz promptinit
promptinit

# setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

bindkey '^i' expand-or-complete-prefix
bindkey "^[[Z" reverse-menu-complete
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' completer _expand _complete _approximate
# zstyle ':completion:*' format "Completing %d"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose false
zstyle ':completion:*' list-grouped true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zstyle ':completion:*:*:*:packages' hidden true

unsetopt listambiguous

compdef -d adb

autoload zkbd
# source ${HOME}/.zkbd/${TERM}-${VENDOR}-${OSTYPE}
source $HOME/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

[[ -f /etc/bash_completion.d/g4d ]] && source /etc/bash_completion.d/g4d

autoload -Uz catch
autoload -Uz throw

# disable paste highlighting for zsh >= 5.1
zle_highlight+=(paste:none)

# import local settings
function () {
  local zshrc=$(realpath ${ZDOTDIR:-$HOME}/.zshrc);
  local rc_dir=$(dirname ${zshrc})/.zsh;
  for file in ${rc_dir}/*.zsh; do
    source ${file};
  done
}

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ol" "+"
bindkey -s "^[OS" "-"
bindkey -s "^[OQ" "*"
bindkey -s "^[OR" "/"

# Ctrl+Left/Right
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
