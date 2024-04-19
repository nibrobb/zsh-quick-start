#!/usr/bin/sh

set +x

if [ 0 -eq 1 ]; then
    if [ ! -f $(which zsh) ]; then
        # Install zsh
        sudo apt install zsh
    fi
    
    if [ "$SHELL" != "$(which zsh)" ]; then
        # Set default shell to zsh
        chsh -s $(which zsh) 
    fi
    
    if [ ! omz ]; then
        # Install oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    
    # Install plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

echo "You need to manually enable the plugins in your .zshrc file
    plugins=(
        # other plugins...
        zsh-autosuggestions
        zsh-syntax-highlighting
    )
"


