#!/bin/zsh

zoxide_result=`zoxide query $1 2> /dev/null`

if [ -z "$zoxide_result" ]; then
    exit 0;
fi


session_list=`tmux list-sessions -F "#S #{session_path}"`
desired_session=`echo $session_list | grep $zoxide_result`

if [ -z $desired_session ]; then
    session_name=$(basename $zoxide_result)

    if [ -z $TMUX ]; then # Not in TMUX
        tmux new-session -c $zoxide_result -s $session_name
    else
        tmux new-session -d -c $zoxide_result -s $session_name
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
