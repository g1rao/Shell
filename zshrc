export CLICOLOR=1
alias yubikey=/Users/jtalagan/Templates/yubikey.sh
alias connect="expect /Users/jtalagan/Templates/connect.sh"
export SHELL_SESSION_HISTORY=0
#autoload -Uz history-search-end
#bindkey "\e[5~" history-beginning-search-backward-end
#bindkey "\e[6~" history-beginning-search-forward-end

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end



if [[ `ps -ef | grep "m http.server 80" | grep -v grep` == "" ]];
then
    cd /Users/jtalagan/Templates && nohup /usr/local/bin/python3 -m http.server 80 &;
    cd -
fi

function command_not_found_handler() {

  if [[ $1 =~ ^eibcc.*$ ]]; then
    /Users/jtalagan/Templates/vpn.sh $1
  else
    echo "I can't find the command '$1' that exists in my memory.\n"
    return 127
  fi
}
zshaddhistory() {
 [[ $1 =~ !^eibcc.*$ ]]
}
