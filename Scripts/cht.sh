#!/bin/zsh

languages=`echo "golang lua cpp c typescript javascript nodejs php laravel" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | sort -r | fzf`
read query
if printf $languages | grep -qs $selected; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl cht.sh/$selected/$query|less"
else
    tmux neww bash -c "curl cht.sh/$selected~$query|less"
fi
