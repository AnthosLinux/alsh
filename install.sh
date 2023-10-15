#!/bin/bash

# Color
ORANGE='\033[0;33m'
NC='\033[0m'

# Text types
bold=$(tput bold)
normal=$(tput sgr0)

echo -e "XENO SHELL INSTALLATION\n"
echo -e "Hello $USER\n"

while true; do
    read -p "1. Install this Shell? (yes or no): " choice
    case $choice in
        [Yy]* )
            echo "LCS SHELL Installation"
            echo ""

            user=$(whoami)
            dir=$(pwd)

            echo "Fish Shell coming soon..."
            echo ""
            echo "Your shell: $SHELL"

            if [ "$SHELL" == "/usr/bin/zsh" ]; then
                echo "function shellLCS(){" >> /home/$user/.zshrc
                echo " cd $dir" >> /home/$user/.zshrc
                echo "$PWD/main" >> /home/$user/.zshrc
                echo "}" >> /home/$user/.zshrc
                echo "shellLCS" >> /home/$user/.zshrc
            fi

            if [ "$SHELL" == "/bin/bash" ]; then
                echo "function shellLCS(){" >> /home/$user/.bashrc
                echo " cd $dir" >> /home/$user/.bashrc
                echo "$PWD/main" >> /home/$user/.bashrc
                echo "}" >> /home/$user/.bashrc
                echo "shellLCS" >> /home/$user/.bashrc
            fi

            echo ""
            echo -e "${ORANGE}${bold}Done! Now write ./a.out into your terminal!${normal}${NC}"
            echo -e "${ORANGE}${bold}And you need to know that this is Alpha version of LCS!${normal}${NC}"
            break
            ;;
        [Nn]* )
            echo "Installation aborted."
            exit
            ;;
        * )
            echo "Please answer yes or no."
            ;;
    esac
done

