#silversearcher grep in a django buildout project
alias gag="ag --ignore eggs/ --ignore coverage/ --ignore staticroot/ -U -i"
#use smart case as default in ripgrep
alias rg="rg -S"
#ripgrep in a django buildout project
alias rag="rg -g \!eggs/ -g \!coverage/ -g \!staticroot/ --no-ignore"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first --classify --literal'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -l -h'
alias l='ll --almost-all'

alias f='xdg-open "$PWD"' # Open current directory onto GUI file browser.
alias myip='curl http://checkip.amazonaws.com' # print public ip

alias mkdir='mkdir --parents' # Make parent directories as needed
