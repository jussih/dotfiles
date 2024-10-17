# SSH and attach/start tmux session automatically
# params: ssh host
function sshtmux() {
  if [ -n "$TMUX" ]
  then
    tmux rename-window $1
  fi
  ssh $* -t -- "type tmux > /dev/null && tmux has-session -t juba && tmux -2 attach-session -t juba || tmux -2 new-session -s juba zsh || bash"
  if [ -n "$TMUX" ]
  then
    tmux set-window-option automatic-rename "on" 1>/dev/null
  fi
}
compdef sshtmux=ssh
alias s=sshtmux

# Grep, present results in fzf and open selected file in Vim
# params: ripgrep query
function vimgrep() {
  local file
  file="$(rg -S --no-heading -n --hidden -g \!"{.git,.hg,node_modules}" $@ | fzf -0 -1 | awk -F: '{print $1 " +" $2}')"
  if [[ -n $file ]]
  then
     vim ${=file}
  fi
}
alias vg=vimgrep

# Open file in Vim with fzf
function fzfedit() {
  local file
  file="$(fzf)"
  if [[ -n $file ]]
  then
     $EDITOR ${=file}
  fi
}

# Tail logs with colorization
function tail_log() {
  tail -f $*|ccze
}

# Set window title
function set-title() {
  TITLE="\e]2;$*\a"
  echo -e ${TITLE}
}

# Change into code project dir using fzf
function c () {
  CD_PATH=`find ~/code -maxdepth 3 -type d -regextype egrep -regex ".*/\.(git|hg)" -print |fzf -1 -q $1`
  cd $CD_PATH:h
}

# Compose i3wm config from conf.d files
function i3-config-build () {
  cat ~/.config/i3/conf.d/* > ~/.config/i3/config
}

# Activate or create a Python virtualenv
function activate_venv {
    local VENV_DIRS=("venv" ".venv" "env" ".env" "virtualenv" "pyenv")
    for venv_dir in "${VENV_DIRS[@]}"; do
        if [ -d "$venv_dir" ] && [ -f "$venv_dir/bin/activate" ]; then
            source "$venv_dir/bin/activate"
            echo "Activated virtualenv: $venv_dir"
            return 0
        fi
    done
    # No existing virtualenv found, create a new one
    echo "No existing virtualenv found. Creating a new one..."
    if uv venv; then
        if [ -f ".venv/bin/activate" ]; then
            source ".venv/bin/activate"
            echo "Created and activated new virtualenv: .venv"
            return 0
        else
            echo "Failed to find the activate script in .venv"
            return 1
        fi
    else
        echo "Failed to create virtualenv with 'uv venv'"
        return 1
    fi
}
