# -*- sh -*-

# original souece: https://github.com/vincentbernat/zshrc/blob/master/rc/bookmarks.zsh

# Handle bookmarks. This uses the static named directories feature of
# zsh. Such directories are declared with `hash -d
# name=directory`. Both prompt expansion and completion know how to
# handle them. We populate the hash with directories.
#
# With autocd, you can just type `~-bookmark`. Since this can be
# cumbersome to type, you can also type `@@` and this will be turned
# into `~-` by ZLE.

function() {
    MARKPATH=${MARKPATH:-${HOME}/.marks};

    check_bookmark_name() {
      [[ ${1} =~ '^[a-zA-Z0-9]+$' ]] || throw "invalid name: ${1}"
    }

    # Populate the hash
    for link ($MARKPATH/*(N@)) {
        hash -d -- -${link:t}=${link:A}
    }

    vbe-insert-bookmark() {
        emulate -L zsh
        LBUFFER=${LBUFFER}"~-"
    }
    zle -N vbe-insert-bookmark
    bindkey '@@' vbe-insert-bookmark

    # Manage bookmarks
    bookmark() {
      [[ -d ${MARKPATH} ]] || mkdir -p ${MARKPATH};

      local reset_color=$'\e[m';
      local blue=$'\e[1;36m';
      local green=$'\e[1;32m';
      {
        if (( ${#} == 0 )); then
            # When no arguments are provided, just display existing
            # bookmarks
            for link in $MARKPATH/*(N@); do
                local markname="${green}${link:t}${reset_color}";
                local markpath="${blue}${link:A}${reset_color}";
                printf "%-30s -> %s\n" "${markname}" "${markpath}";
            done
        else
            # Otherwise, we may want to add a bookmark or delete an
            # existing one.
            local -a delete;
            zparseopts -D d:=delete || throw;
            if (( ${+delete[2]} )); then
                # With `-d`, we delete an existing bookmark
                check_bookmark_name ${delete[2]};
                command rm "${MARKPATH}/${delete[2]}";
            else
                # Otherwise, add a bookmark to the current
                # directory. The first argument is the bookmark
                # name. `.` is special and means the bookmark should
                # be named after the current directory.
                local name=${1};
                local target=${2-${PWD}};
                check_bookmark_name ${name};
                [[ ${name} == "." ]] && name=${PWD:t};
                ln -s ${target} ${MARKPATH}/${name};
                hash -d -- -${name}=${target};
            fi
        fi
      } always {
        if catch '*'; then
          echo ${CAUGHT};
        fi
      }
    }

    _bookmarks() {
      local -a options
      for link ($MARKPATH/*(N@)) {
        options+="${link:t}:${link:A}"
      }
      _describe 'values' options
    }

    zstyle ':completion:*:*:bookmark:option-d-1:*' verbose yes
    zstyle ':completion:*:*:bookmark:option-d-1:*' list-separator ' -> '
    compdef '_arguments "-d:::_bookmarks" "2:::_files"' bookmark

    alias bm=bookmark
}
