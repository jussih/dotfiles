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
function activate_venv() {
  local dir="$PWD"

  # Search upward until we reach home
  while :; do
    # The local_options block makes sure globs that match nothing
    # simply disappear (null_glob) and that dot‑dirs are included (dot_glob).
    setopt local_options null_glob dot_glob

    # Iterate over *only* sub‑directories (/( qualifier)) – both normal and dot‑dirs.
    for candidate in "$dir"/*(/) "$dir"/.*(/); do
      # Skip the obligatory . and ..
      [[ $candidate == "$dir/." || $candidate == "$dir/.." ]] && continue

      if [[ -f "$candidate/bin/activate" && -f "$candidate/pyvenv.cfg" ]]; then
        source "$candidate/bin/activate"
        echo "Activated virtualenv: $candidate"
        return 0
      fi
    done

    # Stop when we reach the filesystem root
    [[ $dir == "$HOME" || $dir == "/" ]] && break
    dir="$(dirname "$dir")"
  done
  echo "No virtualenv found"
  return 1
}

# Find and run a tasks.py in the current directory or any parent directory
function call_taskspy() {
  local dir="$PWD"

  # Search parents for tasks.py
  while :; do
    if [[ -f "$dir/tasks.py" ]]; then
      uv run --directory $dir --no-project $dir/tasks.py $*
      return 0
    fi

    [[ $dir == "$HOME" || $dir == "/" ]] && break
    dir="$(dirname "$dir")"
  done
  echo "No tasks.py found here or in parents"
  return 1
}

function mkcd() {
  mkdir -p "$1"
  cd "$1"
}

# Create and switch to a temporary directory
tempe () {
  cd "$(mktemp -d)"
  chmod -R 0700 .
  if [[ $# -eq 1 ]]; then
    \mkdir -p "$1"
    cd "$1"
    chmod -R 0700 .
  fi
}
