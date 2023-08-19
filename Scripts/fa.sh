!#/bin/zsh

zoxide_result=`zoxide query -l`
result=`echo "$zoxide_result\n/home/$USER"| sort | fzf`

if [ -z "$result" ]; then
    exit 0;
fi

echo $result >> $HOME/.ff
