#!/bin/zsh
# Function to switch ZSH profiles.
toggle_zsh_function() {
    local profiles=($HOME/.zshrc_profile_*)
    if [ ${#profiles} -eq 0 ]; then
        echo "No ZSH profiles found."
        return 1
    fi
    # Get current profile name
    local current_profile=""
    if [ -f "$HOME/.zshrc" ]; then
        current_profile=$(grep "ZSH_TOGGLE_NAME" "$HOME/.zshrc" | cut -d'"' -f2)
    fi
    echo "Available ZSH profiles (current: $current_profile):"
    integer i=1
    for profile in $profiles; do
        local toggle_name=$(grep "ZSH_TOGGLE_NAME" "$profile" | cut -d'"' -f2)
        if [ -n "$toggle_name" ]; then
            echo "$i. $toggle_name"
        else
            echo "$i. ${profile:t} (missing ZSH_TOGGLE_NAME EnvVar declaration)"  # Display full filename if ZSH_TOGGLE_NAME is not set
        fi
        ((i++))
    done
    echo "q. Quit without changes"
    echo "Choose profile to activate or 'q' to quit:"
    read "choice?> "
    if [[ "$choice" == "q" ]]; then
        echo "Exiting without changes."
        return 0
    elif [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#profiles}" ]; then
        local selected_profile="${profiles[$choice]}"
        local selected_name=$(grep "ZSH_TOGGLE_NAME" "$selected_profile" | cut -d'"' -f2)
        if [ -n "$selected_name" ]; then
            echo "Switching to profile: $selected_name"
        else
            echo "Switching to profile: ${selected_profile:t}"
        fi
        # Backing up current .zshrc
        if [ -f "$HOME/.zshrc" ]; then
            mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
        fi
        # Copy chosen profile as current .zshrc
        cp "$selected_profile" "$HOME/.zshrc"
        echo "Profile has been changed. Reloading ZSH..."
        exec zsh
    else
        echo "Invalid choice."
        return 1
    fi
}
# Function call.
toggle_zsh_function

# Add extra EnvVar to your .zshrc_profile_your_zsh_profile_name
# export ZSH_TOGGLE_NAME="Your ZSH Profile Name"

# And assign it some alias to call the function:
# alias toggle_zsh='/path/to/file/zsh_toggle.zsh'
