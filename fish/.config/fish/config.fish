if status is-interactive
    and not set -q TMUX
    if tmux has-session -t Dev
        exec tmux attach-session -t Dev
    else
        tmux new-session -s Dev
    end
end

# Vim keybindings for fish
fish_vi_key_bindings

# Set up fzf key bindings
fzf --fish | source

# Alias for custom nvim
alias vim="nvim"
alias chad="NVIM_APPNAME=nvchad nvim"

# NEOVIDE
alias nvide="NVIM_APPNAME=bvim neovide"

# NVIM SELECTOR
function vims
    set items default NvChad AstroNvim
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config = " --height=~50% --layout=reverse --border --exit-0)

    if test -z "$config"
        echo "Nothing selected"
        return 0
    else if test "$config" = default
        set config ""
    end

    env NVIM_APPNAME=$config nvim $argv
end

# Alias for eza
alias ls="eza --icons=always --sort=extension"
alias l="eza -la -g --icons"

# Alias for lazygit
alias lzg="lazygit"

# To enable zoxide in fish shell and rebind cd to zoxide
zoxide init --cmd cd fish | source
# zoxide init fish | source

alias cat="bat" # Use bat as cat

alias svim="sudoedit" # Alias for sudoedit


# Set all editor to neovim
set -x EDITOR /bin/nvim
set -x SUDO_EDITOR /bin/nvim

# Setup go path
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Setup npm PATH
set PATH ~/.npm-global/bin $PATH

# setup local bin
set -x PATH $PATH $HOME/.local/bin


# Auto start neofetch
alias nf="clear && neofetch"
function fish_greeting
    nf
end

alias newtmux="tmux new-session -s" # Alias for new tmux session

# Auto start tmux
# if not set -q TMUX
#     set -g TMUX tmux new-session -s Dev
#     eval $TMUX
#     tmux attach-session -t Dev
# end

# Config thefuck
thefuck --alias | source

# KEYBINDS
function fish_user_key_bindings
    bind \cn vims
end

# Maven
function cj
    # Check if exactly 2 arguments are provided
    if test (count $argv) -ne 2
        echo "Usage: cj <appname> <packagename>"
        return 1
    end

    # Assign the arguments to variables
    set appname $argv[1]
    set packagename $argv[2]

    # Run the Maven command
    mvn archetype:generate -DgroupId=$packagename -DartifactId=$appname -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
end
