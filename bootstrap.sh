#!/bin/bash

echo "Setting up .zshrc..."
rm -rf ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

echo "Setting up .envrc first run..."
rm -rf ~/.envrc
ln -s ~/.dotfiles/.envrc ~/.envrc

if grep -q "DOTFILES_FIRST_RUN" ~/.envrc; then
    sed -i '' 's/^DOTFILES_FIRST_RUN=.*/DOTFILES_FIRST_RUN=YES/' ~/.dotfiles/.envrc
else
    echo "DOTFILES_FIRST_RUN=YES" >> ~/.envrc
fi

echo "Setting up .gitconfig..."
if [ -f ~/.dotfiles/backup/.gitconfig ]; then
    cp ~/.dotfiles/backup/.gitconfig ~/.dotfiles/
fi

rm -rf ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

echo "Setting up .powerlevel10k..."
rm -rf ~/.p10k.zsh
ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

echo "Preventing the last login message..."
touch ~/.hushlogin
