if ! alias po &>/dev/null; then
    echo "commands.sh script not imported in .zshrc".
    echo "Please run ~/.dotfiles/bootstrap.sh to fix this issue."
    return 1
fi

func ask_copilot() {
    # Check if GitHub CLI is installed
    if ! check_github_cli; then
        return 1
    fi

    # Check if GitHub authentication is configured
    if ! check_github_auth; then
        return 1
    fi

    # Check if GitHub Copilot extension is installed
    if ! check_copilot_extension; then
        return 1
    fi

    local type="${1:-explain}"
    shift
    local text="$*"

    if [ "$type" = "command" ]; then
        gh copilot suggest "$text"
    elif [ "$type" = "explain" ]; then
        gh copilot explain "$text"
    else
        po "Usage: copilot [command|explain] <prompt>"
    fi
}

alias copilot=ask_copilot
