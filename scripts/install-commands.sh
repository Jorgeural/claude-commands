#!/bin/bash

# Claude Commands Installation Script
# This script copies commands from this repository to ~/.claude/commands
# Usage: ./install-commands.sh [command-name] or interactive mode

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"
REPO_COMMANDS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/commands"
BACKUP_DIR="$CLAUDE_COMMANDS_DIR/.backup-$(date +%Y%m%d-%H%M%S)"
SINGLE_COMMAND="$1"

# Function to print colored messages
print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

print_success() {
    print_message "$GREEN" "✅ $1"
}

print_warning() {
    print_message "$YELLOW" "⚠️  $1"
}

print_error() {
    print_message "$RED" "❌ $1"
}

print_info() {
    print_message "$BLUE" "ℹ️  $1"
}

# Function to create backup of existing commands
create_backup() {
    if [ -d "$CLAUDE_COMMANDS_DIR" ] && [ "$(ls -A "$CLAUDE_COMMANDS_DIR" 2>/dev/null)" ]; then
        print_info "Creating backup of existing commands..."
        mkdir -p "$BACKUP_DIR"
        cp -r "$CLAUDE_COMMANDS_DIR"/* "$BACKUP_DIR/" 2>/dev/null || true
        print_success "Backup created at: $BACKUP_DIR"
    fi
}

# Function to list available commands
list_available_commands() {
    local commands=()
    for cmd_file in "$REPO_COMMANDS_DIR"/*.md; do
        if [ -f "$cmd_file" ]; then
            local cmd_name=$(basename "$cmd_file" .md)
            commands+=("$cmd_name")
        fi
    done
    echo "${commands[@]}"
}

# Function to ask installation mode (all vs single)
ask_installation_mode() {
    local commands=($(list_available_commands))
    local count=${#commands[@]}
    
    while true; do
        print_info "Installation Mode:" >&2
        echo >&2
        echo "1) Install ALL commands ($count total)" >&2
        echo "2) Install a single command" >&2
        echo >&2
        
        read -p "Select option (1-2): " selection >&2
        
        case "$selection" in
            1)
                echo "all"
                return 0
                ;;
            2)
                echo "single"
                return 0
                ;;
            *)
                print_warning "Invalid selection. Please choose 1 or 2." >&2
                echo >&2
                ;;
        esac
    done
}

# Function to show command selection menu (for single command installation)
show_command_selection() {
    local commands=($(list_available_commands))
    local count=${#commands[@]}
    
    while true; do
        print_info "Available commands:" >&2
        echo >&2
        
        for i in "${!commands[@]}"; do
            local num=$((i + 1))
            local cmd_name="${commands[$i]}"
            
            # Try to extract description from the command file
            local description=""
            local cmd_file="$REPO_COMMANDS_DIR/${cmd_name}.md"
            if [ -f "$cmd_file" ]; then
                description=$(grep "^description:" "$cmd_file" 2>/dev/null | sed 's/description: *//' | head -1)
            fi
            
            if [ -n "$description" ]; then
                echo "$num) /$cmd_name - $description" >&2
            else
                echo "$num) /$cmd_name" >&2
            fi
        done
        echo >&2
        
        read -p "Select command (1-$count): " selection >&2
        
        if [[ "$selection" =~ ^[0-9]+$ ]] && [ "$selection" -ge 1 ] && [ "$selection" -le "$count" ]; then
            local selected_index=$((selection - 1))
            echo "${commands[$selected_index]}"
            return 0
        else
            print_warning "Invalid selection. Please choose a number between 1 and $count." >&2
            echo >&2
        fi
    done
}

# Function to validate single command
validate_single_command() {
    local cmd_name=$1
    local cmd_file="$REPO_COMMANDS_DIR/${cmd_name}.md"
    
    if [ ! -f "$cmd_file" ]; then
        print_error "Command '$cmd_name' not found!"
        print_info "Available commands:"
        local available=($(list_available_commands))
        for cmd in "${available[@]}"; do
            echo "  - $cmd"
        done
        return 1
    fi
    return 0
}

# Function to ask user for confirmation
ask_confirmation() {
    local message=$1
    local default=${2:-n}
    
    if [ "$default" = "y" ]; then
        prompt="[Y/n]"
    else
        prompt="[y/N]"
    fi
    
    read -p "$(echo -e "${YELLOW}$message $prompt ${NC}")" -n 1 -r
    echo
    
    if [ "$default" = "y" ]; then
        [[ $REPLY =~ ^[Nn]$ ]] && return 1 || return 0
    else
        [[ $REPLY =~ ^[Yy]$ ]] && return 0 || return 1
    fi
}

# Function to handle existing file conflicts
handle_conflict() {
    local source_file=$1
    local dest_file=$2
    local filename=$(basename "$source_file")
    
    print_warning "Command '$filename' already exists"
    echo "Existing file: $dest_file"
    echo "New file: $source_file"
    echo
    echo "Options:"
    echo "1) Overwrite existing command"
    echo "2) Skip this command"
    echo "3) View differences"
    echo "4) Rename new command (add suffix)"
    echo "5) Abort installation"
    echo
    
    while true; do
        read -p "Choose option (1-5): " choice
        case $choice in
            1)
                cp "$source_file" "$dest_file"
                print_success "Overwritten: $filename"
                return 0
                ;;
            2)
                print_info "Skipped: $filename"
                return 0
                ;;
            3)
                if command -v diff >/dev/null 2>&1; then
                    echo
                    print_info "Differences between files:"
                    diff "$dest_file" "$source_file" || true
                    echo
                else
                    print_warning "diff command not available for comparison"
                fi
                ;;
            4)
                local new_name="${filename%.*}-new.${filename##*.}"
                local new_dest="$CLAUDE_COMMANDS_DIR/$new_name"
                cp "$source_file" "$new_dest"
                print_success "Installed as: $new_name"
                return 0
                ;;
            5)
                print_error "Installation aborted by user"
                exit 1
                ;;
            *)
                echo "Invalid option. Please choose 1-5."
                ;;
        esac
    done
}

