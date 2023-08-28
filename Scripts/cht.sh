#!/bin/zsh

languages=`echo "golang lua cpp c typescript javascript nodejs php laravel" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk gnupg" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | sort -r | fzf`
echo -n "Query:"
read query

if printf $languages | grep -qs $selected; then
    query=`echo $query | tr ' ' '+'`
    tmux neww zsh -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww zsh -c "curl -s cht.sh/$selected~$query | less"
fi
