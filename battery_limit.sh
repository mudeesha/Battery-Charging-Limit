#!/bin/bash

# Function to set charge limit
set_charge_limit() {
    if [ "$1" == "off" ]; then
        sudo tlp setcharge 0 0
        echo "Charge limit disabled."
    else
        sudo tlp setcharge "$1" "$1"
        echo "Charge limit set to $1%."
    fi
}

# Function to display the menu
show_menu() {
    echo "=========================="
    echo " Battery Charge Manager"
    echo "=========================="
    echo "1. Set charge limit to 60%"
    echo "2. Set charge limit to 80%"
    echo "3. Disable charge limit"
    echo "4. Exit"
    echo "=========================="
    echo -n "Enter your choice [1-4]: "
}

# Main menu loop
while true; do
    show_menu
    read -r choice
    case $choice in
        1)
            set_charge_limit 60
            ;;
        2)
            set_charge_limit 80
            ;;
        3)
            set_charge_limit off
            ;;
        4)
            echo "Exiting. Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
    echo ""
done

