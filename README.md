# Shell Switcher

## Description

Shell Switcher is a snall Shell script designed to easily switch between different Shell profiles. It allows for quick changes to your shell configuration without the need to manually edit configuration files and sourcing them.

## Features

- Display a list of available profiles
- Show the currently active profile
- Switch between profiles
- Create a backup of the current `.*rc` file before changing profiles

## Requirements

- ZSH shell
- ZSH profiles saved as `.zshrc_profile_*` files in the user's home directory

## Installation

1. Copy the script content into a file, e.g., `zsh_toggle.zsh` for ZSH Switcher
2. Make the script executable:
   ```
   chmod +x /path/to/zsh_toggle.zsh
   ```

## Configuration

1. Create ZSH profiles by saving them as `.zshrc_profile_*` files in your home directory.
2. In each profile, add the `ZSH_TOGGLE_NAME` environment variable:
   ```
   export ZSH_TOGGLE_NAME="Your ZSH Profile Name"
   ```
3. Add an alias to your main `.zshrc` file to easily call the script:
   ```
   alias toggle_zsh='/path/to/zsh_toggle.zsh'
   ```

## Usage

1. Call the script by typing in the terminal:
   ```
   toggle_zsh
   ```
2. Choose the number of the profile you want to activate, or press 'q' to exit without changes.

## Notes

- The script creates a backup of the current `.zshrc` file before changing profiles (as `.zshrc.bak`).
- If the `ZSH_TOGGLE_NAME` variable is not defined in a profile, the full profile filename will be displayed.
- After changing the profile, the ZSH session will be automatically reloaded.

## Troubleshooting

- If you don't see any profiles, make sure you've created `.zshrc_profile_*` files in your home directory.
- If profile names are not displayed correctly, check if you've defined the `ZSH_TOGGLE_NAME` variable in each profile file.

## License

MIT
