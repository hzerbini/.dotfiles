#!/bin/zsh

zoxide_result=`zoxide query -l`
result=`echo "$zoxide_result\n/home/$USER"| sort | fzf`

if [ -z "$result" ]; then
    exit 0;
fi

session_list=`tmux list-sessions -F "#S #{session_path}"`
desired_session=`echo $session_list | grep -E "(^| )$result( |$)"`

if [ -z $desired_session ]; then
    session_name=$(basename $result)

    if [ -z $TMUX ]; then # Not in TMUX
        tmux new-session -c $result -s $session_name
    else
        tmux new-session -d -c $result -s $session_name
        tmux switch-client -t $session_name
    fi
else
    session_name=`echo $desired_session | awk '{print $1}'`
    if [ -z $TMUX ]; then
        tmux attach-session -t $session_name
    else
        tmux switch-client -t $session_name
    fi
fi
