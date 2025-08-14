#!/bin/bash

# Claude Commands Uninstallation Script
# This script removes commands from ~/.claude/commands
# Usage: ./uninstall-commands.sh [command-name] or interactive mode

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
BACKUP_DIR="$CLAUDE_COMMANDS_DIR/.uninstall-backup-$(date +%Y%m%d-%H%M%S)"
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

# Function to create backup before uninstallation
create_backup() {
    if [ -d "$CLAUDE_COMMANDS_DIR" ] && [ "$(ls -A "$CLAUDE_COMMANDS_DIR" 2>/dev/null)" ]; then
        print_info "Creating backup before uninstallation..."
        mkdir -p "$BACKUP_DIR"
        cp -r "$CLAUDE_COMMANDS_DIR"/* "$BACKUP_DIR/" 2>/dev/null || true
        print_success "Backup created at: $BACKUP_DIR"
        return 0
    fi
    return 1
}

# Function to list installed commands (from this repository)
list_installed_commands() {
    local installed_commands=()
    
    if [ ! -d "$CLAUDE_COMMANDS_DIR" ]; then
        return 0
    fi
    
    # Check which of our repository commands are currently installed
    for cmd_file in "$REPO_COMMANDS_DIR"/*.md; do
        if [ -f "$cmd_file" ]; then
            local cmd_name=$(basename "$cmd_file" .md)
            local installed_file="$CLAUDE_COMMANDS_DIR/${cmd_name}.md"
            if [ -f "$installed_file" ]; then
                installed_commands+=("$cmd_name")
            fi
        fi
    done
    
    echo "${installed_commands[@]}"
}

# Function to list all commands in Claude commands directory
list_all_claude_commands() {
    local all_commands=()
    
    if [ ! -d "$CLAUDE_COMMANDS_DIR" ]; then
        return 0
    fi
    
    for cmd_file in "$CLAUDE_COMMANDS_DIR"/*.md; do
        if [ -f "$cmd_file" ]; then
            local cmd_name=$(basename "$cmd_file" .md)
            all_commands+=("$cmd_name")
        fi
    done
    
    echo "${all_commands[@]}"
}

# Function to ask uninstallation mode (all vs single)
ask_uninstallation_mode() {
    local repo_commands=($(list_installed_commands))
    local repo_count=${#repo_commands[@]}
    
    if [ $repo_count -eq 0 ]; then
        print_warning "No commands from this repository are currently installed." >&2
        print_info "This script only removes commands that belong to the claude-commands repository." >&2
        return 1
    fi
    
    print_info "This script will only remove commands from the claude-commands repository." >&2
    print_info "Other commands you may have installed will remain untouched." >&2
    echo >&2
    
    while true; do
        print_info "Uninstallation Mode:" >&2
        echo >&2
        echo "1) Remove ALL repository commands ($repo_count total)" >&2
        echo "2) Remove a single command" >&2
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

# Function to show command selection menu (for single command removal)
show_command_selection() {
    local repo_commands=($(list_installed_commands))
    local repo_count=${#repo_commands[@]}
    
    while true; do
        print_info "Repository Commands Available for Removal:" >&2
        echo >&2
        
        for i in "${!repo_commands[@]}"; do
            local num=$((i + 1))
            local cmd_name="${repo_commands[$i]}"
            
            # Try to extract description from the repository command file
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
        
        read -p "Select command (1-$repo_count): " selection >&2
        
        if [[ "$selection" =~ ^[0-9]+$ ]] && [ "$selection" -ge 1 ] && [ "$selection" -le "$repo_count" ]; then
            local selected_index=$((selection - 1))
            echo "${repo_commands[$selected_index]}"
            return 0
        else
            print_warning "Invalid selection. Please choose a number between 1 and $repo_count." >&2
            echo >&2
        fi
    done
}


# Function to validate single command (repository commands only)
validate_command_exists() {
    local cmd_name=$1
    local cmd_file="$CLAUDE_COMMANDS_DIR/${cmd_name}.md"
    local repo_file="$REPO_COMMANDS_DIR/${cmd_name}.md"
    
    # Check if it's a repository command first
    if [ ! -f "$repo_file" ]; then
        print_error "Command '$cmd_name' is not from this repository!"
        print_info "This script only removes commands from the claude-commands repository."
        print_info "Available repository commands:"
        local repo_commands=($(list_installed_commands))
        if [ ${#repo_commands[@]} -eq 0 ]; then
            echo "  (none currently installed)"
        else
            for cmd in "${repo_commands[@]}"; do
                echo "  - $cmd"
            done
        fi
        return 1
    fi
    
    # Check if it's installed
    if [ ! -f "$cmd_file" ]; then
        print_error "Command '$cmd_name' is not currently installed!"
        print_info "Available repository commands:"
        local repo_commands=($(list_installed_commands))
        if [ ${#repo_commands[@]} -eq 0 ]; then
            echo "  (none currently installed)"
        else
            for cmd in "${repo_commands[@]}"; do
                echo "  - $cmd"
            done
        fi
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

# Function to remove a single command
remove_command() {
    local cmd_name=$1
    local cmd_file="$CLAUDE_COMMANDS_DIR/${cmd_name}.md"
    
    if [ -f "$cmd_file" ]; then
        rm "$cmd_file"
        print_success "Removed: /$cmd_name"
        return 0
    else
        print_warning "Command /$cmd_name was not found"
        return 1
    fi
}

# Function to remove multiple commands
remove_commands() {
    local commands=("$@")
    local removed_count=0
    local failed_count=0
    
    for cmd_name in "${commands[@]}"; do
        if remove_command "$cmd_name"; then
            ((removed_count++))
        else
            ((failed_count++))
        fi
    done
    
    echo
    print_info "Removal summary:"
    if [ $removed_count -gt 0 ]; then
        print_success "Successfully removed: $removed_count commands"
    fi
    if [ $failed_count -gt 0 ]; then
        print_warning "Failed to remove: $failed_count commands"
    fi
}

# Main uninstallation function
main() {
    print_info "Claude Commands Uninstallation Script"
    print_info "======================================"
    echo
    
    # Check if Claude commands directory exists
    if [ ! -d "$CLAUDE_COMMANDS_DIR" ]; then
        print_warning "Claude commands directory not found: $CLAUDE_COMMANDS_DIR"
        print_info "No commands to uninstall."
        exit 0
    fi
    
    # Check if there are any repository commands installed
    local repo_installed=($(list_installed_commands))
    if [ ${#repo_installed[@]} -eq 0 ]; then
        print_warning "No commands from this repository are currently installed."
        print_info "This script only removes commands from the claude-commands repository."
        
        # Show if there are other commands installed
        local all_installed=($(list_all_claude_commands))
        if [ ${#all_installed[@]} -gt 0 ]; then
            print_info "Other commands found in $CLAUDE_COMMANDS_DIR (will not be removed):"
            for cmd in "${all_installed[@]}"; do
                echo "  - /$cmd"
            done
        fi
        exit 0
    fi
    
    # Determine uninstallation mode
    local uninstall_mode=""
    local commands_to_remove=()
    
    if [ -n "$SINGLE_COMMAND" ]; then
        # Command specified as argument
        if validate_command_exists "$SINGLE_COMMAND"; then
            uninstall_mode="single"
            commands_to_remove=("$SINGLE_COMMAND")
            print_info "Uninstalling single command: /$SINGLE_COMMAND"
        else
            exit 1
        fi
    else
        # Interactive selection - first ask mode, then command if needed
        local mode=$(ask_uninstallation_mode)
        if [ $? -ne 0 ]; then
            exit 1
        fi
        
        if [ "$mode" = "all" ]; then
            uninstall_mode="repo-all"
            commands_to_remove=($(list_installed_commands))
        else
            uninstall_mode="single"
            echo
            local selected_command=$(show_command_selection)
            commands_to_remove=("$selected_command")
        fi
    fi
    
    echo
    
    # Display what will be removed
    if [ ${#commands_to_remove[@]} -eq 0 ]; then
        print_warning "No commands selected for removal."
        exit 0
    fi
    
    print_info "Commands to be removed (${#commands_to_remove[@]} total):"
    for cmd in "${commands_to_remove[@]}"; do
        echo "  - /$cmd"
    done
    echo
    
    # Ask for confirmation
    local confirmation_msg="Are you sure you want to remove these commands?"
    if [ ${#commands_to_remove[@]} -eq 1 ]; then
        confirmation_msg="Are you sure you want to remove /${commands_to_remove[0]}?"
    fi
    
    if ! ask_confirmation "$confirmation_msg" "y"; then
        print_info "Uninstallation cancelled by user"
        exit 0
    fi
    echo
    
    # Create backup
    if create_backup; then
        echo
    fi
    
    # Remove commands
    print_info "Removing commands..."
    remove_commands "${commands_to_remove[@]}"
    
    echo
    print_success "Uninstallation completed!"
    
    if [ -d "$BACKUP_DIR" ]; then
        print_info "Backup available at: $BACKUP_DIR"
        print_info "To restore: cp \"$BACKUP_DIR\"/* \"$CLAUDE_COMMANDS_DIR/\""
    fi
    
    echo
    print_info "Script usage options:"
    echo "  ./uninstall-commands.sh                  # Interactive selection"
    echo "  ./uninstall-commands.sh sprint-setup     # Remove single command"
    echo "  ./uninstall-commands.sh velocity-report  # Remove single command"
    echo
    
    # Check if any commands remain
    local remaining=($(list_all_claude_commands))
    if [ ${#remaining[@]} -eq 0 ]; then
        print_info "All Claude commands have been removed."
        print_info "Directory $CLAUDE_COMMANDS_DIR is now empty."
    else
        print_info "Remaining commands (${#remaining[@]}):"
        for cmd in "${remaining[@]}"; do
            echo "  - /$cmd"
        done
    fi
    
    echo
    print_success "Uninstallation complete! 🧹"
}

# Error handling
trap 'print_error "An error occurred during uninstallation. Check the output above for details."' ERR

# Run main function
main "$@"