# Function to install a single command
install_command() {
    local source_file=$1
    local filename=$(basename "$source_file")
    local dest_file="$CLAUDE_COMMANDS_DIR/$filename"
    
    if [ -f "$dest_file" ]; then
        # File exists, handle conflict
        handle_conflict "$source_file" "$dest_file"
    else
        # File doesn't exist, copy directly
        cp "$source_file" "$dest_file"
        print_success "Installed: $filename"
    fi
}

# Main installation function
main() {
    print_info "Claude Commands Installation Script"
    print_info "======================================"
    echo
    
    # Check if repository commands directory exists
    if [ ! -d "$REPO_COMMANDS_DIR" ]; then
        print_error "Commands directory not found: $REPO_COMMANDS_DIR"
        print_error "Commands directory not found. Please run this script from the claude-commands repository."
        exit 1
    fi
    
    # Check if there are any commands to install
    if [ ! "$(ls -A "$REPO_COMMANDS_DIR"/*.md 2>/dev/null)" ]; then
        print_error "No command files (*.md) found in: $REPO_COMMANDS_DIR"
        exit 1
    fi
    
    # Determine installation mode
    local install_mode="all"
    local selected_command=""
    
    if [ -n "$SINGLE_COMMAND" ]; then
        # Command specified as argument
        if validate_single_command "$SINGLE_COMMAND"; then
            install_mode="single"
            selected_command="$SINGLE_COMMAND"
            print_info "Installing single command: /$SINGLE_COMMAND"
        else
            exit 1
        fi
    else
        # Interactive selection - first ask mode, then command if needed
        local mode=$(ask_installation_mode)
        
        if [ "$mode" = "all" ]; then
            install_mode="all"
            selected_command=""
        else
            install_mode="single"
            echo
            selected_command=$(show_command_selection)
        fi
    fi
    
    echo
    
    # Display what will be installed
    if [ "$install_mode" = "all" ]; then
        local command_count=$(ls -1 "$REPO_COMMANDS_DIR"/*.md 2>/dev/null | wc -l)
        print_info "Installing ALL $command_count commands:"
        for cmd_file in "$REPO_COMMANDS_DIR"/*.md; do
            local cmd_name=$(basename "$cmd_file" .md)
            echo "  - /$cmd_name"
        done
    else
        print_info "Installing single command: /$selected_command"
    fi
    echo
    
    # Create Claude commands directory if it doesn't exist
    if [ ! -d "$CLAUDE_COMMANDS_DIR" ]; then
        print_info "Creating Claude commands directory: $CLAUDE_COMMANDS_DIR"
        mkdir -p "$CLAUDE_COMMANDS_DIR"
        print_success "Directory created successfully"
    else
        print_info "Using existing Claude commands directory: $CLAUDE_COMMANDS_DIR"
    fi
    echo
    
    # Ask for confirmation to proceed
    if ! ask_confirmation "Proceed with installation?" "y"; then
        print_info "Installation cancelled by user"
        exit 0
    fi
    echo
    
    # Create backup of existing commands (only if installing multiple or if single command exists)
    if [ "$install_mode" = "all" ] || [ -f "$CLAUDE_COMMANDS_DIR/${selected_command}.md" ]; then
        create_backup
        echo
    fi
    
    # Install commands
    print_info "Installing commands..."
    local installed_count=0
    
    if [ "$install_mode" = "all" ]; then
        # Install all commands
        for cmd_file in "$REPO_COMMANDS_DIR"/*.md; do
            if [ -f "$cmd_file" ]; then
                install_command "$cmd_file"
                ((installed_count++))
            fi
        done
    else
        # Install single command
        local cmd_file="$REPO_COMMANDS_DIR/${selected_command}.md"
        if [ -f "$cmd_file" ]; then
            install_command "$cmd_file"
            installed_count=1
        fi
    fi
    
    echo
    print_success "Installation completed!"
    print_info "Installed: $installed_count commands"
    
    if [ -d "$BACKUP_DIR" ]; then
        print_info "Backup available at: $BACKUP_DIR"
    fi
    
    echo
    print_info "Your custom Claude commands are now available:"
    echo "  Run 'claude --help' to see available commands"
    echo "  Use '/command-name' in Claude Code to execute commands"
    echo
    print_info "Script usage options:"
    echo "  ./install-commands.sh                    # Interactive selection"
    echo "  ./install-commands.sh sprint-setup       # Install single command"
    echo "  ./install-commands.sh velocity-report    # Install single command"
    echo
    if [ "$install_mode" = "single" ]; then
        print_info "Example usage for installed command:"
        case "$selected_command" in
            "sprint-setup") echo "  /$selected_command PROJ-SPRINT-15" ;;
            "error-analysis") echo "  /$selected_command 7d --severity=high" ;;
            "velocity-report") echo "  /$selected_command backend-team --period=quarterly" ;;
            "security-audit") echo "  /$selected_command --scope=all --severity=critical" ;;
            "epic-breakdown") echo "  /$selected_command PROJ-123 --include-designs" ;;
            *) echo "  /$selected_command [arguments]" ;;
        esac
    else
        print_info "Example usage:"
        echo "  /sprint-setup my-sprint"
        echo "  /error-analysis --severity=high"
        echo "  /velocity-report backend-team"
    fi
    echo
    print_success "Happy coding! 🚀"
}

# Error handling
trap 'print_error "An error occurred during installation. Check the output above for details."' ERR

# Run main function
main "$@"